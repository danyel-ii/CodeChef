import 'package:mobile_recipe_lab_mobile/src/features/documents/file_save_dialog.dart';

Future<String?> exportMarkdownReport({
  required String fileName,
  required String markdown,
}) async {
  return saveTextFileWithDialog(
    fileName: fileName,
    text: markdown,
  );
}
