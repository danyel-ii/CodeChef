import 'package:agent_bridge/agent_bridge.dart';
import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_learning_content/pack_learning_content.dart';
import 'package:recipe_domain/recipe_domain.dart';

class McpToolDescriptor {
  const McpToolDescriptor({
    required this.name,
    required this.description,
    required this.inputSchema,
  });

  final String name;
  final String description;
  final Map<String, Object?> inputSchema;

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'name': name,
      'description': description,
      'inputSchema': inputSchema,
    };
  }
}

class AgentMcpException implements Exception {
  const AgentMcpException(this.message);

  final String message;

  @override
  String toString() => 'AgentMcpException: $message';
}

class AgentMcpAdapter {
  const AgentMcpAdapter(this._runtime);

  final HeadlessAgentRuntime _runtime;

  static const List<McpToolDescriptor> toolDescriptors = <McpToolDescriptor>[
    McpToolDescriptor(
      name: 'list_packs',
      description: 'List installed Code Chef packs and their operation ids.',
      inputSchema: <String, Object?>{
        'type': 'object',
        'properties': <String, Object?>{},
      },
    ),
    McpToolDescriptor(
      name: 'list_operations',
      description: 'List all installed operations with pack and manifest metadata.',
      inputSchema: <String, Object?>{
        'type': 'object',
        'properties': <String, Object?>{},
      },
    ),
    McpToolDescriptor(
      name: 'search_operations',
      description: 'Search installed operations by id, title, category, or tags.',
      inputSchema: <String, Object?>{
        'type': 'object',
        'required': <String>['query'],
        'properties': <String, Object?>{
          'query': <String, Object?>{'type': 'string'},
        },
      },
    ),
    McpToolDescriptor(
      name: 'describe_operation',
      description: 'Return a full operation manifest plus learning content.',
      inputSchema: <String, Object?>{
        'type': 'object',
        'required': <String>['operationId'],
        'properties': <String, Object?>{
          'operationId': <String, Object?>{'type': 'string'},
          'versionRange': <String, Object?>{'type': 'string'},
        },
      },
    ),
    McpToolDescriptor(
      name: 'validate_recipe',
      description: 'Validate a recipe document against manifests and registry state.',
      inputSchema: <String, Object?>{
        'type': 'object',
        'required': <String>['recipe'],
        'properties': <String, Object?>{
          'recipe': <String, Object?>{'type': 'object'},
        },
      },
    ),
    McpToolDescriptor(
      name: 'run_recipe',
      description: 'Run a recipe against an input payload and return typed result data.',
      inputSchema: <String, Object?>{
        'type': 'object',
        'required': <String>['recipe', 'input'],
        'properties': <String, Object?>{
          'recipe': <String, Object?>{'type': 'object'},
          'input': <String, Object?>{'type': 'object'},
          'previewMode': <String, Object?>{'type': 'boolean'},
          'previewOutputByteLimit': <String, Object?>{'type': 'integer'},
        },
      },
    ),
    McpToolDescriptor(
      name: 'run_single_operation',
      description: 'Run a single operation with params against an input payload.',
      inputSchema: <String, Object?>{
        'type': 'object',
        'required': <String>['operationId', 'input', 'params'],
        'properties': <String, Object?>{
          'operationId': <String, Object?>{'type': 'string'},
          'versionRange': <String, Object?>{'type': 'string'},
          'input': <String, Object?>{'type': 'object'},
          'params': <String, Object?>{'type': 'object'},
        },
      },
    ),
    McpToolDescriptor(
      name: 'load_learning_content',
      description: 'Load explanation and examples for an installed operation.',
      inputSchema: <String, Object?>{
        'type': 'object',
        'required': <String>['operationId'],
        'properties': <String, Object?>{
          'operationId': <String, Object?>{'type': 'string'},
        },
      },
    ),
  ];

  List<McpToolDescriptor> listTools() => toolDescriptors;

