import 'package:pack_learning_content/pack_learning_content.dart';

const Map<String, OperationLearningContent> coreFormatLearningContent =
    <String, OperationLearningContent>{
  'core.format.json.pretty': OperationLearningContent(
    operationId: 'core.format.json.pretty',
    whatItDoes: 'Parses JSON text and rewrites it with human-friendly indentation.',
    whenToUse: 'Use when a payload is technically valid JSON but hard to read in one line.',
    gotchas: 'Invalid JSON should raise a structured input error instead of guessing.',
    howItWorks: <String>[
      'Parse the input text as JSON so the structure is understood instead of treated as plain text.',
      'Optionally sort object keys if that parameter is enabled.',
      'Walk the parsed structure and emit it again with indentation and line breaks.',
      'Preserve JSON values while changing only their presentation.',
      'Return an error if the source is not valid JSON.',
    ],
    relatedOperations: <String>['core.format.json.minify', 'core.format.json.validate'],
    examples: <LearningExample>[
      LearningExample(
        title: 'Pretty print compact JSON',
        input: '{"a":1,"b":2}',
        params: <String, Object?>{'indent': 2, 'sortKeys': false},
        expectedOutputText: '{\n  "a": 1,\n  "b": 2\n}',
      ),
    ],
  ),
  'core.format.json.minify': OperationLearningContent(
    operationId: 'core.format.json.minify',
    whatItDoes: 'Parses JSON text and rewrites it as a compact single line.',
    whenToUse: 'Use when a compact representation is needed for transport or comparison.',
    gotchas: 'Minifying valid JSON does not change its meaning, only whitespace.',
    howItWorks: <String>[
      'Parse the input text as JSON.',
      'Optionally sort object keys if requested.',
      'Serialize the parsed JSON back out without unnecessary spaces or line breaks.',
      'Preserve the data model while removing presentation-only whitespace.',
      'Fail clearly if the input is not valid JSON.',
    ],
    relatedOperations: <String>['core.format.json.pretty', 'core.format.json.validate'],
    examples: <LearningExample>[
      LearningExample(
        title: 'Minify JSON',
        input: '{\n  "a": 1,\n  "b": 2\n}',
        params: <String, Object?>{'sortKeys': false},
        expectedOutputText: '{"a":1,"b":2}',
      ),
    ],
  ),
  'core.format.json.validate': OperationLearningContent(
    operationId: 'core.format.json.validate',
    whatItDoes: 'Checks whether input text is valid JSON and returns it unchanged if valid.',
    whenToUse: 'Use before downstream JSON operations when you want a validation-only step.',
    gotchas: 'This step is a validator, not a formatter.',
    howItWorks: <String>[
      'Parse the input as JSON without trying to reformat it.',
      'Confirm that the syntax is valid and that the full text can be read successfully.',
      'Return the original text unchanged when validation passes.',
      'Raise a structured input error when parsing fails.',
      'Use this as a guard step before later JSON-specific transformations.',
    ],
    relatedOperations: <String>['core.format.json.pretty'],
    examples: <LearningExample>[
      LearningExample(
        title: 'Validate JSON',
        input: '{"ok":true}',
        params: <String, Object?>{},
        expectedOutputText: '{"ok":true}',
      ),
    ],
  ),
  'core.format.lines.trim': OperationLearningContent(
    operationId: 'core.format.lines.trim',
    whatItDoes: 'Trims surrounding whitespace from each line in the input.',
    whenToUse: 'Use when logs or copied text contain uneven spacing around each line.',
    gotchas: 'Internal spaces are preserved; only leading and trailing spaces are removed.',
    howItWorks: <String>[
      'Split the input into individual lines.',
      'Trim leading and trailing whitespace from each line independently.',
      'Leave internal spacing untouched so the core content stays the same.',
      'Join the cleaned lines back together with newline separators.',
      'Return the resulting multiline text.',
    ],
    relatedOperations: <String>['core.format.lines.filter_empty', 'core.format.lines.join'],
    examples: <LearningExample>[
      LearningExample(
        title: 'Trim lines',
        input: '  a  \n  b  ',
        params: <String, Object?>{},
        expectedOutputText: 'a\nb',
      ),
    ],
  ),
  'core.format.lines.filter_empty': OperationLearningContent(
    operationId: 'core.format.lines.filter_empty',
    whatItDoes: 'Removes empty and whitespace-only lines from the input.',
    whenToUse: 'Use before joining or comparing line-oriented text.',
    gotchas: 'Whitespace-only lines are treated as empty.',
    howItWorks: <String>[
      'Split the input into lines.',
      'Check each line after trimming for visible content.',
      'Drop lines that are empty or whitespace-only.',
      'Keep lines that still contain meaningful content.',
      'Join the surviving lines back together in their original order.',
    ],
    relatedOperations: <String>['core.format.lines.trim', 'core.format.lines.join'],
    examples: <LearningExample>[
      LearningExample(
        title: 'Filter blank lines',
        input: 'a\n\n \n b',
        params: <String, Object?>{},
        expectedOutputText: 'a\n b',
      ),
    ],
  ),
  'core.format.lines.join': OperationLearningContent(
    operationId: 'core.format.lines.join',
    whatItDoes: 'Joins input lines together using a chosen separator.',
    whenToUse: 'Use to collapse multiline text into a comma-separated or space-separated string.',
    gotchas: 'This does not trim lines by itself. Combine with trim/filter steps if needed.',
    howItWorks: <String>[
      'Split the input into lines.',
      'Keep each line in order without modifying it.',
      'Insert the configured separator between adjacent lines.',
      'Collapse the multiline input into one combined string.',
      'Return the single-line joined result.',
    ],
    relatedOperations: <String>['core.format.lines.filter_empty', 'core.format.lines.trim'],
    examples: <LearningExample>[
      LearningExample(
        title: 'Join lines with commas',
        input: 'a\nb\nc',
        params: <String, Object?>{'separator': ', '},
        expectedOutputText: 'a, b, c',
      ),
    ],
  ),
};
