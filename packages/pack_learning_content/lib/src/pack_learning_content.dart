class LearningExample {
  const LearningExample({
    required this.title,
    required this.input,
    required this.params,
    this.expectedOutputText,
  });

  final String title;
  final String input;
  final Map<String, Object?> params;
  final String? expectedOutputText;
}

class OperationLearningContent {
  const OperationLearningContent({
    required this.operationId,
    required this.whatItDoes,
    required this.whenToUse,
    required this.gotchas,
    required this.howItWorks,
    required this.examples,
    this.relatedOperations = const <String>[],
  });

  final String operationId;
  final String whatItDoes;
  final String whenToUse;
  final String gotchas;
  final List<String> howItWorks;
  final List<LearningExample> examples;
  final List<String> relatedOperations;
}
