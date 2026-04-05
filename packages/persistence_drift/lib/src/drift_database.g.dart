// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $SavedRecipesTable extends SavedRecipes
    with TableInfo<$SavedRecipesTable, SavedRecipe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SavedRecipesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _recipeIdMeta =
      const VerificationMeta('recipeId');
  @override
  late final GeneratedColumn<String> recipeId = GeneratedColumn<String>(
      'recipe_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtIso8601Meta =
      const VerificationMeta('updatedAtIso8601');
  @override
  late final GeneratedColumn<String> updatedAtIso8601 = GeneratedColumn<String>(
      'updated_at_iso8601', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tagsJsonMeta =
      const VerificationMeta('tagsJson');
  @override
  late final GeneratedColumn<String> tagsJson = GeneratedColumn<String>(
      'tags_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _documentJsonMeta =
      const VerificationMeta('documentJson');
  @override
  late final GeneratedColumn<String> documentJson = GeneratedColumn<String>(
      'document_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isFavoriteMeta =
      const VerificationMeta('isFavorite');
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
      'is_favorite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_favorite" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        recipeId,
        title,
        description,
        updatedAtIso8601,
        tagsJson,
        documentJson,
        isFavorite
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'saved_recipes';
  @override
  VerificationContext validateIntegrity(Insertable<SavedRecipe> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('recipe_id')) {
      context.handle(_recipeIdMeta,
          recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta));
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('updated_at_iso8601')) {
      context.handle(
          _updatedAtIso8601Meta,
          updatedAtIso8601.isAcceptableOrUnknown(
              data['updated_at_iso8601']!, _updatedAtIso8601Meta));
    } else if (isInserting) {
      context.missing(_updatedAtIso8601Meta);
    }
    if (data.containsKey('tags_json')) {
      context.handle(_tagsJsonMeta,
          tagsJson.isAcceptableOrUnknown(data['tags_json']!, _tagsJsonMeta));
    } else if (isInserting) {
      context.missing(_tagsJsonMeta);
    }
    if (data.containsKey('document_json')) {
      context.handle(
          _documentJsonMeta,
          documentJson.isAcceptableOrUnknown(
              data['document_json']!, _documentJsonMeta));
    } else if (isInserting) {
      context.missing(_documentJsonMeta);
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['is_favorite']!, _isFavoriteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {recipeId};
  @override
  SavedRecipe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SavedRecipe(
      recipeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}recipe_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      updatedAtIso8601: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}updated_at_iso8601'])!,
      tagsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags_json'])!,
      documentJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}document_json'])!,
      isFavorite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_favorite'])!,
    );
  }

  @override
  $SavedRecipesTable createAlias(String alias) {
    return $SavedRecipesTable(attachedDatabase, alias);
  }
}

class SavedRecipe extends DataClass implements Insertable<SavedRecipe> {
  final String recipeId;
  final String title;
  final String? description;
  final String updatedAtIso8601;
  final String tagsJson;
  final String documentJson;
  final bool isFavorite;
  const SavedRecipe(
      {required this.recipeId,
      required this.title,
      this.description,
      required this.updatedAtIso8601,
      required this.tagsJson,
      required this.documentJson,
      required this.isFavorite});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['recipe_id'] = Variable<String>(recipeId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['updated_at_iso8601'] = Variable<String>(updatedAtIso8601);
    map['tags_json'] = Variable<String>(tagsJson);
    map['document_json'] = Variable<String>(documentJson);
    map['is_favorite'] = Variable<bool>(isFavorite);
    return map;
  }

  SavedRecipesCompanion toCompanion(bool nullToAbsent) {
    return SavedRecipesCompanion(
      recipeId: Value(recipeId),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      updatedAtIso8601: Value(updatedAtIso8601),
      tagsJson: Value(tagsJson),
      documentJson: Value(documentJson),
      isFavorite: Value(isFavorite),
    );
  }

