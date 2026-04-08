import 'package:agent_bridge/agent_bridge.dart';
import 'package:agent_mcp/agent_mcp.dart';
import 'package:agent_mcp_server/agent_mcp_server.dart';
import 'package:execution_protocol/execution_protocol.dart';
import 'package:executor_broker/executor_broker.dart';
import 'package:operation_registry/operation_registry.dart';
import 'package:pack_core_cipher/pack_core_cipher.dart';
import 'package:pack_core_format/pack_core_format.dart';
import 'package:pack_core_hash/pack_core_hash.dart';
import 'package:pack_core_text/pack_core_text.dart';
import 'package:pack_learning_content/pack_learning_content.dart';
import 'package:test/test.dart';

void main() {
  late AgentMcpServer server;

  setUp(() {
    final registry = PackLoader().load(const <OperationPack>[
      CoreTextPack(),
      CoreCipherPack(),
      CoreHashPack(),
      CoreFormatPack(),
    ]);
    final runtime = HeadlessAgentRuntime(
      registry: registry,
      broker: ExecutorBroker(registry: registry),
      learningContent: <String, OperationLearningContent>{
        ...coreTextLearningContent,
        ...coreCipherLearningContent,
        ...coreHashLearningContent,
        ...coreFormatLearningContent,
      },
      permissionPolicy: const AgentPermissionPolicy(
        allowedTools: <AgentTool>{
          AgentTool.listPacks,
          AgentTool.listOperations,
          AgentTool.searchOperations,
          AgentTool.describeOperation,
          AgentTool.validateRecipe,
          AgentTool.runRecipe,
          AgentTool.runSingleOperation,
          AgentTool.loadLearningContent,
        },
        approvalMode: AgentApprovalMode.session,
      ),
    );
    server = AgentMcpServer(
      adapter: AgentMcpAdapter(runtime),
      contextFactory: (
        String toolName,
        Map<String, Object?> args,
      ) {
        return const AgentRequestContext(
          agentId: 'agent:test',
          transport: AgentTransport.mcp,
          hasUserConsent: true,
          visibleSession: true,
          sessionId: 'session-1',
          purpose: 'unit test',
        );
      },
    );
  });

  test('returns initialize response with tool capability', () async {
    final response = await server.handleRequest(<String, Object?>{
      'jsonrpc': '2.0',
      'id': 1,
      'method': 'initialize',
      'params': <String, Object?>{},
    });

    expect(response?['result'], isA<Map<String, Object?>>());
  });

  test('lists MCP tools', () async {
    final response = await server.handleRequest(<String, Object?>{
      'jsonrpc': '2.0',
      'id': 2,
      'method': 'tools/list',
      'params': <String, Object?>{},
    });
    final result = response?['result'] as Map<String, Object?>;
    final tools = result['tools'] as List<Object?>;
    expect(tools, isNotEmpty);
  });

  test('default host runtime exposes multiple installed packs', () async {
    final response = await server.handleRequest(<String, Object?>{
      'jsonrpc': '2.0',
      'id': 4,
      'method': 'tools/call',
      'params': <String, Object?>{
        'name': 'list_packs',
        'arguments': <String, Object?>{},
      },
    });
    final result = response?['result'] as Map<String, Object?>;
    final structured = result['structuredContent'] as Map<String, Object?>;
    final packs = structured['packs'] as List<Object?>;
    expect(packs.length, greaterThanOrEqualTo(4));
  });

  test('invokes tool call and returns structured content', () async {
    final response = await server.handleRequest(<String, Object?>{
      'jsonrpc': '2.0',
      'id': 3,
      'method': 'tools/call',
      'params': <String, Object?>{
        'name': 'run_single_operation',
        'arguments': <String, Object?>{
          'operationId': 'core.text.base64.encode',
          'input': <String, Object?>{
            'kind': 'text',
            'sizeBytes': 5,
            'data': 'hello',
            'mediaType': 'text/plain',
            'characterEncoding': 'utf-8',
            'meta': <String, Object?>{},
          },
          'params': <String, Object?>{},
        },
      },
    });
    final result = response?['result'] as Map<String, Object?>;
    expect(result['isError'], isFalse);
    final structured = result['structuredContent'] as Map<String, Object?>;
    final execution = structured['execution'] as Map<String, Object?>;
    final output = execution['output'] as Map<String, Object?>;
    expect(output['data'], 'aGVsbG8=');
  });
}
