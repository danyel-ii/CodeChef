import 'package:execution_protocol/execution_protocol.dart';

class RegistryException implements Exception {
  RegistryException(this.message);

  final String message;

  @override
  String toString() => 'RegistryException: $message';
}

class OperationSearchEntry {
  const OperationSearchEntry({
    required this.id,
    required this.title,
    required this.category,
    required this.tags,
  });

  final String id;
  final String title;
  final String category;
  final List<String> tags;
}

class RegisteredOperation {
  const RegisteredOperation({
    required this.packId,
    required this.packVersion,
    required this.operation,
  });

  final String packId;
  final String packVersion;
  final Operation operation;
}

class OperationRegistry {
  final Map<String, RegisteredOperation> _operations =
      <String, RegisteredOperation>{};
  final Map<String, PackManifest> _packs = <String, PackManifest>{};

  void registerPack(OperationPack pack) {
    if (_packs.containsKey(pack.manifest.packId)) {
      throw RegistryException(
        'Duplicate pack id ${pack.manifest.packId} is not allowed.',
      );
    }
    if (!_matchesVersion(kProtocolVersion, pack.manifest.minProtocolVersion)) {
      throw RegistryException(
        'Pack ${pack.manifest.packId} requires protocol '
        '${pack.manifest.minProtocolVersion}.',
      );
    }
    for (final PackDependency dependency in pack.manifest.dependencies) {
      if (!_packs.containsKey(dependency.packId)) {
        throw RegistryException(
          'Pack dependency ${dependency.packId} must be registered first.',
        );
      }
    }
    for (final Operation operation in pack.operations) {
      if (_operations.containsKey(operation.manifest.id)) {
        throw RegistryException(
          'Duplicate operation id ${operation.manifest.id} is not allowed.',
        );
      }
      _operations[operation.manifest.id] = RegisteredOperation(
        packId: pack.manifest.packId,
        packVersion: pack.manifest.version,
        operation: operation,
      );
    }
    _packs[pack.manifest.packId] = pack.manifest;
  }

  RegisteredOperation resolve(
    String operationId, {
    required String versionRange,
  }) {
    final RegisteredOperation? resolved = _operations[operationId];
    if (resolved == null) {
      throw RegistryException('Unknown operation $operationId.');
    }
    if (!_matchesVersion(resolved.operation.manifest.version, versionRange)) {
      throw RegistryException(
        'Operation $operationId does not satisfy $versionRange.',
      );
    }
    return resolved;
  }

  List<OperationSearchEntry> search(String query) {
    final String needle = query.trim().toLowerCase();
    return _operations.values
        .map(
          (RegisteredOperation entry) => OperationSearchEntry(
            id: entry.operation.manifest.id,
            title: entry.operation.manifest.title,
            category: entry.operation.manifest.category,
            tags: entry.operation.manifest.tags,
          ),
        )
        .where(
          (OperationSearchEntry entry) =>
              needle.isEmpty ||
              entry.id.toLowerCase().contains(needle) ||
              entry.title.toLowerCase().contains(needle) ||
              entry.category.toLowerCase().contains(needle) ||
              entry.tags.any(
                (String tag) => tag.toLowerCase().contains(needle),
              ),
        )
        .toList(growable: false);
  }

  Iterable<PackManifest> get packs => _packs.values;

  Iterable<RegisteredOperation> get operations => _operations.values;
}

class PackLoader {
  OperationRegistry load(Iterable<OperationPack> packs) {
    final registry = OperationRegistry();
    final List<OperationPack> pending = packs.toList(growable: true);

    while (pending.isNotEmpty) {
      bool loadedAny = false;
      for (int index = pending.length - 1; index >= 0; index--) {
        final OperationPack pack = pending[index];
        final bool dependenciesLoaded = pack.manifest.dependencies.every(
          (PackDependency dependency) =>
              registry.packs.any((PackManifest entry) => entry.packId == dependency.packId),
        );
        if (!dependenciesLoaded) {
          continue;
        }
        registry.registerPack(pack);
        pending.removeAt(index);
        loadedAny = true;
      }
      if (!loadedAny) {
        throw RegistryException(
          'Unable to resolve pack dependency graph for: '
          '${pending.map((OperationPack pack) => pack.manifest.packId).join(', ')}',
        );
      }
    }

    return registry;
  }
}

bool _matchesVersion(String version, String versionRange) {
  if (versionRange == version) {
    return true;
  }
  if (versionRange.startsWith('^')) {
    final List<String> wanted = versionRange.substring(1).split('.');
    final List<String> actual = version.split('.');
    return wanted.isNotEmpty && actual.isNotEmpty && wanted.first == actual.first;
  }
  return false;
}
