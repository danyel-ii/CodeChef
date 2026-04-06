import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_recipe_lab_mobile/src/features/documents/pdf_deck_catalog.dart';
import 'package:mobile_recipe_lab_mobile/src/features/workbench/workbench_controller.dart';
import 'package:operation_registry/operation_registry.dart';
import 'package:pack_learning_content/pack_learning_content.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
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
    final operations = ref.watch(availableOperationsProvider);
    final learningMap = ref.watch(learningContentProvider);
    final learningOperations = operations
        .where(
          (RegisteredOperation operation) =>
              learningMap.containsKey(operation.operation.manifest.id),
        )
        .where(_matchesFilter)
        .toList(growable: false);
    final packIds = operations.map((entry) => entry.packId).toSet().toList(growable: false)
      ..sort();

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
            Text('Learn', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 6),
            Text(
              'Operation guides, examples, and ready-to-run reference recipes.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 18),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 430),
                child: Column(
                  children: <Widget>[
                    _LearningHero(
                      operationCount: operations.length,
                      exampleCount: learningMap.values.fold<int>(
                        0,
                        (int total, OperationLearningContent item) =>
                            total + item.examples.length,
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      controller: _searchController,
                      onChanged: (String value) => setState(() {
                        _query = value.trim().toLowerCase();
                      }),
                      style: GoogleFonts.ibmPlexMono(fontSize: 14),
                      decoration: InputDecoration(
                        labelText: 'Search learning content',
                        hintText: 'Operation title, id, or related terms',
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
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
                          ...packIds.map(
                            (String packId) => FilterChip(
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
                    const SizedBox(height: 14),
                    if (learningOperations.isEmpty)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F0E8),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Text(
                          'No learning cards match the current search or pack filter.',
                          style: GoogleFonts.ibmPlexMono(
                            color: const Color(0xFF171311),
                            fontSize: 13,
                          ),
                        ),
                      )
                    else
                      ...learningOperations.asMap().entries.map(
                        (MapEntry<int, RegisteredOperation> entry) {
                          final operation = entry.value;
                          final learning = learningMap[operation.operation.manifest.id]!;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _LearningCard(
                              index: entry.key,
                              operation: operation,
                              learning: learning,
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
                                  return _LearningDetailSheet(
                                    operation: operation,
                                    learning: learning,
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
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

class _LearningHero extends StatelessWidget {
  const _LearningHero({
    required this.operationCount,
    required this.exampleCount,
  });

  final int operationCount;
  final int exampleCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F0E8),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'LEARNING BUNDLE',
            style: GoogleFonts.spaceGrotesk(
              color: const Color(0xFF171311),
              fontSize: 28,
              fontWeight: FontWeight.w700,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$operationCount documented operations, $exampleCount runnable examples.',
            style: GoogleFonts.ibmPlexMono(
              color: const Color(0xFF4A433A),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _LearningCard extends StatelessWidget {
  const _LearningCard({
    required this.index,
    required this.operation,
    required this.learning,
    required this.onTap,
  });

  final int index;
  final RegisteredOperation operation;
  final OperationLearningContent learning;
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
      borderRadius: BorderRadius.circular(28),
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onTap,
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: 1),
          duration: Duration(milliseconds: 220 + (index * 40)),
          curve: Curves.easeOutCubic,
          builder: (BuildContext context, double value, Widget? child) {
            return Transform.translate(
              offset: Offset(0, (1 - value) * 16),
              child: Opacity(opacity: value, child: child),
            );
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        operation.operation.manifest.title.toUpperCase(),
                        style: GoogleFonts.spaceGrotesk(
                          color: textColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.8,
                        ),
                      ),
                    ),
                    Text(
                      operation.packId,
                      style: GoogleFonts.ibmPlexMono(
                        color: textColor.withValues(alpha: 0.84),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  learning.whatItDoes,
                  style: GoogleFonts.ibmPlexMono(
                    color: textColor,
                    fontSize: 13,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${learning.examples.length} example${learning.examples.length == 1 ? '' : 's'}',
                  style: GoogleFonts.spaceGrotesk(
                    color: textColor.withValues(alpha: 0.88),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
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

class _LearningDetailSheet extends ConsumerWidget {
  const _LearningDetailSheet({
    required this.operation,
    required this.learning,
  });

  final RegisteredOperation operation;
  final OperationLearningContent learning;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  color: const Color(0xFFF4F0E8),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      operation.operation.manifest.title.toUpperCase(),
                      style: GoogleFonts.spaceGrotesk(
                        color: const Color(0xFF171311),
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -1,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      operation.operation.manifest.shortDescription,
                      style: GoogleFonts.ibmPlexMono(
                        color: const Color(0xFF4A433A),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _LearningSection(label: 'WHAT IT DOES', body: learning.whatItDoes),
              const SizedBox(height: 12),
              _LearningSection(label: 'WHEN TO USE', body: learning.whenToUse),
              const SizedBox(height: 12),
              _LearningSection(label: 'EDGE NOTES', body: learning.gotchas),
              if (learning.howItWorks.isNotEmpty) ...<Widget>[
                const SizedBox(height: 12),
                _LearningStepsSection(steps: learning.howItWorks),
              ],
              if (learning.relatedOperations.isNotEmpty) ...<Widget>[
                const SizedBox(height: 12),
                _LearningSection(
                  label: 'RELATED',
                  body: learning.relatedOperations.join(', '),
                ),
              ],
              if (operationLearningDecks.containsKey(operation.operation.manifest.id)) ...<Widget>[
                const SizedBox(height: 12),
                _LearningDeckCard(
                  deck: operationLearningDecks[operation.operation.manifest.id]!,
                ),
              ],
              const SizedBox(height: 12),
              ...learning.examples.map(
                (LearningExample example) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _LearningExampleCard(
                    example: example,
                    onUse: () async {
                      await ref
                          .read(workbenchControllerProvider.notifier)
                          .loadLearningExample(operation.operation.manifest.id, example);
                      if (context.mounted) {
                        Navigator.of(context).pop();
                        context.go('/workbench');
                      }
                    },
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

class _LearningDeckCard extends StatelessWidget {
  const _LearningDeckCard({
    required this.deck,
  });

  final PdfDeck deck;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF0B58D),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'SLIDE DECK',
            style: GoogleFonts.spaceGrotesk(
              color: const Color(0xFF171311),
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            deck.title,
            style: GoogleFonts.spaceGrotesk(
              color: const Color(0xFF171311),
              fontSize: 24,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.8,
            ),
          ),
          if (deck.description != null) ...<Widget>[
            const SizedBox(height: 8),
            Text(
              deck.description!,
              style: GoogleFonts.ibmPlexMono(
                color: const Color(0xFF171311),
                fontSize: 13,
                height: 1.45,
              ),
            ),
          ],
          const SizedBox(height: 14),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFF171311),
              foregroundColor: const Color(0xFFF4F0E8),
            ),
            onPressed: () {
              context.push('/documents/pdf', extra: deck);
            },
            child: const Text('Open PDF'),
          ),
        ],
      ),
    );
  }
}

class _LearningStepsSection extends StatelessWidget {
  const _LearningStepsSection({
    required this.steps,
  });

  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F0E8),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'HOW IT WORKS',
            style: GoogleFonts.spaceGrotesk(
              color: const Color(0xFF171311),
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          ...steps.asMap().entries.map(
            (MapEntry<int, String> entry) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                '${entry.key + 1}. ${entry.value}',
                style: GoogleFonts.ibmPlexMono(
                  color: const Color(0xFF171311),
                  fontSize: 13,
                  height: 1.45,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LearningSection extends StatelessWidget {
  const _LearningSection({
    required this.label,
    required this.body,
  });

  final String label;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
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
          Text(
            body,
            style: GoogleFonts.ibmPlexMono(
              color: const Color(0xFF171311),
              fontSize: 13,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}

class _LearningExampleCard extends StatelessWidget {
  const _LearningExampleCard({
    required this.example,
    required this.onUse,
  });

  final LearningExample example;
  final VoidCallback onUse;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE37BA3),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  example.title.toUpperCase(),
                  style: GoogleFonts.spaceGrotesk(
                    color: const Color(0xFF171311),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF171311),
                  foregroundColor: const Color(0xFFF4F0E8),
                ),
                onPressed: onUse,
                child: const Text('Use Example'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Input',
            style: GoogleFonts.spaceGrotesk(
              color: const Color(0xFF171311),
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            example.input,
            style: GoogleFonts.ibmPlexMono(
              color: const Color(0xFF171311),
              fontSize: 13,
              height: 1.45,
            ),
          ),
          if (example.expectedOutputText != null) ...<Widget>[
            const SizedBox(height: 10),
            Text(
              'Expected output',
              style: GoogleFonts.spaceGrotesk(
                color: const Color(0xFF171311),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              example.expectedOutputText!,
              style: GoogleFonts.ibmPlexMono(
                color: const Color(0xFF171311),
                fontSize: 13,
                height: 1.45,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
