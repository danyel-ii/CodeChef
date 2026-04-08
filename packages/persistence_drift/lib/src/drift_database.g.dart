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

class $AgentAccessSettingsTable extends AgentAccessSettings
    with TableInfo<$AgentAccessSettingsTable, AgentAccessSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AgentAccessSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _settingsIdMeta =
      const VerificationMeta('settingsId');
  @override
  late final GeneratedColumn<String> settingsId = GeneratedColumn<String>(
      'settings_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _agentAccessEnabledMeta =
      const VerificationMeta('agentAccessEnabled');
  @override
  late final GeneratedColumn<bool> agentAccessEnabled = GeneratedColumn<bool>(
      'agent_access_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("agent_access_enabled" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _requireVisibleSessionMeta =
      const VerificationMeta('requireVisibleSession');
  @override
  late final GeneratedColumn<bool> requireVisibleSession =
      GeneratedColumn<bool>('require_visible_session', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("require_visible_session" IN (0, 1))'),
          defaultValue: const Constant(true));
  static const VerificationMeta _allowDiscoveryWithoutConsentMeta =
      const VerificationMeta('allowDiscoveryWithoutConsent');
  @override
  late final GeneratedColumn<bool> allowDiscoveryWithoutConsent =
      GeneratedColumn<bool>(
          'allow_discovery_without_consent', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("allow_discovery_without_consent" IN (0, 1))'),
          defaultValue: const Constant(true));
  static const VerificationMeta _approvalModeMeta =
      const VerificationMeta('approvalMode');
  @override
  late final GeneratedColumn<String> approvalMode = GeneratedColumn<String>(
      'approval_mode', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('perRequest'));
  static const VerificationMeta _auditRetentionDaysMeta =
      const VerificationMeta('auditRetentionDays');
  @override
  late final GeneratedColumn<int> auditRetentionDays = GeneratedColumn<int>(
      'audit_retention_days', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(14));
  static const VerificationMeta _activeSessionIdMeta =
      const VerificationMeta('activeSessionId');
  @override
  late final GeneratedColumn<String> activeSessionId = GeneratedColumn<String>(
      'active_session_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _activeAgentIdMeta =
      const VerificationMeta('activeAgentId');
  @override
  late final GeneratedColumn<String> activeAgentId = GeneratedColumn<String>(
      'active_agent_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _activeTransportMeta =
      const VerificationMeta('activeTransport');
  @override
  late final GeneratedColumn<String> activeTransport = GeneratedColumn<String>(
      'active_transport', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _activePurposeMeta =
      const VerificationMeta('activePurpose');
  @override
  late final GeneratedColumn<String> activePurpose = GeneratedColumn<String>(
      'active_purpose', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _activeStartedAtIso8601Meta =
      const VerificationMeta('activeStartedAtIso8601');
  @override
  late final GeneratedColumn<String> activeStartedAtIso8601 =
      GeneratedColumn<String>('active_started_at_iso8601', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtIso8601Meta =
      const VerificationMeta('updatedAtIso8601');
  @override
  late final GeneratedColumn<String> updatedAtIso8601 = GeneratedColumn<String>(
      'updated_at_iso8601', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        settingsId,
        agentAccessEnabled,
        requireVisibleSession,
        allowDiscoveryWithoutConsent,
        approvalMode,
        auditRetentionDays,
        activeSessionId,
        activeAgentId,
        activeTransport,
        activePurpose,
        activeStartedAtIso8601,
        updatedAtIso8601
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'agent_access_settings';
  @override
  VerificationContext validateIntegrity(Insertable<AgentAccessSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('settings_id')) {
      context.handle(
          _settingsIdMeta,
          settingsId.isAcceptableOrUnknown(
              data['settings_id']!, _settingsIdMeta));
    } else if (isInserting) {
      context.missing(_settingsIdMeta);
    }
    if (data.containsKey('agent_access_enabled')) {
      context.handle(
          _agentAccessEnabledMeta,
          agentAccessEnabled.isAcceptableOrUnknown(
              data['agent_access_enabled']!, _agentAccessEnabledMeta));
    }
    if (data.containsKey('require_visible_session')) {
      context.handle(
          _requireVisibleSessionMeta,
          requireVisibleSession.isAcceptableOrUnknown(
              data['require_visible_session']!, _requireVisibleSessionMeta));
    }
    if (data.containsKey('allow_discovery_without_consent')) {
      context.handle(
          _allowDiscoveryWithoutConsentMeta,
          allowDiscoveryWithoutConsent.isAcceptableOrUnknown(
              data['allow_discovery_without_consent']!,
              _allowDiscoveryWithoutConsentMeta));
    }
    if (data.containsKey('approval_mode')) {
      context.handle(
          _approvalModeMeta,
          approvalMode.isAcceptableOrUnknown(
              data['approval_mode']!, _approvalModeMeta));
    }
    if (data.containsKey('audit_retention_days')) {
      context.handle(
          _auditRetentionDaysMeta,
          auditRetentionDays.isAcceptableOrUnknown(
              data['audit_retention_days']!, _auditRetentionDaysMeta));
    }
    if (data.containsKey('active_session_id')) {
      context.handle(
          _activeSessionIdMeta,
          activeSessionId.isAcceptableOrUnknown(
              data['active_session_id']!, _activeSessionIdMeta));
    }
    if (data.containsKey('active_agent_id')) {
      context.handle(
          _activeAgentIdMeta,
          activeAgentId.isAcceptableOrUnknown(
              data['active_agent_id']!, _activeAgentIdMeta));
    }
    if (data.containsKey('active_transport')) {
      context.handle(
          _activeTransportMeta,
          activeTransport.isAcceptableOrUnknown(
              data['active_transport']!, _activeTransportMeta));
    }
    if (data.containsKey('active_purpose')) {
      context.handle(
          _activePurposeMeta,
          activePurpose.isAcceptableOrUnknown(
              data['active_purpose']!, _activePurposeMeta));
    }
    if (data.containsKey('active_started_at_iso8601')) {
      context.handle(
          _activeStartedAtIso8601Meta,
          activeStartedAtIso8601.isAcceptableOrUnknown(
              data['active_started_at_iso8601']!, _activeStartedAtIso8601Meta));
    }
    if (data.containsKey('updated_at_iso8601')) {
      context.handle(
          _updatedAtIso8601Meta,
          updatedAtIso8601.isAcceptableOrUnknown(
              data['updated_at_iso8601']!, _updatedAtIso8601Meta));
    } else if (isInserting) {
      context.missing(_updatedAtIso8601Meta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {settingsId};
  @override
  AgentAccessSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AgentAccessSetting(
      settingsId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}settings_id'])!,
      agentAccessEnabled: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}agent_access_enabled'])!,
      requireVisibleSession: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}require_visible_session'])!,
      allowDiscoveryWithoutConsent: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}allow_discovery_without_consent'])!,
      approvalMode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}approval_mode'])!,
      auditRetentionDays: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}audit_retention_days'])!,
      activeSessionId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}active_session_id']),
      activeAgentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}active_agent_id']),
      activeTransport: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}active_transport']),
      activePurpose: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}active_purpose']),
      activeStartedAtIso8601: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}active_started_at_iso8601']),
      updatedAtIso8601: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}updated_at_iso8601'])!,
    );
  }

  @override
  $AgentAccessSettingsTable createAlias(String alias) {
    return $AgentAccessSettingsTable(attachedDatabase, alias);
  }
}

