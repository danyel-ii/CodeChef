import 'dart:convert';

import 'package:agent_bridge/agent_bridge.dart';
import 'package:drift/drift.dart';
import 'package:persistence_drift/src/query_executor_factory.dart';
import 'package:recipe_domain/recipe_domain.dart';

part 'drift_database.g.dart';

class SavedRecipes extends Table {
  TextColumn get recipeId => text()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get updatedAtIso8601 => text()();
  TextColumn get tagsJson => text()();
  TextColumn get documentJson => text()();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{recipeId};
}

class AgentAccessSettings extends Table {
  TextColumn get settingsId => text()();
  BoolColumn get agentAccessEnabled =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get requireVisibleSession =>
      boolean().withDefault(const Constant(true))();
  BoolColumn get allowDiscoveryWithoutConsent =>
      boolean().withDefault(const Constant(true))();
  TextColumn get approvalMode =>
      text().withDefault(const Constant('perRequest'))();
  IntColumn get auditRetentionDays =>
      integer().withDefault(const Constant(14))();
  TextColumn get activeSessionId => text().nullable()();
  TextColumn get activeAgentId => text().nullable()();
  TextColumn get activeTransport => text().nullable()();
  TextColumn get activePurpose => text().nullable()();
  TextColumn get activeStartedAtIso8601 => text().nullable()();
  TextColumn get updatedAtIso8601 => text()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{settingsId};
}

class AgentSessions extends Table {
  TextColumn get sessionId => text()();
  TextColumn get agentId => text()();
  TextColumn get transport => text()();
  TextColumn get purpose => text().nullable()();
  BoolColumn get consentGranted => boolean()();
  BoolColumn get visible => boolean()();
  TextColumn get startedAtIso8601 => text()();
  TextColumn get endedAtIso8601 => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{sessionId};
}

class AgentAuditRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get occurredAtIso8601 => text()();
  TextColumn get tool => text()();
  TextColumn get kind => text()();
  TextColumn get agentId => text()();
  TextColumn get transport => text()();
  BoolColumn get allowed => boolean()();
  TextColumn get sessionId => text().nullable()();
  TextColumn get reason => text().nullable()();
  TextColumn get detailsJson => text()();
}

@DriftDatabase(
  tables: <Type>[
    SavedRecipes,
    AgentAccessSettings,
    AgentSessions,
    AgentAuditRecords,
  ],
)
class RecipeDatabase extends _$RecipeDatabase {
  RecipeDatabase(super.executor);

