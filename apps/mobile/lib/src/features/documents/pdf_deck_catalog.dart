class PdfDeck {
  const PdfDeck({
    required this.title,
    required this.assetPath,
    required this.repoPath,
    this.description,
  });

  final String title;
  final String assetPath;
  final String repoPath;
  final String? description;
}

const PdfDeck aboutBlueprintDeck = PdfDeck(
  title: 'CodeChef Blueprint',
  assetPath: 'assets/pdfs/about/codechef_blueprint.pdf',
  repoPath: 'apps/mobile/assets/pdfs/about/codechef_blueprint.pdf',
  description: 'Blueprint slide deck for the app vision, architecture, and product framing.',
);

const Map<String, PdfDeck> operationLearningDecks = <String, PdfDeck>{
  'core.text.hex.encode': PdfDeck(
    title: 'Hexadecimal Encoding Mechanics',
    assetPath: 'assets/pdfs/operations/hexadecimal_encoding_mechanics.pdf',
    repoPath: 'apps/mobile/assets/pdfs/operations/hexadecimal_encoding_mechanics.pdf',
    description: 'Step-by-step slide deck for how hex encoding maps bytes into hexadecimal pairs.',
  ),
};
