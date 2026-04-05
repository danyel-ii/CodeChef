import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<String> exportMarkdownReport({
  required String fileName,
  required String markdown,
}) async {
  Directory directory;
  if (Platform.isAndroid) {
    directory = await getExternalStorageDirectory() ??
        await getApplicationDocumentsDirectory();
  } else {
    directory = await getApplicationDocumentsDirectory();
  }
  final exportDirectory = Directory('${directory.path}/exports');
  await exportDirectory.create(recursive: true);
  final file = File('${exportDirectory.path}/$fileName');
  await file.writeAsString(markdown);
  return file.path;
}