  factory RecipeDatabase.open({String? sqliteFilePath}) {
    return RecipeDatabase(createRecipeQueryExecutor(sqliteFilePath: sqliteFilePath));
  }

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator migrator) async {
          await migrator.createAll();
        },
        onUpgrade: (Migrator migrator, int from, int to) async {
          if (from < 2) {
            await migrator.addColumn(savedRecipes, savedRecipes.isFavorite);
          }
          if (from < 3) {
            await migrator.createTable(agentAccessSettings);
            await migrator.createTable(agentSessions);
            await migrator.createTable(agentAuditRecords);
          }
          if (from < 4) {
            await migrator.addColumn(
              agentAccessSettings,
              agentAccessSettings.auditRetentionDays,
            );
          }
        },
      );

  Future<void> saveRecipe(RecipeDocument recipe) {
    return into(savedRecipes).insertOnConflictUpdate(
      SavedRecipesCompanion(
        recipeId: Value(recipe.recipeId),
        title: Value(recipe.title),
        description: Value(recipe.description),
        updatedAtIso8601: Value(recipe.updatedAt.toUtc().toIso8601String()),
        tagsJson: Value(jsonEncode(recipe.tags)),
        documentJson: Value(jsonEncode(recipe.toJson())),
      ),
    );
  }

  Future<List<SavedRecipeRecord>> listRecipes() async {
    final rows = await (select(savedRecipes)
          ..orderBy(<OrderClauseGenerator<$SavedRecipesTable>>[
            (SavedRecipes tbl) => OrderingTerm.desc(tbl.updatedAtIso8601),
          ]))
        .get();
    return rows
        .map(
          (SavedRecipe row) => SavedRecipeRecord(
            recipeId: row.recipeId,
            title: row.title,
            description: row.description,
            updatedAt: DateTime.parse(row.updatedAtIso8601),
            tags: (jsonDecode(row.tagsJson) as List<Object?>)
                .map((Object? tag) => tag! as String)
                .toList(growable: false),
            isFavorite: row.isFavorite,
          ),
        )
        .toList(growable: false);
  }

  Future<RecipeDocument?> loadRecipe(String recipeId) async {
    final row = await (select(savedRecipes)
          ..where(($SavedRecipesTable tbl) => tbl.recipeId.equals(recipeId)))
        .getSingleOrNull();
    if (row == null) {
      return null;
    }
    final dynamic decoded = jsonDecode(row.documentJson);
    return RecipeDocument.fromJson(
      (decoded as Map<Object?, Object?>).map<String, dynamic>(
        (Object? key, Object? value) => MapEntry(key! as String, value),
      ),
    );
  }

  Future<void> setFavorite(String recipeId, bool isFavorite) async {
    await (update(savedRecipes)
          ..where(($SavedRecipesTable tbl) => tbl.recipeId.equals(recipeId)))
        .write(
      SavedRecipesCompanion(
        isFavorite: Value(isFavorite),
      ),
    );
  }

  Future<int> deleteRecipe(String recipeId) {
    return (delete(savedRecipes)
          ..where(($SavedRecipesTable tbl) => tbl.recipeId.equals(recipeId)))
        .go();
  }

  Future<AgentAccessSettingsRecord> loadAgentAccessSettings() async {
    final row = await (select(agentAccessSettings)
          ..where(
            ($AgentAccessSettingsTable tbl) => tbl.settingsId.equals(_settingsRowId),
          ))
        .getSingleOrNull();
    if (row != null) {
      return _mapSettingsRow(row);
    }
    final AgentAccessSettingsRecord defaultRecord = AgentAccessSettingsRecord.defaults();
    await into(agentAccessSettings).insert(
      AgentAccessSettingsCompanion.insert(
        settingsId: defaultRecord.settingsId,
        updatedAtIso8601: defaultRecord.updatedAt.toUtc().toIso8601String(),
        agentAccessEnabled: Value(defaultRecord.agentAccessEnabled),
        requireVisibleSession: Value(defaultRecord.requireVisibleSession),
        allowDiscoveryWithoutConsent:
            Value(defaultRecord.allowDiscoveryWithoutConsent),
        approvalMode: Value(defaultRecord.approvalMode.name),
        auditRetentionDays: Value(defaultRecord.auditRetentionDays),
        activeSessionId: Value(defaultRecord.activeSessionId),
        activeAgentId: Value(defaultRecord.activeAgentId),
        activeTransport: Value(defaultRecord.activeTransport?.name),
        activePurpose: Value(defaultRecord.activePurpose),
        activeStartedAtIso8601:
            Value(defaultRecord.activeStartedAt?.toUtc().toIso8601String()),
      ),
    );
    return defaultRecord;
  }

  Future<void> saveAgentAccessSettings(AgentAccessSettingsRecord settings) {
    return into(agentAccessSettings).insertOnConflictUpdate(
      AgentAccessSettingsCompanion(
        settingsId: Value(settings.settingsId),
        agentAccessEnabled: Value(settings.agentAccessEnabled),
        requireVisibleSession: Value(settings.requireVisibleSession),
        allowDiscoveryWithoutConsent:
            Value(settings.allowDiscoveryWithoutConsent),
        approvalMode: Value(settings.approvalMode.name),
        auditRetentionDays: Value(settings.auditRetentionDays),
        activeSessionId: Value(settings.activeSessionId),
        activeAgentId: Value(settings.activeAgentId),
        activeTransport: Value(settings.activeTransport?.name),
        activePurpose: Value(settings.activePurpose),
        activeStartedAtIso8601:
            Value(settings.activeStartedAt?.toUtc().toIso8601String()),
        updatedAtIso8601: Value(settings.updatedAt.toUtc().toIso8601String()),
      ),
    );
  }

  Future<void> saveAgentSession(AgentSessionRecord session) {
    return into(agentSessions).insertOnConflictUpdate(
      AgentSessionsCompanion(
        sessionId: Value(session.sessionId),
        agentId: Value(session.agentId),
        transport: Value(session.transport.name),
        purpose: Value(session.purpose),
        consentGranted: Value(session.consentGranted),
        visible: Value(session.visible),
        startedAtIso8601: Value(session.startedAt.toUtc().toIso8601String()),
        endedAtIso8601: Value(session.endedAt?.toUtc().toIso8601String()),
      ),
    );
  }

  Future<List<AgentSessionRecord>> listAgentSessions({int limit = 20}) async {
    final rows = await (select(agentSessions)
          ..orderBy(<OrderClauseGenerator<$AgentSessionsTable>>[
            (AgentSessions tbl) => OrderingTerm.desc(tbl.startedAtIso8601),
          ])
          ..limit(limit))
        .get();
    return rows.map(_mapSessionRow).toList(growable: false);
  }

  Future<void> recordAgentAuditEntry(AgentAuditEntry entry) {
    return into(agentAuditRecords).insert(
      AgentAuditRecordsCompanion.insert(
        occurredAtIso8601: entry.occurredAt.toUtc().toIso8601String(),
        tool: entry.tool.name,
        kind: entry.kind.name,
        agentId: entry.agentId,
        transport: entry.transport.name,
        allowed: entry.allowed,
        sessionId: Value(entry.sessionId),
        reason: Value(entry.reason),
        detailsJson: jsonEncode(entry.details),
      ),
    );
  }

  Future<List<AgentAuditEntry>> listAgentAuditEntries({int limit = 50}) async {
    final rows = await (select(agentAuditRecords)
          ..orderBy(<OrderClauseGenerator<$AgentAuditRecordsTable>>[
            (AgentAuditRecords tbl) => OrderingTerm.desc(tbl.occurredAtIso8601),
          ])
          ..limit(limit))
        .get();
    return rows.map(_mapAuditRow).toList(growable: false);
  }

  Future<void> clearAgentAuditEntries() async {
    await delete(agentAuditRecords).go();
  }

  Future<int> pruneAgentAuditEntriesOlderThan(DateTime cutoffUtc) {
    return (delete(agentAuditRecords)
          ..where(
            ($AgentAuditRecordsTable tbl) =>
                tbl.occurredAtIso8601.isSmallerThanValue(
                  cutoffUtc.toUtc().toIso8601String(),
                ),
          ))
        .go();
  }

  Future<int> trimAgentAuditEntriesToLimit(int keepLatest) async {
    if (keepLatest < 0) {
      return 0;
    }
    final rows = await (select(agentAuditRecords)
          ..orderBy(<OrderClauseGenerator<$AgentAuditRecordsTable>>[
            (AgentAuditRecords tbl) => OrderingTerm.desc(tbl.occurredAtIso8601),
          ]))
        .get();
    if (rows.length <= keepLatest) {
      return 0;
    }
    final idsToDelete = rows
        .skip(keepLatest)
        .map((AgentAuditRecord row) => row.id)
        .toList(growable: false);
    return (delete(agentAuditRecords)
          ..where(($AgentAuditRecordsTable tbl) => tbl.id.isIn(idsToDelete)))
        .go();
  }

  AgentAccessSettingsRecord _mapSettingsRow(AgentAccessSetting row) {
    return AgentAccessSettingsRecord(
      settingsId: row.settingsId,
      agentAccessEnabled: row.agentAccessEnabled,
      requireVisibleSession: row.requireVisibleSession,
      allowDiscoveryWithoutConsent: row.allowDiscoveryWithoutConsent,
      approvalMode: AgentApprovalMode.values.byName(row.approvalMode),
      auditRetentionDays: row.auditRetentionDays,
      activeSessionId: row.activeSessionId,
      activeAgentId: row.activeAgentId,
      activeTransport: row.activeTransport == null
          ? null
          : AgentTransport.values.byName(row.activeTransport!),
      activePurpose: row.activePurpose,
      activeStartedAt: row.activeStartedAtIso8601 == null
          ? null
          : DateTime.parse(row.activeStartedAtIso8601!),
      updatedAt: DateTime.parse(row.updatedAtIso8601),
    );
  }

  AgentSessionRecord _mapSessionRow(AgentSession row) {
    return AgentSessionRecord(
      sessionId: row.sessionId,
      agentId: row.agentId,
      transport: AgentTransport.values.byName(row.transport),
      purpose: row.purpose,
      consentGranted: row.consentGranted,
      visible: row.visible,
      startedAt: DateTime.parse(row.startedAtIso8601),
      endedAt: row.endedAtIso8601 == null
          ? null
          : DateTime.parse(row.endedAtIso8601!),
    );
  }

  AgentAuditEntry _mapAuditRow(AgentAuditRecord row) {
    final dynamic decoded = jsonDecode(row.detailsJson);
    return AgentAuditEntry(
      occurredAt: DateTime.parse(row.occurredAtIso8601),
      tool: AgentTool.values.byName(row.tool),
      kind: AgentAuditEventKind.values.byName(row.kind),
      agentId: row.agentId,
      transport: AgentTransport.values.byName(row.transport),
      allowed: row.allowed,
      sessionId: row.sessionId,
      reason: row.reason,
      details: (decoded as Map<Object?, Object?>).map<String, Object?>(
        (Object? key, Object? value) => MapEntry(key! as String, value),
      ),
    );
  }
}

