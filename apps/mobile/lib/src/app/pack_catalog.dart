import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:execution_protocol/execution_protocol.dart';
import 'package:pack_core_cipher/pack_core_cipher.dart';
import 'package:pack_core_format/pack_core_format.dart';
import 'package:pack_core_hash/pack_core_hash.dart';
import 'package:pack_core_text/pack_core_text.dart';
import 'package:pack_learning_content/pack_learning_content.dart';

class InstalledPackDescriptor {
  const InstalledPackDescriptor({
    required this.pack,
    required this.learningContent,
  });

  final OperationPack pack;
  final Map<String, OperationLearningContent> learningContent;
}

final installedPacksProvider = Provider<List<InstalledPackDescriptor>>((Ref ref) {
  return const <InstalledPackDescriptor>[
    InstalledPackDescriptor(
      pack: CoreTextPack(),
      learningContent: coreTextLearningContent,
    ),
    InstalledPackDescriptor(
      pack: CoreCipherPack(),
      learningContent: coreCipherLearningContent,
    ),
    InstalledPackDescriptor(
      pack: CoreHashPack(),
      learningContent: coreHashLearningContent,
    ),
    InstalledPackDescriptor(
      pack: CoreFormatPack(),
      learningContent: coreFormatLearningContent,
    ),
  ];
});

final installedLearningContentProvider =
    Provider<Map<String, OperationLearningContent>>((Ref ref) {
  final Map<String, OperationLearningContent> content =
      <String, OperationLearningContent>{};
  for (final InstalledPackDescriptor descriptor in ref.watch(installedPacksProvider)) {
    content.addAll(descriptor.learningContent);
  }
  return Map<String, OperationLearningContent>.unmodifiable(content);
});
