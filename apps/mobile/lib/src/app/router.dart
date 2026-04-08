import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_recipe_lab_mobile/src/features/agent/agent_access_controller.dart';
import 'package:mobile_recipe_lab_mobile/src/features/documents/pdf_deck_catalog.dart';
import 'package:mobile_recipe_lab_mobile/src/features/documents/pdf_viewer_screen.dart';
import 'package:mobile_recipe_lab_mobile/src/features/home/home_screen.dart';
import 'package:mobile_recipe_lab_mobile/src/features/library/library_screen.dart';
import 'package:mobile_recipe_lab_mobile/src/features/settings/settings_screen.dart';
import 'package:mobile_recipe_lab_mobile/src/features/workbench/workbench_screen.dart';

final goRouterProvider = Provider<GoRouter>((Ref ref) {
  return GoRouter(
    initialLocation: '/workbench',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return AppScaffold(navigationShell: navigationShell);
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/home',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _buildPage(
                    key: state.pageKey,
                    child: const HomeScreen(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/workbench',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _buildPage(
                    key: state.pageKey,
                    child: const WorkbenchScreen(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/library',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _buildPage(
                    key: state.pageKey,
                    child: const LibraryScreen(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: '/settings',
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return _buildPage(
                    key: state.pageKey,
                    child: const SettingsScreen(),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/documents/pdf',
        pageBuilder: (BuildContext context, GoRouterState state) {
          final PdfDeck? deck = state.extra as PdfDeck?;
          if (deck == null) {
            return _buildPage(
              key: state.pageKey,
              child: const _MissingPdfScreen(),
            );
          }
          return _buildPage(
            key: state.pageKey,
            child: PdfViewerScreen(deck: deck),
          );
        },
      ),
    ],
  );
});

Page<void> _buildPage({
  required LocalKey key,
  required Widget child,
}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) {
      final CurvedAnimation curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutCubic,
      );
      return FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 0.025),
            end: Offset.zero,
          ).animate(curved),
          child: child,
        ),
      );
    },
  );
}

class _MissingPdfScreen extends StatelessWidget {
  const _MissingPdfScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('PDF deck not found.'),
      ),
    );
  }
}

class AppScaffold extends ConsumerStatefulWidget {
  const AppScaffold({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends ConsumerState<AppScaffold> {
  String? _shownApprovalId;

  @override
  Widget build(BuildContext context) {
    final agentAccess = ref.watch(agentAccessControllerProvider);
    ref.listen<AsyncValue<AgentAccessState>>(agentAccessControllerProvider, (
      AsyncValue<AgentAccessState>? previous,
      AsyncValue<AgentAccessState> next,
    ) {
      final AgentApprovalRequest? pendingApproval = next.valueOrNull?.pendingApproval;
      if (pendingApproval == null || _shownApprovalId == pendingApproval.requestId) {
        return;
      }
      _shownApprovalId = pendingApproval.requestId;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Approve Agent Action'),
              content: Text(
                '${pendingApproval.context.agentId} wants to use ${pendingApproval.tool.name} via ${pendingApproval.context.transport.name.toUpperCase()}.\n\nPurpose: ${pendingApproval.context.purpose ?? 'Not provided'}',
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    ref
                        .read(agentAccessControllerProvider.notifier)
                        .resolvePendingApproval(false);
                    _shownApprovalId = null;
                  },
                  child: const Text('Deny'),
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    ref
                        .read(agentAccessControllerProvider.notifier)
                        .resolvePendingApproval(true);
                    _shownApprovalId = null;
                  },
                  child: const Text('Allow'),
                ),
              ],
            );
          },
        );
      });
    });
    return Scaffold(
      body: Column(
        children: <Widget>[
          agentAccess.when(
            data: (AgentAccessState value) {
              final activeSession = value.activeSession;
              if (activeSession == null) {
                return const SizedBox.shrink();
              }
              return Material(
                color: const Color(0xFFF4E06D),
                child: SafeArea(
                  bottom: false,
                  child: ListTile(
                    dense: true,
                    leading: const Icon(Icons.smart_toy_outlined,
                        color: Color(0xFF171311)),
                    title: const Text(
                      'Agent session active',
                      style: TextStyle(
                        color: Color(0xFF171311),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Text(
                      '${activeSession.transport.name.toUpperCase()} • ${activeSession.agentId}',
                      style: const TextStyle(color: Color(0xFF171311)),
                    ),
                    trailing: TextButton(
                      onPressed: () {
                        ref
                            .read(agentAccessControllerProvider.notifier)
                            .endActiveSession();
                      },
                      child: const Text('End'),
                    ),
                  ),
                ),
              );
            },
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
          Expanded(child: widget.navigationShell),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: (int index) {
          widget.navigationShell.goBranch(
            index,
            initialLocation: index == widget.navigationShell.currentIndex,
          );
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.science_outlined),
            selectedIcon: Icon(Icons.science),
            label: 'Workbench',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_outline),
            selectedIcon: Icon(Icons.bookmark),
            label: 'Library',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