class AgentAccessSetting extends DataClass
    implements Insertable<AgentAccessSetting> {
  final String settingsId;
  final bool agentAccessEnabled;
  final bool requireVisibleSession;
  final bool allowDiscoveryWithoutConsent;
  final String approvalMode;
  final int auditRetentionDays;
  final String? activeSessionId;
  final String? activeAgentId;
  final String? activeTransport;
  final String? activePurpose;
  final String? activeStartedAtIso8601;
  final String updatedAtIso8601;
  const AgentAccessSetting(
      {required this.settingsId,
      required this.agentAccessEnabled,
      required this.requireVisibleSession,
      required this.allowDiscoveryWithoutConsent,
      required this.approvalMode,
      required this.auditRetentionDays,
      this.activeSessionId,
      this.activeAgentId,
      this.activeTransport,
      this.activePurpose,
      this.activeStartedAtIso8601,
      required this.updatedAtIso8601});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['settings_id'] = Variable<String>(settingsId);
    map['agent_access_enabled'] = Variable<bool>(agentAccessEnabled);
    map['require_visible_session'] = Variable<bool>(requireVisibleSession);
    map['allow_discovery_without_consent'] =
        Variable<bool>(allowDiscoveryWithoutConsent);
    map['approval_mode'] = Variable<String>(approvalMode);
    map['audit_retention_days'] = Variable<int>(auditRetentionDays);
    if (!nullToAbsent || activeSessionId != null) {
      map['active_session_id'] = Variable<String>(activeSessionId);
    }
    if (!nullToAbsent || activeAgentId != null) {
      map['active_agent_id'] = Variable<String>(activeAgentId);
    }
    if (!nullToAbsent || activeTransport != null) {
      map['active_transport'] = Variable<String>(activeTransport);
    }
    if (!nullToAbsent || activePurpose != null) {
      map['active_purpose'] = Variable<String>(activePurpose);
    }
    if (!nullToAbsent || activeStartedAtIso8601 != null) {
      map['active_started_at_iso8601'] =
          Variable<String>(activeStartedAtIso8601);
    }
    map['updated_at_iso8601'] = Variable<String>(updatedAtIso8601);
    return map;
  }

  AgentAccessSettingsCompanion toCompanion(bool nullToAbsent) {
    return AgentAccessSettingsCompanion(
      settingsId: Value(settingsId),
      agentAccessEnabled: Value(agentAccessEnabled),
      requireVisibleSession: Value(requireVisibleSession),
      allowDiscoveryWithoutConsent: Value(allowDiscoveryWithoutConsent),
      approvalMode: Value(approvalMode),
      auditRetentionDays: Value(auditRetentionDays),
      activeSessionId: activeSessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(activeSessionId),
      activeAgentId: activeAgentId == null && nullToAbsent
          ? const Value.absent()
          : Value(activeAgentId),
      activeTransport: activeTransport == null && nullToAbsent
          ? const Value.absent()
          : Value(activeTransport),
      activePurpose: activePurpose == null && nullToAbsent
          ? const Value.absent()
          : Value(activePurpose),
      activeStartedAtIso8601: activeStartedAtIso8601 == null && nullToAbsent
          ? const Value.absent()
          : Value(activeStartedAtIso8601),
      updatedAtIso8601: Value(updatedAtIso8601),
    );
  }

  factory AgentAccessSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AgentAccessSetting(
      settingsId: serializer.fromJson<String>(json['settingsId']),
      agentAccessEnabled: serializer.fromJson<bool>(json['agentAccessEnabled']),
      requireVisibleSession:
          serializer.fromJson<bool>(json['requireVisibleSession']),
      allowDiscoveryWithoutConsent:
          serializer.fromJson<bool>(json['allowDiscoveryWithoutConsent']),
      approvalMode: serializer.fromJson<String>(json['approvalMode']),
      auditRetentionDays: serializer.fromJson<int>(json['auditRetentionDays']),
      activeSessionId: serializer.fromJson<String?>(json['activeSessionId']),
      activeAgentId: serializer.fromJson<String?>(json['activeAgentId']),
      activeTransport: serializer.fromJson<String?>(json['activeTransport']),
      activePurpose: serializer.fromJson<String?>(json['activePurpose']),
      activeStartedAtIso8601:
          serializer.fromJson<String?>(json['activeStartedAtIso8601']),
      updatedAtIso8601: serializer.fromJson<String>(json['updatedAtIso8601']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'settingsId': serializer.toJson<String>(settingsId),
      'agentAccessEnabled': serializer.toJson<bool>(agentAccessEnabled),
      'requireVisibleSession': serializer.toJson<bool>(requireVisibleSession),
      'allowDiscoveryWithoutConsent':
          serializer.toJson<bool>(allowDiscoveryWithoutConsent),
      'approvalMode': serializer.toJson<String>(approvalMode),
      'auditRetentionDays': serializer.toJson<int>(auditRetentionDays),
      'activeSessionId': serializer.toJson<String?>(activeSessionId),
      'activeAgentId': serializer.toJson<String?>(activeAgentId),
      'activeTransport': serializer.toJson<String?>(activeTransport),
      'activePurpose': serializer.toJson<String?>(activePurpose),
      'activeStartedAtIso8601':
          serializer.toJson<String?>(activeStartedAtIso8601),
      'updatedAtIso8601': serializer.toJson<String>(updatedAtIso8601),
    };
  }

  AgentAccessSetting copyWith(
          {String? settingsId,
          bool? agentAccessEnabled,
          bool? requireVisibleSession,
          bool? allowDiscoveryWithoutConsent,
          String? approvalMode,
          int? auditRetentionDays,
          Value<String?> activeSessionId = const Value.absent(),
          Value<String?> activeAgentId = const Value.absent(),
          Value<String?> activeTransport = const Value.absent(),
          Value<String?> activePurpose = const Value.absent(),
          Value<String?> activeStartedAtIso8601 = const Value.absent(),
          String? updatedAtIso8601}) =>
      AgentAccessSetting(
        settingsId: settingsId ?? this.settingsId,
        agentAccessEnabled: agentAccessEnabled ?? this.agentAccessEnabled,
        requireVisibleSession:
            requireVisibleSession ?? this.requireVisibleSession,
        allowDiscoveryWithoutConsent:
            allowDiscoveryWithoutConsent ?? this.allowDiscoveryWithoutConsent,
        approvalMode: approvalMode ?? this.approvalMode,
        auditRetentionDays: auditRetentionDays ?? this.auditRetentionDays,
        activeSessionId: activeSessionId.present
            ? activeSessionId.value
            : this.activeSessionId,
        activeAgentId:
            activeAgentId.present ? activeAgentId.value : this.activeAgentId,
        activeTransport: activeTransport.present
            ? activeTransport.value
            : this.activeTransport,
        activePurpose:
            activePurpose.present ? activePurpose.value : this.activePurpose,
        activeStartedAtIso8601: activeStartedAtIso8601.present
            ? activeStartedAtIso8601.value
            : this.activeStartedAtIso8601,
        updatedAtIso8601: updatedAtIso8601 ?? this.updatedAtIso8601,
      );
  AgentAccessSetting copyWithCompanion(AgentAccessSettingsCompanion data) {
    return AgentAccessSetting(
      settingsId:
          data.settingsId.present ? data.settingsId.value : this.settingsId,
      agentAccessEnabled: data.agentAccessEnabled.present
          ? data.agentAccessEnabled.value
          : this.agentAccessEnabled,
      requireVisibleSession: data.requireVisibleSession.present
          ? data.requireVisibleSession.value
          : this.requireVisibleSession,
      allowDiscoveryWithoutConsent: data.allowDiscoveryWithoutConsent.present
          ? data.allowDiscoveryWithoutConsent.value
          : this.allowDiscoveryWithoutConsent,
      approvalMode: data.approvalMode.present
          ? data.approvalMode.value
          : this.approvalMode,
      auditRetentionDays: data.auditRetentionDays.present
          ? data.auditRetentionDays.value
          : this.auditRetentionDays,
      activeSessionId: data.activeSessionId.present
          ? data.activeSessionId.value
          : this.activeSessionId,
      activeAgentId: data.activeAgentId.present
          ? data.activeAgentId.value
          : this.activeAgentId,
      activeTransport: data.activeTransport.present
          ? data.activeTransport.value
          : this.activeTransport,
      activePurpose: data.activePurpose.present
          ? data.activePurpose.value
          : this.activePurpose,
      activeStartedAtIso8601: data.activeStartedAtIso8601.present
          ? data.activeStartedAtIso8601.value
          : this.activeStartedAtIso8601,
      updatedAtIso8601: data.updatedAtIso8601.present
          ? data.updatedAtIso8601.value
          : this.updatedAtIso8601,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AgentAccessSetting(')
          ..write('settingsId: $settingsId, ')
          ..write('agentAccessEnabled: $agentAccessEnabled, ')
          ..write('requireVisibleSession: $requireVisibleSession, ')
          ..write(
              'allowDiscoveryWithoutConsent: $allowDiscoveryWithoutConsent, ')
          ..write('approvalMode: $approvalMode, ')
          ..write('auditRetentionDays: $auditRetentionDays, ')
          ..write('activeSessionId: $activeSessionId, ')
          ..write('activeAgentId: $activeAgentId, ')
          ..write('activeTransport: $activeTransport, ')
          ..write('activePurpose: $activePurpose, ')
          ..write('activeStartedAtIso8601: $activeStartedAtIso8601, ')
          ..write('updatedAtIso8601: $updatedAtIso8601')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      settingsId,
      agentAccessEnabled,
      requireVisibleSession,
      allowDiscoveryWithoutConsent,
      approvalMode,
      auditRetentionDays,
      activeSessionId,
      activeAgentId,
      activeTransport,
      activePurpose,
      activeStartedAtIso8601,
      updatedAtIso8601);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AgentAccessSetting &&
          other.settingsId == this.settingsId &&
          other.agentAccessEnabled == this.agentAccessEnabled &&
          other.requireVisibleSession == this.requireVisibleSession &&
          other.allowDiscoveryWithoutConsent ==
              this.allowDiscoveryWithoutConsent &&
          other.approvalMode == this.approvalMode &&
          other.auditRetentionDays == this.auditRetentionDays &&
          other.activeSessionId == this.activeSessionId &&
          other.activeAgentId == this.activeAgentId &&
          other.activeTransport == this.activeTransport &&
          other.activePurpose == this.activePurpose &&
          other.activeStartedAtIso8601 == this.activeStartedAtIso8601 &&
          other.updatedAtIso8601 == this.updatedAtIso8601);
}

