import 'package:agent_bridge/agent_bridge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_recipe_lab_mobile/src/features/agent/agent_access_controller.dart';
import 'package:mobile_recipe_lab_mobile/src/features/documents/pdf_deck_catalog.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agentAccess = ref.watch(agentAccessControllerProvider);
    return SafeArea(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 1.5,
            colors: <Color>[
              Color(0xFF17322B),
              Color(0xFF0F1514),
              Color(0xFF090807),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Settings', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 8),
              Text(
                'Local-first defaults, toolchain status, and product rules.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 18),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 430),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: const Color(0xFF11100E),
                      borderRadius: BorderRadius.circular(34),
                      border: Border.all(color: const Color(0x22FFFFFF)),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Color(0x80000000),
                          blurRadius: 30,
                          offset: Offset(0, 18),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(34),
                      child: Column(
                        children: <Widget>[
                          const _SettingsBand(
                            background: Color(0xFFF4F0E8),
                            textColor: Color(0xFF171311),
                            title: 'LOCAL-FIRST',
                            body:
                                'Recipes and payload transforms stay on device. No remote execution is wired into this build.',
                          ),
                          const _SettingsBand(
                            background: Color(0xFFF1DE6C),
                            textColor: Color(0xFF171311),
                            title: 'ENGINE',
                            body:
                                'Operations run through the registry and executor stack, with isolate routing preserved for heavier work.',
                          ),
                          const _SettingsBand(
                            background: Color(0xFF9366AE),
                            textColor: Color(0xFFF7F3E9),
                            title: 'STATUS',
                            body:
                                'Android is the primary release target here, with the GitHub APK pipeline and mobile workflow actively maintained.',
                          ),
                          _SettingsBand(
                            background: const Color(0xFFE37BA3),
                            textColor: const Color(0xFF171311),
                            title: 'ABOUT',
                            body:
                                'Open the bundled Code Chef blueprint slide deck from inside the app.',
                            actionLabel: 'Open Blueprint PDF',
                            onAction: () async {
                              if (!context.mounted) {
                                return;
                              }
                              context.push('/documents/pdf', extra: aboutBlueprintDeck);
                            },
                          ),
                          _AgentAccessBand(agentAccess: agentAccess),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AgentAccessBand extends ConsumerWidget {
  const _AgentAccessBand({required this.agentAccess});

  final AsyncValue<AgentAccessState> agentAccess;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return agentAccess.when(
      loading: () => const _SettingsBand(
        background: Color(0xFF1C2E3E),
        textColor: Color(0xFFF7F3E9),
        title: 'AGENT ACCESS',
        body: 'Loading local consent, session, and audit state.',
      ),
      error: (Object error, StackTrace stackTrace) => _SettingsBand(
        background: const Color(0xFF1C2E3E),
        textColor: const Color(0xFFF7F3E9),
        title: 'AGENT ACCESS',
        body: 'Unable to load agent settings.\n$error',
      ),
      data: (AgentAccessState value) {
        final controller = ref.read(agentAccessControllerProvider.notifier);
        final activeSession = value.activeSession;
        return Container(
          width: double.infinity,
          color: const Color(0xFF1C2E3E),
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'AGENT ACCESS',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFF7F3E9),
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Control whether external MCP or HTTPS agent surfaces can discover, validate, and execute recipes from this device.',
                style: GoogleFonts.ibmPlexMono(
                  fontSize: 14,
                  height: 1.4,
                  color: const Color(0xFFF7F3E9),
                ),
              ),
              const SizedBox(height: 16),
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                value: value.settings.agentAccessEnabled,
                onChanged: controller.setAgentAccessEnabled,
                title: const Text('Enable agent access'),
                subtitle: const Text('Turn on machine-facing runtime access.'),
              ),
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                value: value.settings.requireVisibleSession,
                onChanged: value.settings.agentAccessEnabled
                    ? controller.setRequireVisibleSession
                    : null,
                title: const Text('Require visible session'),
                subtitle:
                    const Text('Block execution unless the app shows an active agent session.'),
              ),
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                value: value.settings.allowDiscoveryWithoutConsent,
                onChanged: value.settings.agentAccessEnabled
                    ? controller.setAllowDiscoveryWithoutConsent
                    : null,
                title: const Text('Allow discovery before consent'),
                subtitle: const Text('Permit pack and operation lookup before execution consent.'),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<AgentApprovalMode>(
                initialValue: value.settings.approvalMode,
                decoration: const InputDecoration(
                  labelText: 'Approval mode',
                ),
                items: AgentApprovalMode.values
                    .map(
                      (AgentApprovalMode mode) => DropdownMenuItem<AgentApprovalMode>(
                        value: mode,
                        child: Text(mode.name),
                      ),
                    )
                    .toList(growable: false),
                onChanged: value.settings.agentAccessEnabled
                    ? (AgentApprovalMode? mode) {
                        if (mode != null) {
                          controller.setApprovalMode(mode);
                        }
                      }
                    : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<int>(
                initialValue: value.settings.auditRetentionDays,
                decoration: const InputDecoration(
                  labelText: 'Audit retention',
                ),
                items: const <int>[7, 14, 30, 90]
                    .map(
                      (int days) => DropdownMenuItem<int>(
                        value: days,
                        child: Text('$days days'),
                      ),
                    )
                    .toList(growable: false),
                onChanged: (int? days) {
                  if (days != null) {
                    controller.setAuditRetentionDays(days);
                  }
                },
              ),
              const SizedBox(height: 16),
              if (activeSession == null)
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: <Widget>[
                    FilledButton(
                      onPressed: value.settings.agentAccessEnabled
                          ? () {
                              controller.startVisibleSession(
                                transport: AgentTransport.mcp,
                                purpose: 'On-device MCP consent window',
                              );
                            }
                          : null,
                      child: const Text('Start MCP Session'),
                    ),
                    OutlinedButton(
                      onPressed: value.settings.agentAccessEnabled
                          ? () {
                              controller.startVisibleSession(
                                transport: AgentTransport.https,
                                purpose: 'On-device HTTPS consent window',
                              );
                            }
                          : null,
                      child: const Text('Start HTTPS Session'),
                    ),
                  ],
                )
              else
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0x14FFFFFF),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0x22FFFFFF)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Active session: ${activeSession.transport.name.toUpperCase()}',
                        style: GoogleFonts.spaceGrotesk(
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFF7F3E9),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${activeSession.agentId} • ${activeSession.purpose ?? 'No purpose set'}',
                        style: GoogleFonts.ibmPlexMono(
                          color: const Color(0xFFD7D0C2),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 10),
                      FilledButton.tonal(
                        onPressed: controller.endActiveSession,
                        child: const Text('End Active Session'),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 18),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Recent audit trail',
                      style: GoogleFonts.spaceGrotesk(
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFF7F3E9),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: value.auditEntries.isEmpty
                        ? null
                        : () async {
                            final savedPath = await controller.exportAuditTrail();
                            if (context.mounted && savedPath != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Audit trail saved to $savedPath'),
                                ),
                              );
                            }
                          },
                    child: const Text('Export'),
                  ),
                  TextButton(
                    onPressed: value.auditEntries.isEmpty
                        ? null
                        : controller.clearAuditTrail,
                    child: const Text('Clear'),
                  ),
                ],
              ),
              if (value.auditEntries.isEmpty)
                Text(
                  'No agent activity recorded yet.',
                  style: GoogleFonts.ibmPlexMono(
                    color: const Color(0xFFD7D0C2),
                    fontSize: 13,
                  ),
                )
              else
                ...value.auditEntries.take(5).map(
                      (AgentAuditEntry entry) => Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          '${entry.occurredAt.toLocal()} • ${entry.tool.name} • ${entry.allowed ? 'allowed' : 'denied'}',
                          style: GoogleFonts.ibmPlexMono(
                            color: const Color(0xFFD7D0C2),
                            fontSize: 12,
                            height: 1.35,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}

class _SettingsBand extends StatelessWidget {
  const _SettingsBand({
    required this.background,
    required this.textColor,
    required this.title,
    required this.body,
    this.actionLabel,
    this.onAction,
  });

  final Color background;
  final Color textColor;
  final String title;
  final String body;
  final String? actionLabel;
  final Future<void> Function()? onAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: background,
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: textColor,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            body,
            style: GoogleFonts.ibmPlexMono(
              fontSize: 14,
              height: 1.4,
              color: textColor,
            ),
          ),
          if (actionLabel != null && onAction != null) ...<Widget>[
            const SizedBox(height: 14),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: textColor,
                foregroundColor: background,
              ),
              onPressed: onAction,
              child: Text(actionLabel!),
            ),
          ],
        ],
      ),
    );
  }
}