class SavedRecipeRecord {
  const SavedRecipeRecord({
    required this.recipeId,
    required this.title,
    required this.description,
    required this.updatedAt,
    required this.tags,
    required this.isFavorite,
  });

  final String recipeId;
  final String title;
  final String? description;
  final DateTime updatedAt;
  final List<String> tags;
  final bool isFavorite;
}

class AgentAccessSettingsRecord {
  const AgentAccessSettingsRecord({
    required this.settingsId,
    required this.agentAccessEnabled,
    required this.requireVisibleSession,
    required this.allowDiscoveryWithoutConsent,
    required this.approvalMode,
    required this.auditRetentionDays,
    required this.updatedAt,
    this.activeSessionId,
    this.activeAgentId,
    this.activeTransport,
    this.activePurpose,
    this.activeStartedAt,
  });

  factory AgentAccessSettingsRecord.defaults() {
    return AgentAccessSettingsRecord(
      settingsId: _settingsRowId,
      agentAccessEnabled: false,
      requireVisibleSession: true,
      allowDiscoveryWithoutConsent: true,
      approvalMode: AgentApprovalMode.perRequest,
      auditRetentionDays: 14,
      updatedAt: DateTime.now().toUtc(),
    );
  }

  final String settingsId;
  final bool agentAccessEnabled;
  final bool requireVisibleSession;
  final bool allowDiscoveryWithoutConsent;
  final AgentApprovalMode approvalMode;
  final int auditRetentionDays;
  final String? activeSessionId;
  final String? activeAgentId;
  final AgentTransport? activeTransport;
  final String? activePurpose;
  final DateTime? activeStartedAt;
  final DateTime updatedAt;

