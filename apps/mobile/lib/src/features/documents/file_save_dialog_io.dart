import 'dart:io';

import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';

Future<String?> saveTextFileWithDialog({
  required String fileName,
  required String text,
}) async {
  final Directory tempDir = await getTemporaryDirectory();
  final File tempFile = File('${tempDir.path}/$fileName');
  await tempFile.writeAsString(text);
  return FlutterFileDialog.saveFile(
    params: SaveFileDialogParams(
      sourceFilePath: tempFile.path,
    ),
  );
}
