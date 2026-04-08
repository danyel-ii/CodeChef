import 'package:agent_bridge/agent_bridge.dart';
import 'package:agent_mcp/agent_mcp.dart';
import 'package:execution_protocol/execution_protocol.dart';
import 'package:executor_broker/executor_broker.dart';
import 'package:operation_registry/operation_registry.dart';
import 'package:pack_core_text/pack_core_text.dart';
import 'package:test/test.dart';

void main() {
  late AgentMcpAdapter adapter;
  const AgentRequestContext context = AgentRequestContext(
    agentId: 'agent:mcp:test',
    transport: AgentTransport.mcp,
    hasUserConsent: true,
    visibleSession: true,
    sessionId: 'session-mcp-1',
  );

  setUp(() {
    final registry = PackLoader().load(const <OperationPack>[CoreTextPack()]);
    final runtime = HeadlessAgentRuntime(
      registry: registry,
      broker: ExecutorBroker(registry: registry),
      learningContent: coreTextLearningContent,
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
    adapter = AgentMcpAdapter(runtime);
  });

  test('exposes the expected MCP tools', () {
    final tools = adapter.listTools();
    expect(tools.map((McpToolDescriptor tool) => tool.name), contains('run_recipe'));
    expect(tools.map((McpToolDescriptor tool) => tool.name), contains('describe_operation'));
  });

  test('invokes run_single_operation with typed json arguments', () async {
    final result = await adapter.invoke(
      'run_single_operation',
      <String, Object?>{
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
      context,
    );

    final execution = result['execution'] as Map<String, Object?>;
    final output = execution['output'] as Map<String, Object?>;
    expect(output['data'], 'aGVsbG8=');
  });
}
