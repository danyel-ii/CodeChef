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

Future<void> main() async {
  final List<OperationPack> packs = const <OperationPack>[
    CoreTextPack(),
    CoreCipherPack(),
    CoreHashPack(),
    CoreFormatPack(),
  ];
  final Map<String, OperationLearningContent> learningContent =
      <String, OperationLearningContent>{
    ...coreTextLearningContent,
    ...coreCipherLearningContent,
    ...coreHashLearningContent,
    ...coreFormatLearningContent,
  };
  final registry = PackLoader().load(packs);
  final runtime = HeadlessAgentRuntime(
    registry: registry,
    broker: ExecutorBroker(registry: registry),
    learningContent: learningContent,
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
      approvalMode: AgentApprovalMode.none,
      requireVisibleSession: false,
    ),
  );
  final server = AgentMcpServer(
    adapter: AgentMcpAdapter(runtime),
    contextFactory: (
      String toolName,
      Map<String, Object?> args,
    ) {
      return const AgentRequestContext(
        agentId: 'agent_mcp_server',
        transport: AgentTransport.mcp,
        hasUserConsent: true,
        visibleSession: true,
        sessionId: 'cli-session',
        purpose: 'CLI MCP server request',
      );
    },
  );
  await server.serveStdio();
}