  factory SavedRecipe.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SavedRecipe(
      recipeId: serializer.fromJson<String>(json['recipeId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      updatedAtIso8601: serializer.fromJson<String>(json['updatedAtIso8601']),
      tagsJson: serializer.fromJson<String>(json['tagsJson']),
      documentJson: serializer.fromJson<String>(json['documentJson']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'recipeId': serializer.toJson<String>(recipeId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'updatedAtIso8601': serializer.toJson<String>(updatedAtIso8601),
      'tagsJson': serializer.toJson<String>(tagsJson),
      'documentJson': serializer.toJson<String>(documentJson),
      'isFavorite': serializer.toJson<bool>(isFavorite),
    };
  }

  SavedRecipe copyWith(
          {String? recipeId,
          String? title,
          Value<String?> description = const Value.absent(),
          String? updatedAtIso8601,
          String? tagsJson,
          String? documentJson,
          bool? isFavorite}) =>
      SavedRecipe(
        recipeId: recipeId ?? this.recipeId,
        title: title ?? this.title,
        description: description.present ? description.value : this.description,
        updatedAtIso8601: updatedAtIso8601 ?? this.updatedAtIso8601,
        tagsJson: tagsJson ?? this.tagsJson,
        documentJson: documentJson ?? this.documentJson,
        isFavorite: isFavorite ?? this.isFavorite,
      );
  SavedRecipe copyWithCompanion(SavedRecipesCompanion data) {
    return SavedRecipe(
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      title: data.title.present ? data.title.value : this.title,
      description:
          data.description.present ? data.description.value : this.description,
      updatedAtIso8601: data.updatedAtIso8601.present
          ? data.updatedAtIso8601.value
          : this.updatedAtIso8601,
      tagsJson: data.tagsJson.present ? data.tagsJson.value : this.tagsJson,
      documentJson: data.documentJson.present
          ? data.documentJson.value
          : this.documentJson,
      isFavorite:
          data.isFavorite.present ? data.isFavorite.value : this.isFavorite,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SavedRecipe(')
          ..write('recipeId: $recipeId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('updatedAtIso8601: $updatedAtIso8601, ')
          ..write('tagsJson: $tagsJson, ')
          ..write('documentJson: $documentJson, ')
          ..write('isFavorite: $isFavorite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(recipeId, title, description,
      updatedAtIso8601, tagsJson, documentJson, isFavorite);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SavedRecipe &&
          other.recipeId == this.recipeId &&
          other.title == this.title &&
          other.description == this.description &&
          other.updatedAtIso8601 == this.updatedAtIso8601 &&
          other.tagsJson == this.tagsJson &&
          other.documentJson == this.documentJson &&
          other.isFavorite == this.isFavorite);
}

class SavedRecipesCompanion extends UpdateCompanion<SavedRecipe> {
  final Value<String> recipeId;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> updatedAtIso8601;
  final Value<String> tagsJson;
  final Value<String> documentJson;
  final Value<bool> isFavorite;
  final Value<int> rowid;
  const SavedRecipesCompanion({
    this.recipeId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.updatedAtIso8601 = const Value.absent(),
    this.tagsJson = const Value.absent(),
    this.documentJson = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SavedRecipesCompanion.insert({
    required String recipeId,
    required String title,
    this.description = const Value.absent(),
    required String updatedAtIso8601,
    required String tagsJson,
    required String documentJson,
    this.isFavorite = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : recipeId = Value(recipeId),
        title = Value(title),
        updatedAtIso8601 = Value(updatedAtIso8601),
        tagsJson = Value(tagsJson),
        documentJson = Value(documentJson);
  static Insertable<SavedRecipe> custom({
    Expression<String>? recipeId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? updatedAtIso8601,
    Expression<String>? tagsJson,
    Expression<String>? documentJson,
    Expression<bool>? isFavorite,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (recipeId != null) 'recipe_id': recipeId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (updatedAtIso8601 != null) 'updated_at_iso8601': updatedAtIso8601,
      if (tagsJson != null) 'tags_json': tagsJson,
      if (documentJson != null) 'document_json': documentJson,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SavedRecipesCompanion copyWith(
      {Value<String>? recipeId,
      Value<String>? title,
      Value<String?>? description,
      Value<String>? updatedAtIso8601,
      Value<String>? tagsJson,
      Value<String>? documentJson,
      Value<bool>? isFavorite,
      Value<int>? rowid}) {
    return SavedRecipesCompanion(
      recipeId: recipeId ?? this.recipeId,
      title: title ?? this.title,
      description: description ?? this.description,
      updatedAtIso8601: updatedAtIso8601 ?? this.updatedAtIso8601,
      tagsJson: tagsJson ?? this.tagsJson,
      documentJson: documentJson ?? this.documentJson,
      isFavorite: isFavorite ?? this.isFavorite,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (updatedAtIso8601.present) {
      map['updated_at_iso8601'] = Variable<String>(updatedAtIso8601.value);
    }
    if (tagsJson.present) {
      map['tags_json'] = Variable<String>(tagsJson.value);
    }
    if (documentJson.present) {
      map['document_json'] = Variable<String>(documentJson.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SavedRecipesCompanion(')
          ..write('recipeId: $recipeId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('updatedAtIso8601: $updatedAtIso8601, ')
          ..write('tagsJson: $tagsJson, ')
          ..write('documentJson: $documentJson, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$RecipeDatabase extends GeneratedDatabase {
  _$RecipeDatabase(QueryExecutor e) : super(e);
  $RecipeDatabaseManager get managers => $RecipeDatabaseManager(this);
  late final $SavedRecipesTable savedRecipes = $SavedRecipesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [savedRecipes];
}

typedef $$SavedRecipesTableCreateCompanionBuilder = SavedRecipesCompanion
    Function({
  required String recipeId,
  required String title,
  Value<String?> description,
  required String updatedAtIso8601,
  required String tagsJson,
  required String documentJson,
  Value<bool> isFavorite,
  Value<int> rowid,
});
typedef $$SavedRecipesTableUpdateCompanionBuilder = SavedRecipesCompanion
    Function({
  Value<String> recipeId,
  Value<String> title,
  Value<String?> description,
  Value<String> updatedAtIso8601,
  Value<String> tagsJson,
  Value<String> documentJson,
  Value<bool> isFavorite,
  Value<int> rowid,
});

class $$SavedRecipesTableFilterComposer
    extends Composer<_$RecipeDatabase, $SavedRecipesTable> {
  $$SavedRecipesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get recipeId => $composableBuilder(
      column: $table.recipeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAtIso8601 => $composableBuilder(
      column: $table.updatedAtIso8601,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tagsJson => $composableBuilder(
      column: $table.tagsJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get documentJson => $composableBuilder(
      column: $table.documentJson, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isFavorite => $composableBuilder(
      column: $table.isFavorite, builder: (column) => ColumnFilters(column));
}

class $$SavedRecipesTableOrderingComposer
    extends Composer<_$RecipeDatabase, $SavedRecipesTable> {
  $$SavedRecipesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get recipeId => $composableBuilder(
      column: $table.recipeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAtIso8601 => $composableBuilder(
      column: $table.updatedAtIso8601,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tagsJson => $composableBuilder(
      column: $table.tagsJson, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get documentJson => $composableBuilder(
      column: $table.documentJson,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
      column: $table.isFavorite, builder: (column) => ColumnOrderings(column));
}

class $$SavedRecipesTableAnnotationComposer
    extends Composer<_$RecipeDatabase, $SavedRecipesTable> {
  $$SavedRecipesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get recipeId =>
      $composableBuilder(column: $table.recipeId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get updatedAtIso8601 => $composableBuilder(
      column: $table.updatedAtIso8601, builder: (column) => column);

  GeneratedColumn<String> get tagsJson =>
      $composableBuilder(column: $table.tagsJson, builder: (column) => column);

  GeneratedColumn<String> get documentJson => $composableBuilder(
      column: $table.documentJson, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
      column: $table.isFavorite, builder: (column) => column);
}

class $$SavedRecipesTableTableManager extends RootTableManager<
    _$RecipeDatabase,
    $SavedRecipesTable,
    SavedRecipe,
    $$SavedRecipesTableFilterComposer,
    $$SavedRecipesTableOrderingComposer,
    $$SavedRecipesTableAnnotationComposer,
    $$SavedRecipesTableCreateCompanionBuilder,
    $$SavedRecipesTableUpdateCompanionBuilder,
    (
      SavedRecipe,
      BaseReferences<_$RecipeDatabase, $SavedRecipesTable, SavedRecipe>
    ),
    SavedRecipe,
    PrefetchHooks Function()> {
  $$SavedRecipesTableTableManager(_$RecipeDatabase db, $SavedRecipesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SavedRecipesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SavedRecipesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SavedRecipesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> recipeId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String> updatedAtIso8601 = const Value.absent(),
            Value<String> tagsJson = const Value.absent(),
            Value<String> documentJson = const Value.absent(),
            Value<bool> isFavorite = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SavedRecipesCompanion(
            recipeId: recipeId,
            title: title,
            description: description,
            updatedAtIso8601: updatedAtIso8601,
            tagsJson: tagsJson,
            documentJson: documentJson,
            isFavorite: isFavorite,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String recipeId,
            required String title,
            Value<String?> description = const Value.absent(),
            required String updatedAtIso8601,
            required String tagsJson,
            required String documentJson,
            Value<bool> isFavorite = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SavedRecipesCompanion.insert(
            recipeId: recipeId,
            title: title,
            description: description,
            updatedAtIso8601: updatedAtIso8601,
            tagsJson: tagsJson,
            documentJson: documentJson,
            isFavorite: isFavorite,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SavedRecipesTableProcessedTableManager = ProcessedTableManager<
    _$RecipeDatabase,
    $SavedRecipesTable,
    SavedRecipe,
    $$SavedRecipesTableFilterComposer,
    $$SavedRecipesTableOrderingComposer,
    $$SavedRecipesTableAnnotationComposer,
    $$SavedRecipesTableCreateCompanionBuilder,
    $$SavedRecipesTableUpdateCompanionBuilder,
    (
      SavedRecipe,
      BaseReferences<_$RecipeDatabase, $SavedRecipesTable, SavedRecipe>
    ),
    SavedRecipe,
    PrefetchHooks Function()>;

class $RecipeDatabaseManager {
  final _$RecipeDatabase _db;
  $RecipeDatabaseManager(this._db);
  $$SavedRecipesTableTableManager get savedRecipes =>
      $$SavedRecipesTableTableManager(_db, _db.savedRecipes);
}
