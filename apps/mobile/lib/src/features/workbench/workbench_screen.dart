import 'package:design_system/design_system.dart';
import 'package:execution_protocol/execution_protocol.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_recipe_lab_mobile/src/features/workbench/workbench_controller.dart';
import 'package:operation_registry/operation_registry.dart';
import 'package:recipe_domain/recipe_domain.dart';

class WorkbenchScreen extends ConsumerStatefulWidget {
  const WorkbenchScreen({super.key});

  @override
  ConsumerState<WorkbenchScreen> createState() => _WorkbenchScreenState();
}

class _WorkbenchScreenState extends ConsumerState<WorkbenchScreen> {
  late final TextEditingController _inputController;
  late final TextEditingController _titleController;

  @override
  void initState() {
    super.initState();
    final state = ref.read(workbenchControllerProvider);
    _inputController = TextEditingController(text: state.input);
    _titleController = TextEditingController(text: state.recipeTitle);
  }

  @override
  void dispose() {
    _inputController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<WorkbenchState>(workbenchControllerProvider, (
      WorkbenchState? previous,
      WorkbenchState next,
    ) {
      if (_inputController.text != next.input) {
        _inputController.text = next.input;
      }
      if (_titleController.text != next.recipeTitle) {
        _titleController.text = next.recipeTitle;
      }
    });

    final state = ref.watch(workbenchControllerProvider);
    final controller = ref.read(workbenchControllerProvider.notifier);
    final operations = ref.watch(availableOperationsProvider);
    final registry = ref.watch(operationRegistryProvider);

    return SafeArea(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 1.45,
            colors: <Color>[
              Color(0xFF2A2013),
              Color(0xFF120E0B),
              Color(0xFF090807),
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Workbench',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                IconButton(
                  tooltip: 'Open saved recipes',
                  onPressed: () => context.go('/library'),
                  icon: const Icon(Icons.folder_open),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              'Build, test, save, and explain transformation recipes one step at a time.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 14),
            if (state.infoMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  state.infoMessage!,
                  style: GoogleFonts.spaceGrotesk(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
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
                        _InputPanel(
                          titleController: _titleController,
                          inputController: _inputController,
                          input: state.input,
                          onTitleChanged: controller.setRecipeTitle,
                          onInputChanged: controller.setInput,
                          onClearInput: () {
                            _inputController.clear();
                            controller.setInput('');
                          },
                          onSave: state.steps.isEmpty
                              ? null
                              : controller.saveRecipe,
                        ),
                        _ControlBar(
                          selectedOperationId: state.selectedOperationId,
                          operations: operations,
                          onSelectOperation: controller.selectOperation,
                          onAddStep: controller.addSelectedOperation,
                        ),
                        if (state.steps.isEmpty)
                          Container(
                            width: double.infinity,
                            color: const Color(0xFFF4F0E8),
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              'No steps yet. Add an operation to start the recipe.',
                              style: GoogleFonts.spaceGrotesk(
                                color: const Color(0xFF171311),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        else
                          ...state.steps.asMap().entries.map(
                            (MapEntry<int, RecipeStep> entry) {
                              final step = entry.value;
                              final operation = registry.resolve(
                                step.operation.id,
                                versionRange: step.operation.versionRange,
                              );
                              return _OperationBand(
                                index: entry.key,
                                step: step,
                                manifest: operation.operation.manifest,
                                onTap: () => showModalBottomSheet<void>(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: const Color(0xFF1A1715),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(28),
                                    ),
                                  ),
                                  showDragHandle: true,
                                  builder: (BuildContext context) {
                                    return StepEditorSheet(
                                      step: step,
                                      manifest: operation.operation.manifest,
                                      canMoveUp: entry.key > 0,
                                      canMoveDown:
                                          entry.key < state.steps.length - 1,
                                      onMoveUp: () =>
                                          controller.moveStep(step.stepId, -1),
                                      onMoveDown: () =>
                                          controller.moveStep(step.stepId, 1),
                                      onDelete: () =>
                                          controller.removeStep(step.stepId),
                                      onSave: controller.updateStep,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        _OutputPanel(
                          output: state.output?.asText(),
                          error: state.error,
                          isRunning: state.isRunning,
                          onRun: controller.runRecipe,
                          onExport: controller.exportResultsMarkdown,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InputPanel extends StatelessWidget {
  const _InputPanel({
    required this.titleController,
    required this.inputController,
    required this.input,
    required this.onTitleChanged,
    required this.onInputChanged,
    required this.onClearInput,
    required this.onSave,
  });

  final TextEditingController titleController;
  final TextEditingController inputController;
  final String input;
  final ValueChanged<String> onTitleChanged;
  final ValueChanged<String> onInputChanged;
  final VoidCallback onClearInput;
  final VoidCallback? onSave;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF4F0E8),
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'INPUT',
                  style: GoogleFonts.spaceGrotesk(
                    color: const Color(0xFF171311),
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                  ),
                ),
              ),
              Text(
                '${input.length} bytes',
                style: GoogleFonts.ibmPlexMono(
                  color: const Color(0xFF4A433A),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          TextField(
            controller: titleController,
            style: GoogleFonts.spaceGrotesk(
              color: const Color(0xFF171311),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            decoration: const InputDecoration(
              labelText: 'Recipe title',
              labelStyle: TextStyle(color: Color(0xFF4A433A)),
              fillColor: Color(0xFFF9F6EF),
            ),
            onChanged: onTitleChanged,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: inputController,
            minLines: 4,
            maxLines: 8,
            style: GoogleFonts.ibmPlexMono(
              color: const Color(0xFF171311),
              fontSize: 15,
              height: 1.4,
            ),
            decoration: InputDecoration(
              hintText: 'Paste text to transform',
              hintStyle:
                  GoogleFonts.ibmPlexMono(color: const Color(0xFF7A7267)),
              fillColor: const Color(0xFFF9F6EF),
              suffixIcon: IconButton(
                onPressed: onClearInput,
                color: const Color(0xFF171311),
                icon: const Icon(Icons.close),
              ),
            ),
            onChanged: onInputChanged,
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF171311),
                  foregroundColor: const Color(0xFFF4F0E8),
                ),
                onPressed: onSave,
                icon: const Icon(Icons.bookmark_add_outlined),
                label: const Text('Save Recipe'),
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF171311),
                  side: const BorderSide(color: Color(0xFF171311)),
                ),
                onPressed: onClearInput,
                icon: const Icon(Icons.refresh),
                label: const Text('Reset Input'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ControlBar extends StatelessWidget {
  const _ControlBar({
    required this.selectedOperationId,
    required this.operations,
    required this.onSelectOperation,
    required this.onAddStep,
  });

  final String selectedOperationId;
  final List<RegisteredOperation> operations;
  final ValueChanged<String> onSelectOperation;
  final VoidCallback onAddStep;

  @override
  Widget build(BuildContext context) {
    final selectedOperation = operations.firstWhere(
      (RegisteredOperation operation) =>
          operation.operation.manifest.id == selectedOperationId,
      orElse: () => operations.first,
    );
    return Container(
      color: const Color(0xFFF4F0E8),
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'NEXT OPERATION',
            style: GoogleFonts.spaceGrotesk(
              color: const Color(0xFF171311),
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          InkWell(
            borderRadius: BorderRadius.circular(22),
            onTap: () => showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              backgroundColor: const Color(0xFF1A1715),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              showDragHandle: true,
              builder: (BuildContext context) {
                return _OperationPickerSheet(
                  operations: operations,
                  selectedOperationId: selectedOperationId,
                  onSelectOperation: onSelectOperation,
                );
              },
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF9F6EF),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    selectedOperation.operation.manifest.title,
                    style: GoogleFonts.spaceGrotesk(
                      color: const Color(0xFF171311),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${selectedOperation.packId} • ${selectedOperation.operation.manifest.category}',
                    style: GoogleFonts.ibmPlexMono(
                      color: const Color(0xFF4A433A),
                      fontSize: 12,
                    ),
                  ),
                  if (_securityLabelForManifest(
                          selectedOperation.operation.manifest)
                      case final String label) ...<Widget>[
                    const SizedBox(height: 8),
                    _SecurityPill(label: label),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: <Widget>[
              OutlinedButton.icon(
                onPressed: () => showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: const Color(0xFF1A1715),
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(28)),
                  ),
                  showDragHandle: true,
                  builder: (BuildContext context) {
                    return _OperationPickerSheet(
                      operations: operations,
                      selectedOperationId: selectedOperationId,
                      onSelectOperation: onSelectOperation,
                    );
                  },
                ),
                icon: const Icon(Icons.search),
                label: const Text('Browse'),
              ),
              FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFF4E06D),
                  foregroundColor: const Color(0xFF171311),
                ),
                onPressed: onAddStep,
                icon: const Icon(Icons.add),
                label: const Text('Add Operation'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OperationPickerSheet extends StatefulWidget {
  const _OperationPickerSheet({
    required this.operations,
    required this.selectedOperationId,
    required this.onSelectOperation,
  });

  final List<RegisteredOperation> operations;
  final String selectedOperationId;
  final ValueChanged<String> onSelectOperation;

  @override
  State<_OperationPickerSheet> createState() => _OperationPickerSheetState();
}

class _OperationPickerSheetState extends State<_OperationPickerSheet> {
  late final TextEditingController _searchController;
  String _query = '';
  String? _selectedPackId;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final packIds = widget.operations
        .map((entry) => entry.packId)
        .toSet()
        .toList(growable: false)
      ..sort();
    final filtered =
        widget.operations.where(_matchesFilter).toList(growable: false);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'FIND AN OPERATION',
              style: GoogleFonts.spaceGrotesk(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _searchController,
              onChanged: (String value) => setState(() {
                _query = value.trim().toLowerCase();
              }),
              style: GoogleFonts.ibmPlexMono(fontSize: 14),
              decoration: InputDecoration(
                labelText: 'Search operations',
                hintText: 'Name, id, category, or tag',
                fillColor: const Color(0xFFF4F0E8),
                suffixIcon: _query.isEmpty
                    ? null
                    : IconButton(
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            _query = '';
                          });
                        },
                        icon: const Icon(Icons.close),
                      ),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  FilterChip(
                    label: const Text('All Packs'),
                    selected: _selectedPackId == null,
                    onSelected: (_) {
                      setState(() {
                        _selectedPackId = null;
                      });
                    },
                  ),
                  for (final packId in packIds)
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: FilterChip(
                        label: Text(packId),
                        selected: _selectedPackId == packId,
                        onSelected: (bool selected) {
                          setState(() {
                            _selectedPackId = selected ? packId : null;
                          });
                        },
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: filtered.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (BuildContext context, int index) {
                  final operation = filtered[index];
                  final selected = operation.operation.manifest.id ==
                      widget.selectedOperationId;
                  return Material(
                    color: selected
                        ? const Color(0xFFF1DE6C)
                        : const Color(0xFFF4F0E8),
                    borderRadius: BorderRadius.circular(22),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(22),
                      onTap: () {
                        widget
                            .onSelectOperation(operation.operation.manifest.id);
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              operation.operation.manifest.title,
                              style: GoogleFonts.spaceGrotesk(
                                color: const Color(0xFF171311),
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${operation.packId} • ${operation.operation.manifest.category}',
                              style: GoogleFonts.ibmPlexMono(
                                color: const Color(0xFF4A433A),
                                fontSize: 11,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              operation.operation.manifest.shortDescription,
                              style: GoogleFonts.ibmPlexMono(
                                color: const Color(0xFF171311),
                                fontSize: 12,
                                height: 1.4,
                              ),
                            ),
                            if (_securityLabelForManifest(
                                    operation.operation.manifest)
                                case final String label) ...<Widget>[
                              const SizedBox(height: 8),
                              _SecurityPill(label: label),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _matchesFilter(RegisteredOperation operation) {
    if (_selectedPackId != null && operation.packId != _selectedPackId) {
      return false;
    }
    if (_query.isEmpty) {
      return true;
    }
    final manifest = operation.operation.manifest;
    final haystack = <String>[
      manifest.id,
      manifest.title,
      manifest.shortDescription,
      manifest.category,
      operation.packId,
      ...manifest.tags,
    ].join(' ').toLowerCase();
    return haystack.contains(_query);
  }
}

class _OperationBand extends StatelessWidget {
  const _OperationBand({
    required this.index,
    required this.step,
    required this.manifest,
    required this.onTap,
  });

  final int index;
  final RecipeStep step;
  final OperationManifest manifest;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color background = <Color>[
      const Color(0xFFF1DE6C),
      const Color(0xFFF0B58D),
      const Color(0xFF9366AE),
      const Color(0xFFE37BA3),
    ][index % 4];
    final bool darkText = index % 4 != 2;
    final Color textColor =
        darkText ? const Color(0xFF171311) : const Color(0xFFF7F3E9);

    return Material(
      color: background,
      child: InkWell(
        onTap: onTap,
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: 1),
          duration: Duration(milliseconds: 260 + (index * 60)),
          curve: Curves.easeOutCubic,
          builder: (BuildContext context, double value, Widget? child) {
            return Transform.translate(
              offset: Offset(0, (1 - value) * 18),
              child: Opacity(opacity: value, child: child),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        manifest.title.toUpperCase(),
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.8,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Wrap(
                        spacing: 8,
                        runSpacing: 6,
                        children: step.params.entries
                            .map(
                              (entry) => Text(
                                '${entry.key}: ${entry.value}',
                                style: GoogleFonts.ibmPlexMono(
                                  fontSize: 12,
                                  color: textColor.withValues(alpha: 0.85),
                                ),
                              ),
                            )
                            .toList(growable: false),
                      ),
                    ],
                  ),
                ),
                Text(
                  step.enabled ? '→ Tap to edit' : 'Disabled',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: textColor.withValues(alpha: 0.85),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OutputPanel extends StatelessWidget {
  const _OutputPanel({
    required this.output,
    required this.error,
    required this.isRunning,
    required this.onRun,
    required this.onExport,
  });

  final String? output;
  final String? error;
  final bool isRunning;
  final VoidCallback onRun;
  final VoidCallback onExport;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 220),
      color: const Color(0xFFD56796),
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'OUTPUT',
                  style: GoogleFonts.spaceGrotesk(
                    color: const Color(0xFF171311),
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF171311),
                ),
                onPressed: isRunning ? null : onRun,
                child: Text(isRunning ? 'Running…' : 'Run recipe'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF171311),
                side: const BorderSide(color: Color(0x55171311)),
              ),
              onPressed: isRunning || output == null || output!.isEmpty
                  ? null
                  : onExport,
              icon: const Icon(Icons.description_outlined),
              label: const Text('Export .md'),
            ),
          ),
          const SizedBox(height: 14),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 240),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 0.04),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              );
            },
            child: error != null
                ? Text(
                    error!,
                    key: const ValueKey<String>('output-error'),
                    style: GoogleFonts.spaceGrotesk(
                      color: const Color(0xFF171311),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                : (output == null || output!.isEmpty)
                    ? Text(
                        'Run the recipe to preview the output.',
                        key: const ValueKey<String>('output-empty'),
                        style: GoogleFonts.ibmPlexMono(
                          color: const Color(0xFF2D2328),
                          fontSize: 14,
                        ),
                      )
                    : SelectableText(
                        output!,
                        key: const ValueKey<String>('output-text'),
                        style: GoogleFonts.ibmPlexMono(
                          color: const Color(0xFF171311),
                          fontSize: 15,
                          height: 1.4,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}

Color _sheetAccentForOperation(String operationId) {
  if (operationId.contains('base64')) {
    return const Color(0xFFF0B58D);
  }
  if (operationId.contains('hex')) {
    return const Color(0xFF9366AE);
  }
  if (operationId.contains('url')) {
    return const Color(0xFFF1DE6C);
  }
  return const Color(0xFFE37BA3);
}

class _EditorSurface extends StatelessWidget {
  const _EditorSurface({
    required this.child,
    required this.label,
  });

  final Widget child;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F0E8),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: GoogleFonts.spaceGrotesk(
              color: const Color(0xFF171311),
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          DefaultTextStyle.merge(
            style: const TextStyle(color: Color(0xFF171311)),
            child: Theme(
              data: Theme.of(context).copyWith(
                inputDecorationTheme: InputDecorationTheme(
                  filled: true,
                  fillColor: const Color(0xFFF9F6EF),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(color: Color(0x22171311)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(color: Color(0x22171311)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide:
                        const BorderSide(color: Color(0xFF171311), width: 1.2),
                  ),
                ),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}

class StepEditorSheet extends StatefulWidget {
  const StepEditorSheet({
    required this.step,
    required this.manifest,
    required this.canMoveUp,
    required this.canMoveDown,
    required this.onMoveUp,
    required this.onMoveDown,
    required this.onDelete,
    required this.onSave,
    super.key,
  });

  final RecipeStep step;
  final OperationManifest manifest;
  final bool canMoveUp;
  final bool canMoveDown;
  final VoidCallback onMoveUp;
  final VoidCallback onMoveDown;
  final VoidCallback onDelete;
  final ValueChanged<RecipeStep> onSave;

  @override
  State<StepEditorSheet> createState() => _StepEditorSheetState();
}

class _StepEditorSheetState extends State<StepEditorSheet> {
  late Map<String, Object?> _params;
  late bool _enabled;

  @override
  void initState() {
    super.initState();
    _params = Map<String, Object?>.from(widget.step.params);
    _enabled = widget.step.enabled;
  }

  @override
  Widget build(BuildContext context) {
    final accent = _sheetAccentForOperation(widget.manifest.id);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
                decoration: BoxDecoration(
                  color: accent,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.manifest.title.toUpperCase(),
                      style: GoogleFonts.spaceGrotesk(
                        color: const Color(0xFF171311),
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      widget.manifest.shortDescription,
                      style: GoogleFonts.ibmPlexMono(
                        color: const Color(0xFF171311),
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                    if (_securityNoticeForManifest(widget.manifest)
                        case final String note) ...<Widget>[
                      const SizedBox(height: 12),
                      _SheetNotice(note: note),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _EditorSurface(
                label: 'STEP STATUS',
                child: SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Step enabled'),
                  value: _enabled,
                  onChanged: (bool value) {
                    setState(() {
                      _enabled = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 8),
              ...widget.manifest.params.map(
                (ParamFieldSpec field) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _EditorSurface(
                    label: field.label.toUpperCase(),
                    child: _GeneratedParamField(
                      field: field,
                      value: _params[field.id],
                      onChanged: (Object? value) {
                        setState(() {
                          _params = <String, Object?>{
                            ..._params,
                            field.id: value,
                          };
                        });
                      },
                    ),
                  ),
                ),
              ),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: <Widget>[
                  OutlinedButton.icon(
                    onPressed: widget.canMoveUp ? widget.onMoveUp : null,
                    icon: const Icon(Icons.arrow_upward),
                    label: const Text('Move Up'),
                  ),
                  OutlinedButton.icon(
                    onPressed: widget.canMoveDown ? widget.onMoveDown : null,
                    icon: const Icon(Icons.arrow_downward),
                    label: const Text('Move Down'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      widget.onDelete();
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.delete_outline),
                    label: const Text('Delete'),
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: accent,
                      foregroundColor: const Color(0xFF171311),
                    ),
                    onPressed: () {
                      widget.onSave(
                        widget.step.copyWith(
                          enabled: _enabled,
                          params: _params,
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                    child: const Text('Apply'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GeneratedParamField extends StatelessWidget {
  const _GeneratedParamField({
    required this.field,
    required this.value,
    required this.onChanged,
  });

  final ParamFieldSpec field;
  final Object? value;
  final ValueChanged<Object?> onChanged;

  @override
  Widget build(BuildContext context) {
    return GeneratedParamEditorField(
      field: field,
      value: value,
      onChanged: onChanged,
    );
  }
}

class _SecurityPill extends StatelessWidget {
  const _SecurityPill({
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0x22171311),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: GoogleFonts.spaceGrotesk(
          color: const Color(0xFF171311),
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _SheetNotice extends StatelessWidget {
  const _SheetNotice({
    required this.note,
  });

  final String note;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0x22FFFFFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        note,
        style: GoogleFonts.ibmPlexMono(
          color: const Color(0xFF171311),
          fontSize: 12,
          height: 1.45,
        ),
      ),
    );
  }
}

String? _securityLabelForManifest(OperationManifest manifest) {
  if (manifest.id == 'core.cipher.aes') {
    return 'Educational Only • AES-CBC';
  }
  if (manifest.id == 'core.cipher.des' || manifest.id == 'core.cipher.rc4') {
    return 'Educational Only • Legacy Crypto';
  }
  if (manifest.category == 'Cipher') {
    return 'Educational Cipher';
  }
  return null;
}

String? _securityNoticeForManifest(OperationManifest manifest) {
  switch (manifest.id) {
    case 'core.cipher.aes':
      return 'This AES operation is for learning and compatibility work. CBC mode here does not authenticate the message.';
    case 'core.cipher.des':
      return 'DES is obsolete. Keep it for historical or protocol-analysis tasks only.';
    case 'core.cipher.rc4':
      return 'RC4 is deprecated and should not be used for new secure designs.';
    default:
      if (manifest.category == 'Cipher') {
        return 'Treat this as educational cipher tooling, not a secure messaging feature.';
      }
      return null;
  }
}
