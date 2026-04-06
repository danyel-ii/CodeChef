import 'package:flutter/material.dart';
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
            child: PdfViewer.asset(
              deck.assetPath,
              params: const PdfViewerParams(
                backgroundColor: Color(0xFF0F1514),
                minScale: 1,
                maxScale: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