  AgentAccessSettingsRecord copyWith({
    bool? agentAccessEnabled,
    bool? requireVisibleSession,
    bool? allowDiscoveryWithoutConsent,
    AgentApprovalMode? approvalMode,
    int? auditRetentionDays,
    String? activeSessionId,
    String? activeAgentId,
    AgentTransport? activeTransport,
    String? activePurpose,
    DateTime? activeStartedAt,
    DateTime? updatedAt,
    bool clearActiveSession = false,
  }) {
    return AgentAccessSettingsRecord(
      settingsId: settingsId,
      agentAccessEnabled: agentAccessEnabled ?? this.agentAccessEnabled,
      requireVisibleSession: requireVisibleSession ?? this.requireVisibleSession,
      allowDiscoveryWithoutConsent: allowDiscoveryWithoutConsent ??
          this.allowDiscoveryWithoutConsent,
      approvalMode: approvalMode ?? this.approvalMode,
      auditRetentionDays: auditRetentionDays ?? this.auditRetentionDays,
      activeSessionId: clearActiveSession ? null : (activeSessionId ?? this.activeSessionId),
      activeAgentId: clearActiveSession ? null : (activeAgentId ?? this.activeAgentId),
      activeTransport:
          clearActiveSession ? null : (activeTransport ?? this.activeTransport),
      activePurpose: clearActiveSession ? null : (activePurpose ?? this.activePurpose),
      activeStartedAt:
          clearActiveSession ? null : (activeStartedAt ?? this.activeStartedAt),
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}

class AgentSessionRecord {
  const AgentSessionRecord({
    required this.sessionId,
    required this.agentId,
    required this.transport,
    required this.consentGranted,
    required this.visible,
    required this.startedAt,
    this.purpose,
    this.endedAt,
  });

  final String sessionId;
  final String agentId;
  final AgentTransport transport;
  final String? purpose;
  final bool consentGranted;
  final bool visible;
  final DateTime startedAt;
  final DateTime? endedAt;

  bool get isActive => endedAt == null;

  AgentSessionRecord copyWith({
    String? purpose,
    bool? consentGranted,
    bool? visible,
    DateTime? endedAt,
  }) {
    return AgentSessionRecord(
      sessionId: sessionId,
      agentId: agentId,
      transport: transport,
      purpose: purpose ?? this.purpose,
      consentGranted: consentGranted ?? this.consentGranted,
      visible: visible ?? this.visible,
      startedAt: startedAt,
      endedAt: endedAt ?? this.endedAt,
    );
  }
}

class DriftAgentAuditLogSink implements AgentAuditLogSink {
  const DriftAgentAuditLogSink(this._database);

  final RecipeDatabase _database;

  @override
  Future<void> record(AgentAuditEntry entry) {
    return _database.recordAgentAuditEntry(entry);
  }
}

const String _settingsRowId = 'default';
