import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'pdf_deck_catalog.dart';

class AssetPdfLauncher {
  const AssetPdfLauncher();

  Future<String> openDeck(PdfDeck deck) async {
    final ByteData data = await rootBundle.load(deck.assetPath);
    final Directory directory = await getApplicationDocumentsDirectory();
    final Directory deckDirectory = Directory(path.join(directory.path, 'pdf_decks'));
    if (!deckDirectory.existsSync()) {
      deckDirectory.createSync(recursive: true);
    }
    final String filename = path.basename(deck.assetPath);
    final File file = File(path.join(deckDirectory.path, filename));
    await file.writeAsBytes(
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
      flush: true,
    );
    final OpenResult result = await OpenFilex.open(file.path, type: 'application/pdf');
    if (result.type != ResultType.done) {
      throw StateError(
        'Could not open ${deck.title}. ${result.message}.',
      );
    }
    return file.path;
  }
}
