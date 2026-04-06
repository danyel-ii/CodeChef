import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdfrx/pdfrx.dart';

import 'pdf_deck_catalog.dart';

class PdfViewerScreen extends StatelessWidget {
  const PdfViewerScreen({
    required this.deck,
    super.key,
  });

  final PdfDeck deck;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1514),
      appBar: AppBar(
        title: Text(deck.title),
        backgroundColor: const Color(0xFF171311),
        foregroundColor: const Color(0xFFF4F0E8),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (deck.description != null)
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              color: const Color(0xFF171311),
              child: Text(
                deck.description!,
                style: GoogleFonts.ibmPlexMono(
                  color: const Color(0xFFF4F0E8),
                  fontSize: 12,
                  height: 1.45,
                ),
              ),
            ),
          Expanded(
            child: FutureBuilder<Uint8List>(
              future: _loadPdfBytes(deck.assetPath),
              builder: (
                BuildContext context,
                AsyncSnapshot<Uint8List> snapshot,
              ) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError || !snapshot.hasData) {
                  return _PdfLoadError(
                    assetPath: deck.assetPath,
                    error: snapshot.error,
                  );
                }
                return PdfViewer.data(
                  snapshot.data!,
                  sourceName: deck.assetPath,
                  params: const PdfViewerParams(
                    backgroundColor: Color(0xFF0F1514),
                    minScale: 1,
                    maxScale: 6,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<Uint8List> _loadPdfBytes(String assetPath) async {
    final ByteData data = await rootBundle.load(assetPath);
    return Uint8List.sublistView(data);
  }
}

class _PdfLoadError extends StatelessWidget {
  const _PdfLoadError({
    required this.assetPath,
    this.error,
  });

  final String assetPath;
  final Object? error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Unable to load PDF deck.',
            style: GoogleFonts.ibmPlexSans(
              color: const Color(0xFFF4F0E8),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            assetPath,
            style: GoogleFonts.ibmPlexMono(
              color: const Color(0xFFE7BE55),
              fontSize: 12,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          if (error != null) ...<Widget>[
            const SizedBox(height: 16),
            Text(
              '$error',
              style: GoogleFonts.ibmPlexMono(
                color: const Color(0xFFF4F0E8),
                fontSize: 11,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
