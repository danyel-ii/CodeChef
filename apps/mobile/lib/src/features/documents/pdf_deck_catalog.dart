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
  'core.text.base64.encode': PdfDeck(
    title: 'Base64 Deconstructed',
    assetPath: 'assets/pdfs/operations/Base64_Deconstructed.pdf',
    repoPath: 'apps/mobile/assets/pdfs/operations/Base64_Deconstructed.pdf',
    description: 'Visual deck explaining how bytes become 6-bit groups and Base64 characters.',
  ),
  'core.text.hex.encode': PdfDeck(
    title: 'Hexadecimal Encoding Mechanics',
    assetPath: 'assets/pdfs/operations/hexadecimal_encoding_mechanics.pdf',
    repoPath: 'apps/mobile/assets/pdfs/operations/hexadecimal_encoding_mechanics.pdf',
    description: 'Step-by-step slide deck for how hex encoding maps bytes into hexadecimal pairs.',
  ),
  'core.text.hex.decode': PdfDeck(
    title: 'Inside Hex Decode',
    assetPath: 'assets/pdfs/operations/Inside_Hex_Decode.pdf',
    repoPath: 'apps/mobile/assets/pdfs/operations/Inside_Hex_Decode.pdf',
    description: 'Visual walkthrough of how hex pairs are converted back into raw bytes.',
  ),
  'core.cipher.xor': PdfDeck(
    title: 'The XOR Transform',
    assetPath: 'assets/pdfs/operations/The_XOR_Transform.pdf',
    repoPath: 'apps/mobile/assets/pdfs/operations/The_XOR_Transform.pdf',
    description: 'Slide deck explaining repeating-key XOR, byte-wise reversibility, and why XOR is educational rather than modern secure crypto.',
  ),
};