class AgentAccessSettingsCompanion extends UpdateCompanion<AgentAccessSetting> {
  final Value<String> settingsId;
  final Value<bool> agentAccessEnabled;
  final Value<bool> requireVisibleSession;
  final Value<bool> allowDiscoveryWithoutConsent;
  final Value<String> approvalMode;
  final Value<int> auditRetentionDays;
  final Value<String?> activeSessionId;
  final Value<String?> activeAgentId;
  final Value<String?> activeTransport;
  final Value<String?> activePurpose;
  final Value<String?> activeStartedAtIso8601;
  final Value<String> updatedAtIso8601;
  final Value<int> rowid;
  const AgentAccessSettingsCompanion({
    this.settingsId = const Value.absent(),
    this.agentAccessEnabled = const Value.absent(),
    this.requireVisibleSession = const Value.absent(),
    this.allowDiscoveryWithoutConsent = const Value.absent(),
    this.approvalMode = const Value.absent(),
    this.auditRetentionDays = const Value.absent(),
    this.activeSessionId = const Value.absent(),
    this.activeAgentId = const Value.absent(),
    this.activeTransport = const Value.absent(),
    this.activePurpose = const Value.absent(),
    this.activeStartedAtIso8601 = const Value.absent(),
    this.updatedAtIso8601 = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AgentAccessSettingsCompanion.insert({
    required String settingsId,
    this.agentAccessEnabled = const Value.absent(),
    this.requireVisibleSession = const Value.absent(),
    this.allowDiscoveryWithoutConsent = const Value.absent(),
    this.approvalMode = const Value.absent(),
    this.auditRetentionDays = const Value.absent(),
    this.activeSessionId = const Value.absent(),
    this.activeAgentId = const Value.absent(),
    this.activeTransport = const Value.absent(),
    this.activePurpose = const Value.absent(),
    this.activeStartedAtIso8601 = const Value.absent(),
    required String updatedAtIso8601,
    this.rowid = const Value.absent(),
  })  : settingsId = Value(settingsId),
        updatedAtIso8601 = Value(updatedAtIso8601);
  static Insertable<AgentAccessSetting> custom({
    Expression<String>? settingsId,
    Expression<bool>? agentAccessEnabled,
    Expression<bool>? requireVisibleSession,
    Expression<bool>? allowDiscoveryWithoutConsent,
    Expression<String>? approvalMode,
    Expression<int>? auditRetentionDays,
    Expression<String>? activeSessionId,
    Expression<String>? activeAgentId,
    Expression<String>? activeTransport,
    Expression<String>? activePurpose,
    Expression<String>? activeStartedAtIso8601,
    Expression<String>? updatedAtIso8601,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (settingsId != null) 'settings_id': settingsId,
      if (agentAccessEnabled != null)
        'agent_access_enabled': agentAccessEnabled,
      if (requireVisibleSession != null)
        'require_visible_session': requireVisibleSession,
      if (allowDiscoveryWithoutConsent != null)
        'allow_discovery_without_consent': allowDiscoveryWithoutConsent,
      if (approvalMode != null) 'approval_mode': approvalMode,
      if (auditRetentionDays != null)
        'audit_retention_days': auditRetentionDays,
      if (activeSessionId != null) 'active_session_id': activeSessionId,
      if (activeAgentId != null) 'active_agent_id': activeAgentId,
      if (activeTransport != null) 'active_transport': activeTransport,
      if (activePurpose != null) 'active_purpose': activePurpose,
      if (activeStartedAtIso8601 != null)
        'active_started_at_iso8601': activeStartedAtIso8601,
      if (updatedAtIso8601 != null) 'updated_at_iso8601': updatedAtIso8601,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AgentAccessSettingsCompanion copyWith(
      {Value<String>? settingsId,
      Value<bool>? agentAccessEnabled,
      Value<bool>? requireVisibleSession,
      Value<bool>? allowDiscoveryWithoutConsent,
      Value<String>? approvalMode,
      Value<int>? auditRetentionDays,
      Value<String?>? activeSessionId,
      Value<String?>? activeAgentId,
      Value<String?>? activeTransport,
      Value<String?>? activePurpose,
      Value<String?>? activeStartedAtIso8601,
      Value<String>? updatedAtIso8601,
      Value<int>? rowid}) {
    return AgentAccessSettingsCompanion(
      settingsId: settingsId ?? this.settingsId,
      agentAccessEnabled: agentAccessEnabled ?? this.agentAccessEnabled,
      requireVisibleSession:
          requireVisibleSession ?? this.requireVisibleSession,
      allowDiscoveryWithoutConsent:
          allowDiscoveryWithoutConsent ?? this.allowDiscoveryWithoutConsent,
      approvalMode: approvalMode ?? this.approvalMode,
      auditRetentionDays: auditRetentionDays ?? this.auditRetentionDays,
      activeSessionId: activeSessionId ?? this.activeSessionId,
      activeAgentId: activeAgentId ?? this.activeAgentId,
      activeTransport: activeTransport ?? this.activeTransport,
      activePurpose: activePurpose ?? this.activePurpose,
      activeStartedAtIso8601:
          activeStartedAtIso8601 ?? this.activeStartedAtIso8601,
      updatedAtIso8601: updatedAtIso8601 ?? this.updatedAtIso8601,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (settingsId.present) {
      map['settings_id'] = Variable<String>(settingsId.value);
    }
    if (agentAccessEnabled.present) {
      map['agent_access_enabled'] = Variable<bool>(agentAccessEnabled.value);
    }
    if (requireVisibleSession.present) {
      map['require_visible_session'] =
          Variable<bool>(requireVisibleSession.value);
    }
    if (allowDiscoveryWithoutConsent.present) {
      map['allow_discovery_without_consent'] =
          Variable<bool>(allowDiscoveryWithoutConsent.value);
    }
    if (approvalMode.present) {
      map['approval_mode'] = Variable<String>(approvalMode.value);
    }
    if (auditRetentionDays.present) {
      map['audit_retention_days'] = Variable<int>(auditRetentionDays.value);
    }
    if (activeSessionId.present) {
      map['active_session_id'] = Variable<String>(activeSessionId.value);
    }
    if (activeAgentId.present) {
      map['active_agent_id'] = Variable<String>(activeAgentId.value);
    }
    if (activeTransport.present) {
      map['active_transport'] = Variable<String>(activeTransport.value);
    }
    if (activePurpose.present) {
      map['active_purpose'] = Variable<String>(activePurpose.value);
    }
    if (activeStartedAtIso8601.present) {
      map['active_started_at_iso8601'] =
          Variable<String>(activeStartedAtIso8601.value);
    }
    if (updatedAtIso8601.present) {
      map['updated_at_iso8601'] = Variable<String>(updatedAtIso8601.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AgentAccessSettingsCompanion(')
          ..write('settingsId: $settingsId, ')
          ..write('agentAccessEnabled: $agentAccessEnabled, ')
          ..write('requireVisibleSession: $requireVisibleSession, ')
          ..write(
              'allowDiscoveryWithoutConsent: $allowDiscoveryWithoutConsent, ')
          ..write('approvalMode: $approvalMode, ')
          ..write('auditRetentionDays: $auditRetentionDays, ')
          ..write('activeSessionId: $activeSessionId, ')
          ..write('activeAgentId: $activeAgentId, ')
          ..write('activeTransport: $activeTransport, ')
          ..write('activePurpose: $activePurpose, ')
          ..write('activeStartedAtIso8601: $activeStartedAtIso8601, ')
          ..write('updatedAtIso8601: $updatedAtIso8601, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AgentSessionsTable extends AgentSessions
    with TableInfo<$AgentSessionsTable, AgentSession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AgentSessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
      'session_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _agentIdMeta =
      const VerificationMeta('agentId');
  @override
  late final GeneratedColumn<String> agentId = GeneratedColumn<String>(
      'agent_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _transportMeta =
      const VerificationMeta('transport');
  @override
  late final GeneratedColumn<String> transport = GeneratedColumn<String>(
      'transport', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _purposeMeta =
      const VerificationMeta('purpose');
  @override
  late final GeneratedColumn<String> purpose = GeneratedColumn<String>(
      'purpose', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _consentGrantedMeta =
      const VerificationMeta('consentGranted');
  @override
  late final GeneratedColumn<bool> consentGranted = GeneratedColumn<bool>(
      'consent_granted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("consent_granted" IN (0, 1))'));
  static const VerificationMeta _visibleMeta =
      const VerificationMeta('visible');
  @override
  late final GeneratedColumn<bool> visible = GeneratedColumn<bool>(
      'visible', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("visible" IN (0, 1))'));
  static const VerificationMeta _startedAtIso8601Meta =
      const VerificationMeta('startedAtIso8601');
  @override
  late final GeneratedColumn<String> startedAtIso8601 = GeneratedColumn<String>(
      'started_at_iso8601', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _endedAtIso8601Meta =
      const VerificationMeta('endedAtIso8601');
  @override
  late final GeneratedColumn<String> endedAtIso8601 = GeneratedColumn<String>(
      'ended_at_iso8601', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        sessionId,
        agentId,
        transport,
        purpose,
        consentGranted,
        visible,
        startedAtIso8601,
        endedAtIso8601
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'agent_sessions';
  @override
  VerificationContext validateIntegrity(Insertable<AgentSession> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('agent_id')) {
      context.handle(_agentIdMeta,
          agentId.isAcceptableOrUnknown(data['agent_id']!, _agentIdMeta));
    } else if (isInserting) {
      context.missing(_agentIdMeta);
    }
    if (data.containsKey('transport')) {
      context.handle(_transportMeta,
          transport.isAcceptableOrUnknown(data['transport']!, _transportMeta));
    } else if (isInserting) {
      context.missing(_transportMeta);
    }
    if (data.containsKey('purpose')) {
      context.handle(_purposeMeta,
          purpose.isAcceptableOrUnknown(data['purpose']!, _purposeMeta));
    }
    if (data.containsKey('consent_granted')) {
      context.handle(
          _consentGrantedMeta,
          consentGranted.isAcceptableOrUnknown(
              data['consent_granted']!, _consentGrantedMeta));
    } else if (isInserting) {
      context.missing(_consentGrantedMeta);
    }
    if (data.containsKey('visible')) {
      context.handle(_visibleMeta,
          visible.isAcceptableOrUnknown(data['visible']!, _visibleMeta));
    } else if (isInserting) {
      context.missing(_visibleMeta);
    }
    if (data.containsKey('started_at_iso8601')) {
      context.handle(
          _startedAtIso8601Meta,
          startedAtIso8601.isAcceptableOrUnknown(
              data['started_at_iso8601']!, _startedAtIso8601Meta));
    } else if (isInserting) {
      context.missing(_startedAtIso8601Meta);
    }
    if (data.containsKey('ended_at_iso8601')) {
      context.handle(
          _endedAtIso8601Meta,
          endedAtIso8601.isAcceptableOrUnknown(
              data['ended_at_iso8601']!, _endedAtIso8601Meta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {sessionId};
  @override
  AgentSession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AgentSession(
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_id'])!,
      agentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}agent_id'])!,
      transport: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}transport'])!,
      purpose: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}purpose']),
      consentGranted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}consent_granted'])!,
      visible: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}visible'])!,
      startedAtIso8601: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}started_at_iso8601'])!,
      endedAtIso8601: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}ended_at_iso8601']),
    );
  }

  @override
  $AgentSessionsTable createAlias(String alias) {
    return $AgentSessionsTable(attachedDatabase, alias);
  }
}

class AgentSession extends DataClass implements Insertable<AgentSession> {
  final String sessionId;
  final String agentId;
  final String transport;
  final String? purpose;
  final bool consentGranted;
  final bool visible;
  final String startedAtIso8601;
  final String? endedAtIso8601;
  const AgentSession(
      {required this.sessionId,
      required this.agentId,
      required this.transport,
      this.purpose,
      required this.consentGranted,
      required this.visible,
      required this.startedAtIso8601,
      this.endedAtIso8601});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['session_id'] = Variable<String>(sessionId);
    map['agent_id'] = Variable<String>(agentId);
    map['transport'] = Variable<String>(transport);
    if (!nullToAbsent || purpose != null) {
      map['purpose'] = Variable<String>(purpose);
    }
    map['consent_granted'] = Variable<bool>(consentGranted);
    map['visible'] = Variable<bool>(visible);
    map['started_at_iso8601'] = Variable<String>(startedAtIso8601);
    if (!nullToAbsent || endedAtIso8601 != null) {
      map['ended_at_iso8601'] = Variable<String>(endedAtIso8601);
    }
    return map;
  }

  AgentSessionsCompanion toCompanion(bool nullToAbsent) {
    return AgentSessionsCompanion(
      sessionId: Value(sessionId),
      agentId: Value(agentId),
      transport: Value(transport),
      purpose: purpose == null && nullToAbsent
          ? const Value.absent()
          : Value(purpose),
      consentGranted: Value(consentGranted),
      visible: Value(visible),
      startedAtIso8601: Value(startedAtIso8601),
      endedAtIso8601: endedAtIso8601 == null && nullToAbsent
          ? const Value.absent()
          : Value(endedAtIso8601),
    );
  }

  factory AgentSession.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AgentSession(
      sessionId: serializer.fromJson<String>(json['sessionId']),
      agentId: serializer.fromJson<String>(json['agentId']),
      transport: serializer.fromJson<String>(json['transport']),
      purpose: serializer.fromJson<String?>(json['purpose']),
      consentGranted: serializer.fromJson<bool>(json['consentGranted']),
      visible: serializer.fromJson<bool>(json['visible']),
      startedAtIso8601: serializer.fromJson<String>(json['startedAtIso8601']),
      endedAtIso8601: serializer.fromJson<String?>(json['endedAtIso8601']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sessionId': serializer.toJson<String>(sessionId),
      'agentId': serializer.toJson<String>(agentId),
      'transport': serializer.toJson<String>(transport),
      'purpose': serializer.toJson<String?>(purpose),
      'consentGranted': serializer.toJson<bool>(consentGranted),
      'visible': serializer.toJson<bool>(visible),
      'startedAtIso8601': serializer.toJson<String>(startedAtIso8601),
      'endedAtIso8601': serializer.toJson<String?>(endedAtIso8601),
    };
  }

  AgentSession copyWith(
          {String? sessionId,
          String? agentId,
          String? transport,
          Value<String?> purpose = const Value.absent(),
          bool? consentGranted,
          bool? visible,
          String? startedAtIso8601,
          Value<String?> endedAtIso8601 = const Value.absent()}) =>
      AgentSession(
        sessionId: sessionId ?? this.sessionId,
        agentId: agentId ?? this.agentId,
        transport: transport ?? this.transport,
        purpose: purpose.present ? purpose.value : this.purpose,
        consentGranted: consentGranted ?? this.consentGranted,
        visible: visible ?? this.visible,
        startedAtIso8601: startedAtIso8601 ?? this.startedAtIso8601,
        endedAtIso8601:
            endedAtIso8601.present ? endedAtIso8601.value : this.endedAtIso8601,
      );
  AgentSession copyWithCompanion(AgentSessionsCompanion data) {
    return AgentSession(
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      agentId: data.agentId.present ? data.agentId.value : this.agentId,
      transport: data.transport.present ? data.transport.value : this.transport,
      purpose: data.purpose.present ? data.purpose.value : this.purpose,
      consentGranted: data.consentGranted.present
          ? data.consentGranted.value
          : this.consentGranted,
      visible: data.visible.present ? data.visible.value : this.visible,
      startedAtIso8601: data.startedAtIso8601.present
          ? data.startedAtIso8601.value
          : this.startedAtIso8601,
      endedAtIso8601: data.endedAtIso8601.present
          ? data.endedAtIso8601.value
          : this.endedAtIso8601,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AgentSession(')
          ..write('sessionId: $sessionId, ')
          ..write('agentId: $agentId, ')
          ..write('transport: $transport, ')
          ..write('purpose: $purpose, ')
          ..write('consentGranted: $consentGranted, ')
          ..write('visible: $visible, ')
          ..write('startedAtIso8601: $startedAtIso8601, ')
          ..write('endedAtIso8601: $endedAtIso8601')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(sessionId, agentId, transport, purpose,
      consentGranted, visible, startedAtIso8601, endedAtIso8601);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AgentSession &&
          other.sessionId == this.sessionId &&
          other.agentId == this.agentId &&
          other.transport == this.transport &&
          other.purpose == this.purpose &&
          other.consentGranted == this.consentGranted &&
          other.visible == this.visible &&
          other.startedAtIso8601 == this.startedAtIso8601 &&
          other.endedAtIso8601 == this.endedAtIso8601);
}

class AgentSessionsCompanion extends UpdateCompanion<AgentSession> {
  final Value<String> sessionId;
  final Value<String> agentId;
  final Value<String> transport;
  final Value<String?> purpose;
  final Value<bool> consentGranted;
  final Value<bool> visible;
  final Value<String> startedAtIso8601;
  final Value<String?> endedAtIso8601;
  final Value<int> rowid;
  const AgentSessionsCompanion({
    this.sessionId = const Value.absent(),
    this.agentId = const Value.absent(),
    this.transport = const Value.absent(),
    this.purpose = const Value.absent(),
    this.consentGranted = const Value.absent(),
    this.visible = const Value.absent(),
    this.startedAtIso8601 = const Value.absent(),
    this.endedAtIso8601 = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AgentSessionsCompanion.insert({
    required String sessionId,
    required String agentId,
    required String transport,
    this.purpose = const Value.absent(),
    required bool consentGranted,
    required bool visible,
    required String startedAtIso8601,
    this.endedAtIso8601 = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : sessionId = Value(sessionId),
        agentId = Value(agentId),
        transport = Value(transport),
        consentGranted = Value(consentGranted),
        visible = Value(visible),
        startedAtIso8601 = Value(startedAtIso8601);
  static Insertable<AgentSession> custom({
    Expression<String>? sessionId,
    Expression<String>? agentId,
    Expression<String>? transport,
    Expression<String>? purpose,
    Expression<bool>? consentGranted,
    Expression<bool>? visible,
    Expression<String>? startedAtIso8601,
    Expression<String>? endedAtIso8601,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (sessionId != null) 'session_id': sessionId,
      if (agentId != null) 'agent_id': agentId,
      if (transport != null) 'transport': transport,
      if (purpose != null) 'purpose': purpose,
      if (consentGranted != null) 'consent_granted': consentGranted,
      if (visible != null) 'visible': visible,
      if (startedAtIso8601 != null) 'started_at_iso8601': startedAtIso8601,
      if (endedAtIso8601 != null) 'ended_at_iso8601': endedAtIso8601,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AgentSessionsCompanion copyWith(
      {Value<String>? sessionId,
      Value<String>? agentId,
      Value<String>? transport,
      Value<String?>? purpose,
      Value<bool>? consentGranted,
      Value<bool>? visible,
      Value<String>? startedAtIso8601,
      Value<String?>? endedAtIso8601,
      Value<int>? rowid}) {
    return AgentSessionsCompanion(
      sessionId: sessionId ?? this.sessionId,
      agentId: agentId ?? this.agentId,
      transport: transport ?? this.transport,
      purpose: purpose ?? this.purpose,
      consentGranted: consentGranted ?? this.consentGranted,
      visible: visible ?? this.visible,
      startedAtIso8601: startedAtIso8601 ?? this.startedAtIso8601,
      endedAtIso8601: endedAtIso8601 ?? this.endedAtIso8601,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (agentId.present) {
      map['agent_id'] = Variable<String>(agentId.value);
    }
    if (transport.present) {
      map['transport'] = Variable<String>(transport.value);
    }
    if (purpose.present) {
      map['purpose'] = Variable<String>(purpose.value);
    }
    if (consentGranted.present) {
      map['consent_granted'] = Variable<bool>(consentGranted.value);
    }
    if (visible.present) {
      map['visible'] = Variable<bool>(visible.value);
    }
    if (startedAtIso8601.present) {
      map['started_at_iso8601'] = Variable<String>(startedAtIso8601.value);
    }
    if (endedAtIso8601.present) {
      map['ended_at_iso8601'] = Variable<String>(endedAtIso8601.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AgentSessionsCompanion(')
          ..write('sessionId: $sessionId, ')
          ..write('agentId: $agentId, ')
          ..write('transport: $transport, ')
          ..write('purpose: $purpose, ')
          ..write('consentGranted: $consentGranted, ')
          ..write('visible: $visible, ')
          ..write('startedAtIso8601: $startedAtIso8601, ')
          ..write('endedAtIso8601: $endedAtIso8601, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AgentAuditRecordsTable extends AgentAuditRecords
    with TableInfo<$AgentAuditRecordsTable, AgentAuditRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AgentAuditRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _occurredAtIso8601Meta =
      const VerificationMeta('occurredAtIso8601');
  @override
  late final GeneratedColumn<String> occurredAtIso8601 =
      GeneratedColumn<String>('occurred_at_iso8601', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _toolMeta = const VerificationMeta('tool');
  @override
  late final GeneratedColumn<String> tool = GeneratedColumn<String>(
      'tool', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
      'kind', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _agentIdMeta =
      const VerificationMeta('agentId');
  @override
  late final GeneratedColumn<String> agentId = GeneratedColumn<String>(
      'agent_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _transportMeta =
      const VerificationMeta('transport');
  @override
  late final GeneratedColumn<String> transport = GeneratedColumn<String>(
      'transport', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _allowedMeta =
      const VerificationMeta('allowed');
  @override
  late final GeneratedColumn<bool> allowed = GeneratedColumn<bool>(
      'allowed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("allowed" IN (0, 1))'));
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
      'session_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
      'reason', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _detailsJsonMeta =
      const VerificationMeta('detailsJson');
  @override
  late final GeneratedColumn<String> detailsJson = GeneratedColumn<String>(
      'details_json', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        occurredAtIso8601,
        tool,
        kind,
        agentId,
        transport,
        allowed,
        sessionId,
        reason,
        detailsJson
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'agent_audit_records';
  @override
  VerificationContext validateIntegrity(Insertable<AgentAuditRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('occurred_at_iso8601')) {
      context.handle(
          _occurredAtIso8601Meta,
          occurredAtIso8601.isAcceptableOrUnknown(
              data['occurred_at_iso8601']!, _occurredAtIso8601Meta));
    } else if (isInserting) {
      context.missing(_occurredAtIso8601Meta);
    }
    if (data.containsKey('tool')) {
      context.handle(
          _toolMeta, tool.isAcceptableOrUnknown(data['tool']!, _toolMeta));
    } else if (isInserting) {
      context.missing(_toolMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
          _kindMeta, kind.isAcceptableOrUnknown(data['kind']!, _kindMeta));
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('agent_id')) {
      context.handle(_agentIdMeta,
          agentId.isAcceptableOrUnknown(data['agent_id']!, _agentIdMeta));
    } else if (isInserting) {
      context.missing(_agentIdMeta);
    }
    if (data.containsKey('transport')) {
      context.handle(_transportMeta,
          transport.isAcceptableOrUnknown(data['transport']!, _transportMeta));
    } else if (isInserting) {
      context.missing(_transportMeta);
    }
    if (data.containsKey('allowed')) {
      context.handle(_allowedMeta,
          allowed.isAcceptableOrUnknown(data['allowed']!, _allowedMeta));
    } else if (isInserting) {
      context.missing(_allowedMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    }
    if (data.containsKey('reason')) {
      context.handle(_reasonMeta,
          reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta));
    }
    if (data.containsKey('details_json')) {
      context.handle(
          _detailsJsonMeta,
          detailsJson.isAcceptableOrUnknown(
              data['details_json']!, _detailsJsonMeta));
    } else if (isInserting) {
      context.missing(_detailsJsonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AgentAuditRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AgentAuditRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      occurredAtIso8601: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}occurred_at_iso8601'])!,
      tool: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tool'])!,
      kind: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}kind'])!,
      agentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}agent_id'])!,
      transport: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}transport'])!,
      allowed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}allowed'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_id']),
      reason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reason']),
      detailsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}details_json'])!,
    );
  }

  @override
  $AgentAuditRecordsTable createAlias(String alias) {
    return $AgentAuditRecordsTable(attachedDatabase, alias);
  }
}

class AgentAuditRecord extends DataClass
    implements Insertable<AgentAuditRecord> {
  final int id;
  final String occurredAtIso8601;
  final String tool;
  final String kind;
  final String agentId;
  final String transport;
  final bool allowed;
  final String? sessionId;
  final String? reason;
  final String detailsJson;
  const AgentAuditRecord(
      {required this.id,
      required this.occurredAtIso8601,
      required this.tool,
      required this.kind,
      required this.agentId,
      required this.transport,
      required this.allowed,
      this.sessionId,
      this.reason,
      required this.detailsJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['occurred_at_iso8601'] = Variable<String>(occurredAtIso8601);
    map['tool'] = Variable<String>(tool);
    map['kind'] = Variable<String>(kind);
    map['agent_id'] = Variable<String>(agentId);
    map['transport'] = Variable<String>(transport);
    map['allowed'] = Variable<bool>(allowed);
    if (!nullToAbsent || sessionId != null) {
      map['session_id'] = Variable<String>(sessionId);
    }
    if (!nullToAbsent || reason != null) {
      map['reason'] = Variable<String>(reason);
    }
    map['details_json'] = Variable<String>(detailsJson);
    return map;
  }

  AgentAuditRecordsCompanion toCompanion(bool nullToAbsent) {
    return AgentAuditRecordsCompanion(
      id: Value(id),
      occurredAtIso8601: Value(occurredAtIso8601),
      tool: Value(tool),
      kind: Value(kind),
      agentId: Value(agentId),
      transport: Value(transport),
      allowed: Value(allowed),
      sessionId: sessionId == null && nullToAbsent
          ? const Value.absent()
          : Value(sessionId),
      reason:
          reason == null && nullToAbsent ? const Value.absent() : Value(reason),
      detailsJson: Value(detailsJson),
    );
  }

  factory AgentAuditRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AgentAuditRecord(
      id: serializer.fromJson<int>(json['id']),
      occurredAtIso8601: serializer.fromJson<String>(json['occurredAtIso8601']),
      tool: serializer.fromJson<String>(json['tool']),
      kind: serializer.fromJson<String>(json['kind']),
      agentId: serializer.fromJson<String>(json['agentId']),
      transport: serializer.fromJson<String>(json['transport']),
      allowed: serializer.fromJson<bool>(json['allowed']),
      sessionId: serializer.fromJson<String?>(json['sessionId']),
      reason: serializer.fromJson<String?>(json['reason']),
      detailsJson: serializer.fromJson<String>(json['detailsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'occurredAtIso8601': serializer.toJson<String>(occurredAtIso8601),
      'tool': serializer.toJson<String>(tool),
      'kind': serializer.toJson<String>(kind),
      'agentId': serializer.toJson<String>(agentId),
      'transport': serializer.toJson<String>(transport),
      'allowed': serializer.toJson<bool>(allowed),
      'sessionId': serializer.toJson<String?>(sessionId),
      'reason': serializer.toJson<String?>(reason),
      'detailsJson': serializer.toJson<String>(detailsJson),
    };
  }

  AgentAuditRecord copyWith(
          {int? id,
          String? occurredAtIso8601,
          String? tool,
          String? kind,
          String? agentId,
          String? transport,
          bool? allowed,
          Value<String?> sessionId = const Value.absent(),
          Value<String?> reason = const Value.absent(),
          String? detailsJson}) =>
      AgentAuditRecord(
        id: id ?? this.id,
        occurredAtIso8601: occurredAtIso8601 ?? this.occurredAtIso8601,
        tool: tool ?? this.tool,
        kind: kind ?? this.kind,
        agentId: agentId ?? this.agentId,
        transport: transport ?? this.transport,
        allowed: allowed ?? this.allowed,
        sessionId: sessionId.present ? sessionId.value : this.sessionId,
        reason: reason.present ? reason.value : this.reason,
        detailsJson: detailsJson ?? this.detailsJson,
      );
  AgentAuditRecord copyWithCompanion(AgentAuditRecordsCompanion data) {
    return AgentAuditRecord(
      id: data.id.present ? data.id.value : this.id,
      occurredAtIso8601: data.occurredAtIso8601.present
          ? data.occurredAtIso8601.value
          : this.occurredAtIso8601,
      tool: data.tool.present ? data.tool.value : this.tool,
      kind: data.kind.present ? data.kind.value : this.kind,
      agentId: data.agentId.present ? data.agentId.value : this.agentId,
      transport: data.transport.present ? data.transport.value : this.transport,
      allowed: data.allowed.present ? data.allowed.value : this.allowed,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      reason: data.reason.present ? data.reason.value : this.reason,
      detailsJson:
          data.detailsJson.present ? data.detailsJson.value : this.detailsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AgentAuditRecord(')
          ..write('id: $id, ')
          ..write('occurredAtIso8601: $occurredAtIso8601, ')
          ..write('tool: $tool, ')
          ..write('kind: $kind, ')
          ..write('agentId: $agentId, ')
          ..write('transport: $transport, ')
          ..write('allowed: $allowed, ')
          ..write('sessionId: $sessionId, ')
          ..write('reason: $reason, ')
          ..write('detailsJson: $detailsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, occurredAtIso8601, tool, kind, agentId,
      transport, allowed, sessionId, reason, detailsJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AgentAuditRecord &&
          other.id == this.id &&
          other.occurredAtIso8601 == this.occurredAtIso8601 &&
          other.tool == this.tool &&
          other.kind == this.kind &&
          other.agentId == this.agentId &&
          other.transport == this.transport &&
          other.allowed == this.allowed &&
          other.sessionId == this.sessionId &&
          other.reason == this.reason &&
          other.detailsJson == this.detailsJson);
}

class AgentAuditRecordsCompanion extends UpdateCompanion<AgentAuditRecord> {
  final Value<int> id;
  final Value<String> occurredAtIso8601;
  final Value<String> tool;
  final Value<String> kind;
  final Value<String> agentId;
  final Value<String> transport;
  final Value<bool> allowed;
  final Value<String?> sessionId;
  final Value<String?> reason;
  final Value<String> detailsJson;
  const AgentAuditRecordsCompanion({
    this.id = const Value.absent(),
    this.occurredAtIso8601 = const Value.absent(),
    this.tool = const Value.absent(),
    this.kind = const Value.absent(),
    this.agentId = const Value.absent(),
    this.transport = const Value.absent(),
    this.allowed = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.reason = const Value.absent(),
    this.detailsJson = const Value.absent(),
  });
  AgentAuditRecordsCompanion.insert({
    this.id = const Value.absent(),
    required String occurredAtIso8601,
    required String tool,
    required String kind,
    required String agentId,
    required String transport,
    required bool allowed,
    this.sessionId = const Value.absent(),
    this.reason = const Value.absent(),
    required String detailsJson,
  })  : occurredAtIso8601 = Value(occurredAtIso8601),
        tool = Value(tool),
        kind = Value(kind),
        agentId = Value(agentId),
        transport = Value(transport),
        allowed = Value(allowed),
        detailsJson = Value(detailsJson);
  static Insertable<AgentAuditRecord> custom({
    Expression<int>? id,
    Expression<String>? occurredAtIso8601,
    Expression<String>? tool,
    Expression<String>? kind,
    Expression<String>? agentId,
    Expression<String>? transport,
    Expression<bool>? allowed,
    Expression<String>? sessionId,
    Expression<String>? reason,
    Expression<String>? detailsJson,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (occurredAtIso8601 != null) 'occurred_at_iso8601': occurredAtIso8601,
      if (tool != null) 'tool': tool,
      if (kind != null) 'kind': kind,
      if (agentId != null) 'agent_id': agentId,
      if (transport != null) 'transport': transport,
      if (allowed != null) 'allowed': allowed,
      if (sessionId != null) 'session_id': sessionId,
      if (reason != null) 'reason': reason,
      if (detailsJson != null) 'details_json': detailsJson,
    });
  }

  AgentAuditRecordsCompanion copyWith(
      {Value<int>? id,
      Value<String>? occurredAtIso8601,
      Value<String>? tool,
      Value<String>? kind,
      Value<String>? agentId,
      Value<String>? transport,
      Value<bool>? allowed,
      Value<String?>? sessionId,
      Value<String?>? reason,
      Value<String>? detailsJson}) {
    return AgentAuditRecordsCompanion(
      id: id ?? this.id,
      occurredAtIso8601: occurredAtIso8601 ?? this.occurredAtIso8601,
      tool: tool ?? this.tool,
      kind: kind ?? this.kind,
      agentId: agentId ?? this.agentId,
      transport: transport ?? this.transport,
      allowed: allowed ?? this.allowed,
      sessionId: sessionId ?? this.sessionId,
      reason: reason ?? this.reason,
      detailsJson: detailsJson ?? this.detailsJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (occurredAtIso8601.present) {
      map['occurred_at_iso8601'] = Variable<String>(occurredAtIso8601.value);
    }
    if (tool.present) {
      map['tool'] = Variable<String>(tool.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (agentId.present) {
      map['agent_id'] = Variable<String>(agentId.value);
    }
    if (transport.present) {
      map['transport'] = Variable<String>(transport.value);
    }
    if (allowed.present) {
      map['allowed'] = Variable<bool>(allowed.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (detailsJson.present) {
      map['details_json'] = Variable<String>(detailsJson.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AgentAuditRecordsCompanion(')
          ..write('id: $id, ')
          ..write('occurredAtIso8601: $occurredAtIso8601, ')
          ..write('tool: $tool, ')
          ..write('kind: $kind, ')
          ..write('agentId: $agentId, ')
          ..write('transport: $transport, ')
          ..write('allowed: $allowed, ')
          ..write('sessionId: $sessionId, ')
          ..write('reason: $reason, ')
          ..write('detailsJson: $detailsJson')
          ..write(')'))
        .toString();
  }
}

abstract class _$RecipeDatabase extends GeneratedDatabase {
  _$RecipeDatabase(QueryExecutor e) : super(e);
  $RecipeDatabaseManager get managers => $RecipeDatabaseManager(this);
  late final $SavedRecipesTable savedRecipes = $SavedRecipesTable(this);
  late final $AgentAccessSettingsTable agentAccessSettings =
      $AgentAccessSettingsTable(this);
  late final $AgentSessionsTable agentSessions = $AgentSessionsTable(this);
  late final $AgentAuditRecordsTable agentAuditRecords =
      $AgentAuditRecordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [savedRecipes, agentAccessSettings, agentSessions, agentAuditRecords];
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
typedef $$AgentAccessSettingsTableCreateCompanionBuilder
    = AgentAccessSettingsCompanion Function({
  required String settingsId,
  Value<bool> agentAccessEnabled,
  Value<bool> requireVisibleSession,
  Value<bool> allowDiscoveryWithoutConsent,
  Value<String> approvalMode,
  Value<int> auditRetentionDays,
  Value<String?> activeSessionId,
  Value<String?> activeAgentId,
  Value<String?> activeTransport,
  Value<String?> activePurpose,
  Value<String?> activeStartedAtIso8601,
  required String updatedAtIso8601,
  Value<int> rowid,
});
typedef $$AgentAccessSettingsTableUpdateCompanionBuilder
    = AgentAccessSettingsCompanion Function({
  Value<String> settingsId,
  Value<bool> agentAccessEnabled,
  Value<bool> requireVisibleSession,
  Value<bool> allowDiscoveryWithoutConsent,
  Value<String> approvalMode,
  Value<int> auditRetentionDays,
  Value<String?> activeSessionId,
  Value<String?> activeAgentId,
  Value<String?> activeTransport,
  Value<String?> activePurpose,
  Value<String?> activeStartedAtIso8601,
  Value<String> updatedAtIso8601,
  Value<int> rowid,
});

class $$AgentAccessSettingsTableFilterComposer
    extends Composer<_$RecipeDatabase, $AgentAccessSettingsTable> {
  $$AgentAccessSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get settingsId => $composableBuilder(
      column: $table.settingsId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get agentAccessEnabled => $composableBuilder(
      column: $table.agentAccessEnabled,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get requireVisibleSession => $composableBuilder(
      column: $table.requireVisibleSession,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get allowDiscoveryWithoutConsent => $composableBuilder(
      column: $table.allowDiscoveryWithoutConsent,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get approvalMode => $composableBuilder(
      column: $table.approvalMode, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get auditRetentionDays => $composableBuilder(
      column: $table.auditRetentionDays,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get activeSessionId => $composableBuilder(
      column: $table.activeSessionId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get activeAgentId => $composableBuilder(
      column: $table.activeAgentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get activeTransport => $composableBuilder(
      column: $table.activeTransport,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get activePurpose => $composableBuilder(
      column: $table.activePurpose, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get activeStartedAtIso8601 => $composableBuilder(
      column: $table.activeStartedAtIso8601,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get updatedAtIso8601 => $composableBuilder(
      column: $table.updatedAtIso8601,
      builder: (column) => ColumnFilters(column));
}

class $$AgentAccessSettingsTableOrderingComposer
    extends Composer<_$RecipeDatabase, $AgentAccessSettingsTable> {
  $$AgentAccessSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get settingsId => $composableBuilder(
      column: $table.settingsId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get agentAccessEnabled => $composableBuilder(
      column: $table.agentAccessEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get requireVisibleSession => $composableBuilder(
      column: $table.requireVisibleSession,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get allowDiscoveryWithoutConsent => $composableBuilder(
      column: $table.allowDiscoveryWithoutConsent,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get approvalMode => $composableBuilder(
      column: $table.approvalMode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get auditRetentionDays => $composableBuilder(
      column: $table.auditRetentionDays,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get activeSessionId => $composableBuilder(
      column: $table.activeSessionId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get activeAgentId => $composableBuilder(
      column: $table.activeAgentId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get activeTransport => $composableBuilder(
      column: $table.activeTransport,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get activePurpose => $composableBuilder(
      column: $table.activePurpose,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get activeStartedAtIso8601 => $composableBuilder(
      column: $table.activeStartedAtIso8601,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get updatedAtIso8601 => $composableBuilder(
      column: $table.updatedAtIso8601,
      builder: (column) => ColumnOrderings(column));
}

class $$AgentAccessSettingsTableAnnotationComposer
    extends Composer<_$RecipeDatabase, $AgentAccessSettingsTable> {
  $$AgentAccessSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get settingsId => $composableBuilder(
      column: $table.settingsId, builder: (column) => column);

  GeneratedColumn<bool> get agentAccessEnabled => $composableBuilder(
      column: $table.agentAccessEnabled, builder: (column) => column);

  GeneratedColumn<bool> get requireVisibleSession => $composableBuilder(
      column: $table.requireVisibleSession, builder: (column) => column);

  GeneratedColumn<bool> get allowDiscoveryWithoutConsent => $composableBuilder(
      column: $table.allowDiscoveryWithoutConsent, builder: (column) => column);

  GeneratedColumn<String> get approvalMode => $composableBuilder(
      column: $table.approvalMode, builder: (column) => column);

  GeneratedColumn<int> get auditRetentionDays => $composableBuilder(
      column: $table.auditRetentionDays, builder: (column) => column);

  GeneratedColumn<String> get activeSessionId => $composableBuilder(
      column: $table.activeSessionId, builder: (column) => column);

  GeneratedColumn<String> get activeAgentId => $composableBuilder(
      column: $table.activeAgentId, builder: (column) => column);

  GeneratedColumn<String> get activeTransport => $composableBuilder(
      column: $table.activeTransport, builder: (column) => column);

  GeneratedColumn<String> get activePurpose => $composableBuilder(
      column: $table.activePurpose, builder: (column) => column);

  GeneratedColumn<String> get activeStartedAtIso8601 => $composableBuilder(
      column: $table.activeStartedAtIso8601, builder: (column) => column);

  GeneratedColumn<String> get updatedAtIso8601 => $composableBuilder(
      column: $table.updatedAtIso8601, builder: (column) => column);
}

class $$AgentAccessSettingsTableTableManager extends RootTableManager<
    _$RecipeDatabase,
    $AgentAccessSettingsTable,
    AgentAccessSetting,
    $$AgentAccessSettingsTableFilterComposer,
    $$AgentAccessSettingsTableOrderingComposer,
    $$AgentAccessSettingsTableAnnotationComposer,
    $$AgentAccessSettingsTableCreateCompanionBuilder,
    $$AgentAccessSettingsTableUpdateCompanionBuilder,
    (
      AgentAccessSetting,
      BaseReferences<_$RecipeDatabase, $AgentAccessSettingsTable,
          AgentAccessSetting>
    ),
    AgentAccessSetting,
    PrefetchHooks Function()> {
  $$AgentAccessSettingsTableTableManager(
      _$RecipeDatabase db, $AgentAccessSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AgentAccessSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AgentAccessSettingsTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AgentAccessSettingsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> settingsId = const Value.absent(),
            Value<bool> agentAccessEnabled = const Value.absent(),
            Value<bool> requireVisibleSession = const Value.absent(),
            Value<bool> allowDiscoveryWithoutConsent = const Value.absent(),
            Value<String> approvalMode = const Value.absent(),
            Value<int> auditRetentionDays = const Value.absent(),
            Value<String?> activeSessionId = const Value.absent(),
            Value<String?> activeAgentId = const Value.absent(),
            Value<String?> activeTransport = const Value.absent(),
            Value<String?> activePurpose = const Value.absent(),
            Value<String?> activeStartedAtIso8601 = const Value.absent(),
            Value<String> updatedAtIso8601 = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AgentAccessSettingsCompanion(
            settingsId: settingsId,
            agentAccessEnabled: agentAccessEnabled,
            requireVisibleSession: requireVisibleSession,
            allowDiscoveryWithoutConsent: allowDiscoveryWithoutConsent,
            approvalMode: approvalMode,
            auditRetentionDays: auditRetentionDays,
            activeSessionId: activeSessionId,
            activeAgentId: activeAgentId,
            activeTransport: activeTransport,
            activePurpose: activePurpose,
            activeStartedAtIso8601: activeStartedAtIso8601,
            updatedAtIso8601: updatedAtIso8601,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String settingsId,
            Value<bool> agentAccessEnabled = const Value.absent(),
            Value<bool> requireVisibleSession = const Value.absent(),
            Value<bool> allowDiscoveryWithoutConsent = const Value.absent(),
            Value<String> approvalMode = const Value.absent(),
            Value<int> auditRetentionDays = const Value.absent(),
            Value<String?> activeSessionId = const Value.absent(),
            Value<String?> activeAgentId = const Value.absent(),
            Value<String?> activeTransport = const Value.absent(),
            Value<String?> activePurpose = const Value.absent(),
            Value<String?> activeStartedAtIso8601 = const Value.absent(),
            required String updatedAtIso8601,
            Value<int> rowid = const Value.absent(),
          }) =>
              AgentAccessSettingsCompanion.insert(
            settingsId: settingsId,
            agentAccessEnabled: agentAccessEnabled,
            requireVisibleSession: requireVisibleSession,
            allowDiscoveryWithoutConsent: allowDiscoveryWithoutConsent,
            approvalMode: approvalMode,
            auditRetentionDays: auditRetentionDays,
            activeSessionId: activeSessionId,
            activeAgentId: activeAgentId,
            activeTransport: activeTransport,
            activePurpose: activePurpose,
            activeStartedAtIso8601: activeStartedAtIso8601,
            updatedAtIso8601: updatedAtIso8601,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AgentAccessSettingsTableProcessedTableManager = ProcessedTableManager<
    _$RecipeDatabase,
    $AgentAccessSettingsTable,
    AgentAccessSetting,
    $$AgentAccessSettingsTableFilterComposer,
    $$AgentAccessSettingsTableOrderingComposer,
    $$AgentAccessSettingsTableAnnotationComposer,
    $$AgentAccessSettingsTableCreateCompanionBuilder,
    $$AgentAccessSettingsTableUpdateCompanionBuilder,
    (
      AgentAccessSetting,
      BaseReferences<_$RecipeDatabase, $AgentAccessSettingsTable,
          AgentAccessSetting>
    ),
    AgentAccessSetting,
    PrefetchHooks Function()>;
typedef $$AgentSessionsTableCreateCompanionBuilder = AgentSessionsCompanion
    Function({
  required String sessionId,
  required String agentId,
  required String transport,
  Value<String?> purpose,
  required bool consentGranted,
  required bool visible,
  required String startedAtIso8601,
  Value<String?> endedAtIso8601,
  Value<int> rowid,
});
typedef $$AgentSessionsTableUpdateCompanionBuilder = AgentSessionsCompanion
    Function({
  Value<String> sessionId,
  Value<String> agentId,
  Value<String> transport,
  Value<String?> purpose,
  Value<bool> consentGranted,
  Value<bool> visible,
  Value<String> startedAtIso8601,
  Value<String?> endedAtIso8601,
  Value<int> rowid,
});

class $$AgentSessionsTableFilterComposer
    extends Composer<_$RecipeDatabase, $AgentSessionsTable> {
  $$AgentSessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get agentId => $composableBuilder(
      column: $table.agentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transport => $composableBuilder(
      column: $table.transport, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get purpose => $composableBuilder(
      column: $table.purpose, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get consentGranted => $composableBuilder(
      column: $table.consentGranted,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get visible => $composableBuilder(
      column: $table.visible, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get startedAtIso8601 => $composableBuilder(
      column: $table.startedAtIso8601,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get endedAtIso8601 => $composableBuilder(
      column: $table.endedAtIso8601,
      builder: (column) => ColumnFilters(column));
}

class $$AgentSessionsTableOrderingComposer
    extends Composer<_$RecipeDatabase, $AgentSessionsTable> {
  $$AgentSessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get agentId => $composableBuilder(
      column: $table.agentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transport => $composableBuilder(
      column: $table.transport, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get purpose => $composableBuilder(
      column: $table.purpose, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get consentGranted => $composableBuilder(
      column: $table.consentGranted,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get visible => $composableBuilder(
      column: $table.visible, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get startedAtIso8601 => $composableBuilder(
      column: $table.startedAtIso8601,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get endedAtIso8601 => $composableBuilder(
      column: $table.endedAtIso8601,
      builder: (column) => ColumnOrderings(column));
}

class $$AgentSessionsTableAnnotationComposer
    extends Composer<_$RecipeDatabase, $AgentSessionsTable> {
  $$AgentSessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get agentId =>
      $composableBuilder(column: $table.agentId, builder: (column) => column);

  GeneratedColumn<String> get transport =>
      $composableBuilder(column: $table.transport, builder: (column) => column);

  GeneratedColumn<String> get purpose =>
      $composableBuilder(column: $table.purpose, builder: (column) => column);

  GeneratedColumn<bool> get consentGranted => $composableBuilder(
      column: $table.consentGranted, builder: (column) => column);

  GeneratedColumn<bool> get visible =>
      $composableBuilder(column: $table.visible, builder: (column) => column);

  GeneratedColumn<String> get startedAtIso8601 => $composableBuilder(
      column: $table.startedAtIso8601, builder: (column) => column);

  GeneratedColumn<String> get endedAtIso8601 => $composableBuilder(
      column: $table.endedAtIso8601, builder: (column) => column);
}

class $$AgentSessionsTableTableManager extends RootTableManager<
    _$RecipeDatabase,
    $AgentSessionsTable,
    AgentSession,
    $$AgentSessionsTableFilterComposer,
    $$AgentSessionsTableOrderingComposer,
    $$AgentSessionsTableAnnotationComposer,
    $$AgentSessionsTableCreateCompanionBuilder,
    $$AgentSessionsTableUpdateCompanionBuilder,
    (
      AgentSession,
      BaseReferences<_$RecipeDatabase, $AgentSessionsTable, AgentSession>
    ),
    AgentSession,
    PrefetchHooks Function()> {
  $$AgentSessionsTableTableManager(
      _$RecipeDatabase db, $AgentSessionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AgentSessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AgentSessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AgentSessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> sessionId = const Value.absent(),
            Value<String> agentId = const Value.absent(),
            Value<String> transport = const Value.absent(),
            Value<String?> purpose = const Value.absent(),
            Value<bool> consentGranted = const Value.absent(),
            Value<bool> visible = const Value.absent(),
            Value<String> startedAtIso8601 = const Value.absent(),
            Value<String?> endedAtIso8601 = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AgentSessionsCompanion(
            sessionId: sessionId,
            agentId: agentId,
            transport: transport,
            purpose: purpose,
            consentGranted: consentGranted,
            visible: visible,
            startedAtIso8601: startedAtIso8601,
            endedAtIso8601: endedAtIso8601,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String sessionId,
            required String agentId,
            required String transport,
            Value<String?> purpose = const Value.absent(),
            required bool consentGranted,
            required bool visible,
            required String startedAtIso8601,
            Value<String?> endedAtIso8601 = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AgentSessionsCompanion.insert(
            sessionId: sessionId,
            agentId: agentId,
            transport: transport,
            purpose: purpose,
            consentGranted: consentGranted,
            visible: visible,
            startedAtIso8601: startedAtIso8601,
            endedAtIso8601: endedAtIso8601,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AgentSessionsTableProcessedTableManager = ProcessedTableManager<
    _$RecipeDatabase,
    $AgentSessionsTable,
    AgentSession,
    $$AgentSessionsTableFilterComposer,
    $$AgentSessionsTableOrderingComposer,
    $$AgentSessionsTableAnnotationComposer,
    $$AgentSessionsTableCreateCompanionBuilder,
    $$AgentSessionsTableUpdateCompanionBuilder,
    (
      AgentSession,
      BaseReferences<_$RecipeDatabase, $AgentSessionsTable, AgentSession>
    ),
    AgentSession,
    PrefetchHooks Function()>;
typedef $$AgentAuditRecordsTableCreateCompanionBuilder
    = AgentAuditRecordsCompanion Function({
  Value<int> id,
  required String occurredAtIso8601,
  required String tool,
  required String kind,
  required String agentId,
  required String transport,
  required bool allowed,
  Value<String?> sessionId,
  Value<String?> reason,
  required String detailsJson,
});
typedef $$AgentAuditRecordsTableUpdateCompanionBuilder
    = AgentAuditRecordsCompanion Function({
  Value<int> id,
  Value<String> occurredAtIso8601,
  Value<String> tool,
  Value<String> kind,
  Value<String> agentId,
  Value<String> transport,
  Value<bool> allowed,
  Value<String?> sessionId,
  Value<String?> reason,
  Value<String> detailsJson,
});

class $$AgentAuditRecordsTableFilterComposer
    extends Composer<_$RecipeDatabase, $AgentAuditRecordsTable> {
  $$AgentAuditRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get occurredAtIso8601 => $composableBuilder(
      column: $table.occurredAtIso8601,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tool => $composableBuilder(
      column: $table.tool, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get kind => $composableBuilder(
      column: $table.kind, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get agentId => $composableBuilder(
      column: $table.agentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get transport => $composableBuilder(
      column: $table.transport, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get allowed => $composableBuilder(
      column: $table.allowed, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get detailsJson => $composableBuilder(
      column: $table.detailsJson, builder: (column) => ColumnFilters(column));
}

class $$AgentAuditRecordsTableOrderingComposer
    extends Composer<_$RecipeDatabase, $AgentAuditRecordsTable> {
  $$AgentAuditRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get occurredAtIso8601 => $composableBuilder(
      column: $table.occurredAtIso8601,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tool => $composableBuilder(
      column: $table.tool, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get kind => $composableBuilder(
      column: $table.kind, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get agentId => $composableBuilder(
      column: $table.agentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get transport => $composableBuilder(
      column: $table.transport, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get allowed => $composableBuilder(
      column: $table.allowed, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reason => $composableBuilder(
      column: $table.reason, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get detailsJson => $composableBuilder(
      column: $table.detailsJson, builder: (column) => ColumnOrderings(column));
}

class $$AgentAuditRecordsTableAnnotationComposer
    extends Composer<_$RecipeDatabase, $AgentAuditRecordsTable> {
  $$AgentAuditRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get occurredAtIso8601 => $composableBuilder(
      column: $table.occurredAtIso8601, builder: (column) => column);

  GeneratedColumn<String> get tool =>
      $composableBuilder(column: $table.tool, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get agentId =>
      $composableBuilder(column: $table.agentId, builder: (column) => column);

  GeneratedColumn<String> get transport =>
      $composableBuilder(column: $table.transport, builder: (column) => column);

  GeneratedColumn<bool> get allowed =>
      $composableBuilder(column: $table.allowed, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<String> get detailsJson => $composableBuilder(
      column: $table.detailsJson, builder: (column) => column);
}

class $$AgentAuditRecordsTableTableManager extends RootTableManager<
    _$RecipeDatabase,
    $AgentAuditRecordsTable,
    AgentAuditRecord,
    $$AgentAuditRecordsTableFilterComposer,
    $$AgentAuditRecordsTableOrderingComposer,
    $$AgentAuditRecordsTableAnnotationComposer,
    $$AgentAuditRecordsTableCreateCompanionBuilder,
    $$AgentAuditRecordsTableUpdateCompanionBuilder,
    (
      AgentAuditRecord,
      BaseReferences<_$RecipeDatabase, $AgentAuditRecordsTable,
          AgentAuditRecord>
    ),
    AgentAuditRecord,
    PrefetchHooks Function()> {
  $$AgentAuditRecordsTableTableManager(
      _$RecipeDatabase db, $AgentAuditRecordsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AgentAuditRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AgentAuditRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AgentAuditRecordsTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> occurredAtIso8601 = const Value.absent(),
            Value<String> tool = const Value.absent(),
            Value<String> kind = const Value.absent(),
            Value<String> agentId = const Value.absent(),
            Value<String> transport = const Value.absent(),
            Value<bool> allowed = const Value.absent(),
            Value<String?> sessionId = const Value.absent(),
            Value<String?> reason = const Value.absent(),
            Value<String> detailsJson = const Value.absent(),
          }) =>
              AgentAuditRecordsCompanion(
            id: id,
            occurredAtIso8601: occurredAtIso8601,
            tool: tool,
            kind: kind,
            agentId: agentId,
            transport: transport,
            allowed: allowed,
            sessionId: sessionId,
            reason: reason,
            detailsJson: detailsJson,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String occurredAtIso8601,
            required String tool,
            required String kind,
            required String agentId,
            required String transport,
            required bool allowed,
            Value<String?> sessionId = const Value.absent(),
            Value<String?> reason = const Value.absent(),
            required String detailsJson,
          }) =>
              AgentAuditRecordsCompanion.insert(
            id: id,
            occurredAtIso8601: occurredAtIso8601,
            tool: tool,
            kind: kind,
            agentId: agentId,
            transport: transport,
            allowed: allowed,
            sessionId: sessionId,
            reason: reason,
            detailsJson: detailsJson,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AgentAuditRecordsTableProcessedTableManager = ProcessedTableManager<
    _$RecipeDatabase,
    $AgentAuditRecordsTable,
    AgentAuditRecord,
    $$AgentAuditRecordsTableFilterComposer,
    $$AgentAuditRecordsTableOrderingComposer,
    $$AgentAuditRecordsTableAnnotationComposer,
    $$AgentAuditRecordsTableCreateCompanionBuilder,
    $$AgentAuditRecordsTableUpdateCompanionBuilder,
    (
      AgentAuditRecord,
      BaseReferences<_$RecipeDatabase, $AgentAuditRecordsTable,
          AgentAuditRecord>
    ),
    AgentAuditRecord,
    PrefetchHooks Function()>;

class $RecipeDatabaseManager {
  final _$RecipeDatabase _db;
  $RecipeDatabaseManager(this._db);
  $$SavedRecipesTableTableManager get savedRecipes =>
      $$SavedRecipesTableTableManager(_db, _db.savedRecipes);
  $$AgentAccessSettingsTableTableManager get agentAccessSettings =>
      $$AgentAccessSettingsTableTableManager(_db, _db.agentAccessSettings);
  $$AgentSessionsTableTableManager get agentSessions =>
      $$AgentSessionsTableTableManager(_db, _db.agentSessions);
  $$AgentAuditRecordsTableTableManager get agentAuditRecords =>
      $$AgentAuditRecordsTableTableManager(_db, _db.agentAuditRecords);
}
