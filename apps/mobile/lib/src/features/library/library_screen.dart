import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_recipe_lab_mobile/src/features/documents/file_save_dialog.dart';
import 'package:mobile_recipe_lab_mobile/src/features/workbench/workbench_controller.dart';
import 'package:persistence_drift/persistence_drift.dart';
import 'package:recipe_domain/recipe_domain.dart';

class LibraryScreen extends ConsumerStatefulWidget {
  const LibraryScreen({super.key});

  @override
  ConsumerState<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends ConsumerState<LibraryScreen> {
  late final TextEditingController _searchController;
  String _query = '';
  bool _favoritesOnly = false;

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
    final savedRecipes = ref.watch(savedRecipesProvider);
    final controller = ref.read(workbenchControllerProvider.notifier);

    return SafeArea(
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 1.5,
            colors: <Color>[
              Color(0xFF281D2B),
              Color(0xFF110F14),
              Color(0xFF090807),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Library',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  IconButton(
                    tooltip: 'Import recipe JSON',
                    onPressed: () => _showImportSheet(context),
                    icon: const Icon(Icons.file_upload_outlined),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Search, favorite, duplicate, export, and reopen local recipes.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 14),
              TextField(
                controller: _searchController,
                onChanged: (String value) => setState(() {
                  _query = value.trim().toLowerCase();
                }),
                style: GoogleFonts.ibmPlexMono(fontSize: 14),
                decoration: InputDecoration(
                  labelText: 'Search recipes',
                  hintText: 'Title, description, or tag',
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
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: <Widget>[
                  FilterChip(
                    label: const Text('Favorites'),
                    selected: _favoritesOnly,
                    onSelected: (bool value) {
                      setState(() {
                        _favoritesOnly = value;
                      });
                    },
                  ),
                  OutlinedButton.icon(
                    onPressed: () => _showImportSheet(context),
                    icon: const Icon(Icons.input),
                    label: const Text('Import JSON'),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Expanded(
                child: Center(
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
                        child: savedRecipes.when(
                          data: (List<SavedRecipeRecord> recipes) {
                            final filtered = recipes.where(_matchesFilter).toList(growable: false);
                            if (filtered.isEmpty) {
                              return Container(
                                color: const Color(0xFFF4F0E8),
                                padding: const EdgeInsets.all(22),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'ARCHIVE',
                                      style: GoogleFonts.spaceGrotesk(
                                        color: const Color(0xFF171311),
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: -1,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      recipes.isEmpty
                                          ? 'No saved recipes yet. Build one in the workbench and pin it here.'
                                          : 'No recipes match the current search or filter.',
                                      style: GoogleFonts.ibmPlexMono(
                                        color: const Color(0xFF171311),
                                        fontSize: 14,
                                        height: 1.4,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              itemCount: filtered.length,
                              separatorBuilder: (_, __) =>
                                  const Divider(height: 1, color: Color(0x22000000)),
                              itemBuilder: (BuildContext context, int index) {
                                final recipe = filtered[index];
                                final Color band = <Color>[
                                  const Color(0xFFF1DE6C),
                                  const Color(0xFFF0B58D),
                                  const Color(0xFF9366AE),
                                  const Color(0xFFE37BA3),
                                ][index % 4];
                                final bool darkText = index % 4 != 2;
                                final Color textColor = darkText
                                    ? const Color(0xFF171311)
                                    : const Color(0xFFF7F3E9);
                                return TweenAnimationBuilder<double>(
                                  tween: Tween<double>(begin: 0, end: 1),
                                  duration: Duration(milliseconds: 260 + (index * 60)),
                                  curve: Curves.easeOutCubic,
                                  builder: (
                                    BuildContext context,
                                    double value,
                                    Widget? child,
                                  ) {
                                    return Transform.translate(
                                      offset: Offset(0, (1 - value) * 16),
                                      child: Opacity(opacity: value, child: child),
                                    );
                                  },
                                  child: Material(
                                    color: band,
                                    child: InkWell(
                                      onTap: () async {
                                        final store = await ref.read(recipeStoreProvider.future);
                                        final loaded = await store.loadRecipe(recipe.recipeId);
                                        if (loaded == null || !context.mounted) {
                                          return;
                                        }
                                        await controller.loadRecipe(loaded);
                                        if (context.mounted) {
                                          context.go('/workbench');
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    recipe.title.toUpperCase(),
                                                    style: GoogleFonts.spaceGrotesk(
                                                      fontSize: 26,
                                                      fontWeight: FontWeight.w700,
                                                      color: textColor,
                                                      letterSpacing: -0.8,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 6),
                                                  Text(
                                                    recipe.tags.isEmpty
                                                        ? 'No tags'
                                                        : recipe.tags.join(' • '),
                                                    style: GoogleFonts.ibmPlexMono(
                                                      fontSize: 12,
                                                      color: textColor.withValues(alpha: 0.85),
                                                    ),
                                                  ),
                                                  if (recipe.description != null &&
                                                      recipe.description!.isNotEmpty) ...<Widget>[
                                                    const SizedBox(height: 8),
                                                    Text(
                                                      recipe.description!,
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: GoogleFonts.ibmPlexMono(
                                                        fontSize: 12,
                                                        color: textColor.withValues(alpha: 0.85),
                                                      ),
                                                    ),
                                                  ],
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    recipe.updatedAt.toLocal().toString(),
                                                    style: GoogleFonts.spaceGrotesk(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.w700,
                                                      color: textColor.withValues(alpha: 0.85),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              children: <Widget>[
                                                IconButton(
                                                  onPressed: () => _toggleFavorite(recipe),
                                                  color: textColor,
                                                  icon: Icon(
                                                    recipe.isFavorite
                                                        ? Icons.star
                                                        : Icons.star_outline,
                                                  ),
                                                ),
                                                PopupMenuButton<String>(
                                                  iconColor: textColor,
                                                  onSelected: (String value) async {
                                                    if (value == 'duplicate') {
                                                      await _duplicateRecipe(recipe.recipeId);
                                                      return;
                                                    }
                                                    if (value == 'export') {
                                                      await _showExportSheet(
                                                        context,
                                                        recipe.recipeId,
                                                      );
                                                      return;
                                                    }
                                                    await controller.deleteRecipe(recipe.recipeId);
                                                  },
                                                  itemBuilder: (BuildContext context) =>
                                                      const <PopupMenuEntry<String>>[
                                                    PopupMenuItem<String>(
                                                      value: 'duplicate',
                                                      child: Text('Duplicate'),
                                                    ),
                                                    PopupMenuItem<String>(
                                                      value: 'export',
                                                      child: Text('Export JSON'),
                                                    ),
                                                    PopupMenuItem<String>(
                                                      value: 'delete',
                                                      child: Text('Delete'),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          error: (Object error, StackTrace _) {
                            return Center(
                              child: Padding(
                                padding: const EdgeInsets.all(24),
                                child: Text('Failed to load recipes: $error'),
                              ),
                            );
                          },
                          loading: () => const Center(child: CircularProgressIndicator()),
                        ),
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

  bool _matchesFilter(SavedRecipeRecord recipe) {
    if (_favoritesOnly && !recipe.isFavorite) {
      return false;
    }
    if (_query.isEmpty) {
      return true;
    }
    final haystack = <String>[
      recipe.title,
      recipe.description ?? '',
      ...recipe.tags,
    ].join(' ').toLowerCase();
    return haystack.contains(_query);
  }

  Future<void> _toggleFavorite(SavedRecipeRecord recipe) async {
    final store = await ref.read(recipeStoreProvider.future);
    await store.setFavorite(recipe.recipeId, !recipe.isFavorite);
    ref.invalidate(savedRecipesProvider);
  }

  Future<void> _duplicateRecipe(String recipeId) async {
    final store = await ref.read(recipeStoreProvider.future);
    final recipe = await store.loadRecipe(recipeId);
    if (recipe == null) {
      return;
    }
    final now = DateTime.now().toUtc();
    await store.saveRecipe(
      recipe.copyWith(
        recipeId: now.microsecondsSinceEpoch.toString(),
        title: '${recipe.title} Copy',
        createdAt: now,
        updatedAt: now,
      ),
    );
    ref.invalidate(savedRecipesProvider);
  }

  Future<void> _showExportSheet(BuildContext context, String recipeId) async {
    final messenger = ScaffoldMessenger.of(this.context);
    final store = await ref.read(recipeStoreProvider.future);
    final recipe = await store.loadRecipe(recipeId);
    if (recipe == null || !context.mounted) {
      return;
    }
    final jsonText = const JsonEncoder.withIndent('  ').convert(recipe.toJson());
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF1A1715),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      showDragHandle: true,
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'EXPORT RECIPE',
                  style: GoogleFonts.spaceGrotesk(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  constraints: const BoxConstraints(maxHeight: 360),
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F0E8),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: SingleChildScrollView(
                    child: SelectableText(
                      jsonText,
                      style: GoogleFonts.ibmPlexMono(
                        color: const Color(0xFF171311),
                        fontSize: 12,
                        height: 1.45,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: () async {
                    final String safeTitle = recipe.title
                        .toLowerCase()
                        .replaceAll(RegExp(r'[^a-z0-9]+'), '_')
                        .replaceAll(RegExp(r'_+'), '_')
                        .replaceAll(RegExp(r'^_|_$'), '');
                    final filePath = await saveTextFileWithDialog(
                      fileName:
                          '${safeTitle.isEmpty ? 'recipe' : safeTitle}_${recipe.recipeId}.json',
                      text: jsonText,
                    );
                    if (context.mounted) {
                      Navigator.of(context).pop();
                      messenger.showSnackBar(
                        SnackBar(
                          content: Text(
                            filePath == null || filePath.isEmpty
                                ? 'Recipe export cancelled.'
                                : 'Recipe JSON saved to $filePath',
                          ),
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.save_alt_outlined),
                  label: const Text('Save JSON'),
                ),
                const SizedBox(height: 8),
                FilledButton.icon(
                  onPressed: () async {
                    await Clipboard.setData(ClipboardData(text: jsonText));
                    if (context.mounted) {
                      Navigator.of(context).pop();
                      messenger.showSnackBar(
                        const SnackBar(content: Text('Recipe JSON copied to clipboard.')),
                      );
                    }
                  },
                  icon: const Icon(Icons.copy_all_outlined),
                  label: const Text('Copy JSON'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showImportSheet(BuildContext context) async {
    final TextEditingController controller = TextEditingController();
    final messenger = ScaffoldMessenger.of(this.context);
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF1A1715),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      showDragHandle: true,
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              8,
              16,
              MediaQuery.of(context).viewInsets.bottom + 24,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'IMPORT RECIPE',
                  style: GoogleFonts.spaceGrotesk(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: controller,
                  minLines: 10,
                  maxLines: 16,
                  style: GoogleFonts.ibmPlexMono(fontSize: 13),
                  decoration: const InputDecoration(
                    labelText: 'Paste recipe JSON',
                    fillColor: Color(0xFFF4F0E8),
                  ),
                ),
                const SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: () async {
                    try {
                      final dynamic decoded = jsonDecode(controller.text);
                      final recipe = RecipeDocument.fromJson(
                        (decoded as Map<Object?, Object?>).cast<String, dynamic>(),
                      );
                      final store = await ref.read(recipeStoreProvider.future);
                      await store.saveRecipe(recipe.copyWith(updatedAt: DateTime.now().toUtc()));
                      ref.invalidate(savedRecipesProvider);
                      if (context.mounted) {
                        Navigator.of(context).pop();
                        messenger.showSnackBar(
                          const SnackBar(content: Text('Recipe imported into the library.')),
                        );
                      }
                    } catch (error) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Invalid recipe JSON: $error')),
                        );
                      }
                    }
                  },
                  icon: const Icon(Icons.download_done_outlined),
                  label: const Text('Import Recipe'),
                ),
              ],
            ),
          ),
        );
      },
    );
    controller.dispose();
  }
}
