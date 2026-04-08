import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:agent_bridge/agent_bridge.dart';
import 'package:agent_mcp/agent_mcp.dart';

typedef AgentRequestContextFactory = FutureOr<AgentRequestContext> Function(
  String toolName,
  Map<String, Object?> args,
);

class McpServerException implements Exception {
  const McpServerException(this.code, this.message);

  final int code;
  final String message;
}

class AgentMcpServer {
  AgentMcpServer({
    required AgentMcpAdapter adapter,
    required AgentRequestContextFactory contextFactory,
    String serverName = 'code-chef-agent',
    String serverVersion = '0.1.0',
  })  : _adapter = adapter,
        _contextFactory = contextFactory,
        _serverName = serverName,
        _serverVersion = serverVersion;

  final AgentMcpAdapter _adapter;
  final AgentRequestContextFactory _contextFactory;
  final String _serverName;
  final String _serverVersion;

  Future<void> serveStdio() async {
    final _ContentLengthFrameReader reader = _ContentLengthFrameReader(stdin);
    await for (final String body in reader.messages) {
      final dynamic decoded = jsonDecode(body);
      if (decoded is! Map<String, Object?>) {
        continue;
      }
      final Map<String, Object?>? response = await handleRequest(decoded);
      if (response == null) {
        continue;
      }
      final String responseBody = jsonEncode(response);
      final List<int> bytes = utf8.encode(responseBody);
      stdout.write('Content-Length: ${bytes.length}\r\n\r\n');
      stdout.add(bytes);
      await stdout.flush();
    }
  }

  Future<Map<String, Object?>?> handleRequest(
    Map<String, Object?> request,
  ) async {
    final Object? id = request['id'];
    final String? method = request['method'] as String?;
    final Map<String, Object?> params =
        _objectMap(request['params']) ?? const <String, Object?>{};

    if (method == null) {
      if (id == null) {
        return null;
      }
      return _error(id, -32600, 'Invalid request.');
    }

    try {
      switch (method) {
        case 'initialize':
          return _result(id, <String, Object?>{
            'protocolVersion': '2024-11-05',
            'serverInfo': <String, Object?>{
              'name': _serverName,
              'version': _serverVersion,
            },
            'capabilities': <String, Object?>{
              'tools': <String, Object?>{},
            },
          });
        case 'notifications/initialized':
          return null;
        case 'tools/list':
          return _result(id, <String, Object?>{
            'tools': _adapter
                .listTools()
                .map((McpToolDescriptor tool) => tool.toJson())
                .toList(growable: false),
          });
        case 'tools/call':
          final String toolName = params['name'] as String? ?? '';
          final Map<String, Object?> args =
              _objectMap(params['arguments']) ?? const <String, Object?>{};
          final AgentRequestContext context =
              await _contextFactory(toolName, args);
          final Map<String, Object?> result =
              await _adapter.invoke(toolName, args, context);
          return _result(id, <String, Object?>{
            'content': <Map<String, Object?>>[
              <String, Object?>{
                'type': 'text',
                'text': const JsonEncoder.withIndent('  ').convert(result),
              },
            ],
            'structuredContent': result,
            'isError': false,
          });
      }
      throw const McpServerException(-32601, 'Method not found.');
    } on AgentBridgeException catch (error) {
      return _toolError(id, error.message);
    } on AgentMcpException catch (error) {
      return _toolError(id, error.message);
    } on McpServerException catch (error) {
      return _error(id, error.code, error.message);
    } catch (error) {
      return _error(id, -32603, error.toString());
    }
  }

  Map<String, Object?> _result(Object? id, Map<String, Object?> result) {
    return <String, Object?>{
      'jsonrpc': '2.0',
      'id': id,
      'result': result,
    };
  }

  Map<String, Object?> _toolError(Object? id, String message) {
    return _result(id, <String, Object?>{
      'content': <Map<String, Object?>>[
        <String, Object?>{
          'type': 'text',
          'text': message,
        },
      ],
      'isError': true,
    });
  }

  Map<String, Object?> _error(Object? id, int code, String message) {
    return <String, Object?>{
      'jsonrpc': '2.0',
      'id': id,
      'error': <String, Object?>{
        'code': code,
        'message': message,
      },
    };
  }

  Map<String, Object?>? _objectMap(Object? value) {
    if (value is Map<String, Object?>) {
      return value;
    }
    if (value is Map<Object?, Object?>) {
      return value.map<String, Object?>(
        (Object? key, Object? mapValue) => MapEntry(key! as String, mapValue),
      );
    }
    return null;
  }
}

class _ContentLengthFrameReader {
  _ContentLengthFrameReader(Stream<List<int>> input)
      : messages = (() async* {
          final StreamIterator<List<int>> iterator = StreamIterator<List<int>>(input);
          final List<int> buffer = <int>[];
          while (await iterator.moveNext()) {
            buffer.addAll(iterator.current);
            while (true) {
              final int headerEnd = _indexOfHeaderSeparator(buffer);
              if (headerEnd == -1) {
                break;
              }
              final String headerText = utf8.decode(buffer.sublist(0, headerEnd));
              final int contentLength = _parseContentLength(headerText);
              final int bodyStart = headerEnd + 4;
              if (buffer.length < bodyStart + contentLength) {
                break;
              }
              final String body = utf8.decode(
                buffer.sublist(bodyStart, bodyStart + contentLength),
              );
              buffer.removeRange(0, bodyStart + contentLength);
              yield body;
            }
          }
        })();

  final Stream<String> messages;

  static int _indexOfHeaderSeparator(List<int> buffer) {
    for (int index = 0; index <= buffer.length - 4; index++) {
      if (buffer[index] == 13 &&
          buffer[index + 1] == 10 &&
          buffer[index + 2] == 13 &&
          buffer[index + 3] == 10) {
        return index;
      }
    }
    return -1;
  }

  static int _parseContentLength(String headerText) {
    final List<String> lines = headerText.split('\r\n');
    for (final String line in lines) {
      final int separator = line.indexOf(':');
      if (separator == -1) {
        continue;
      }
      final String name = line.substring(0, separator).trim().toLowerCase();
      if (name != 'content-length') {
        continue;
      }
      return int.parse(line.substring(separator + 1).trim());
    }
    throw const McpServerException(-32700, 'Missing Content-Length header.');
  }
}