  Future<Map<String, Object?>> invoke(
    String toolName,
    Map<String, Object?> args,
    AgentRequestContext context,
  ) async {
    switch (toolName) {
      case 'list_packs':
        final packs = await _runtime.listPacks(context);
        return <String, Object?>{
          'packs': packs.map((AgentPackDescriptor pack) => pack.toJson()).toList(growable: false),
        };
      case 'list_operations':
        final operations = await _runtime.listOperations(context);
        return <String, Object?>{
          'operations': operations
              .map((AgentOperationSummary operation) => operation.toJson())
              .toList(growable: false),
        };
      case 'search_operations':
        final query = _readString(args, 'query');
        final operations = await _runtime.searchOperations(query, context);
        return <String, Object?>{
          'operations': operations
              .map((AgentOperationSummary operation) => operation.toJson())
              .toList(growable: false),
        };
      case 'describe_operation':
        final description = await _runtime.describeOperation(
          _readString(args, 'operationId'),
          context,
          versionRange: (args['versionRange'] as String?) ?? '^1.0.0',
        );
        return description.toJson();
      case 'validate_recipe':
        final validation = await _runtime.validateRecipe(
          RecipeDocument.fromJson(_readJsonMap(args, 'recipe')),
          context,
        );
        return validation.toJson();
      case 'run_recipe':
        final result = await _runtime.runRecipe(
          RecipeDocument.fromJson(_readJsonMap(args, 'recipe')),
          PayloadEnvelope.fromJson(_readJsonMap(args, 'input')),
          context,
          previewMode: args['previewMode'] as bool? ?? false,
          previewOutputByteLimit: args['previewOutputByteLimit'] as int?,
        );
        return result.toJson();
      case 'run_single_operation':
        final result = await _runtime.runSingleOperation(
          _readString(args, 'operationId'),
          PayloadEnvelope.fromJson(_readJsonMap(args, 'input')),
          _readObjectMap(args, 'params'),
          context,
          versionRange: (args['versionRange'] as String?) ?? '^1.0.0',
        );
        return result.toJson();
      case 'load_learning_content':
        final learning = await _runtime.loadLearningContent(
          _readString(args, 'operationId'),
          context,
        );
        return <String, Object?>{
          'learningContent': learning == null ? null : _learningContentToJson(learning),
        };
    }
    throw AgentMcpException('Unknown MCP tool: $toolName');
  }

  static String _readString(Map<String, Object?> args, String key) {
    final value = args[key];
    if (value is String && value.isNotEmpty) {
      return value;
    }
    throw AgentMcpException('Missing required string argument: $key');
  }

  static Map<String, dynamic> _readJsonMap(Map<String, Object?> args, String key) {
    final value = args[key];
    if (value is Map<String, dynamic>) {
      return value;
    }
    if (value is Map<Object?, Object?>) {
      return value.map<String, dynamic>(
        (Object? mapKey, Object? mapValue) => MapEntry(mapKey! as String, mapValue),
      );
    }
    throw AgentMcpException('Missing required object argument: $key');
  }

  static Map<String, Object?> _readObjectMap(Map<String, Object?> args, String key) {
    final value = args[key];
    if (value is Map<String, Object?>) {
      return value;
    }
    if (value is Map<Object?, Object?>) {
      return value.map<String, Object?>(
        (Object? mapKey, Object? mapValue) => MapEntry(mapKey! as String, mapValue),
      );
    }
    throw AgentMcpException('Missing required params object: $key');
  }

  static Map<String, Object?> _learningContentToJson(
    OperationLearningContent learning,
  ) {
    return <String, Object?>{
      'operationId': learning.operationId,
      'whatItDoes': learning.whatItDoes,
      'whenToUse': learning.whenToUse,
      'gotchas': learning.gotchas,
      'howItWorks': learning.howItWorks,
      'examples': learning.examples
          .map(
            (LearningExample example) => <String, Object?>{
              'title': example.title,
              'input': example.input,
              'params': example.params,
              'expectedOutputText': example.expectedOutputText,
            },
          )
          .toList(growable: false),
      'relatedOperations': learning.relatedOperations,
    };
  }
}
