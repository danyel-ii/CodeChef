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
    assetPath: 'assets/pdfs/operations/base64_deconstructed.pdf',
    repoPath: 'apps/mobile/assets/pdfs/operations/base64_deconstructed.pdf',
    description: 'Visual deck explaining how bytes become 6-bit groups and Base64 characters.',
  ),
  'core.text.base64.decode': PdfDeck(
    title: 'Base64 Decoding Mechanics',
    assetPath: 'assets/pdfs/operations/base64_decoding_mechanics.pdf',
    repoPath: 'apps/mobile/assets/pdfs/operations/base64_decoding_mechanics.pdf',
    description: 'Step-by-step deck for turning Base64 quartets back into bytes and decoded text.',
  ),
  'core.text.hex.encode': PdfDeck(
    title: 'Hexadecimal Encoding Mechanics',
    assetPath: 'assets/pdfs/operations/hexadecimal_encoding_mechanics.pdf',
    repoPath: 'apps/mobile/assets/pdfs/operations/hexadecimal_encoding_mechanics.pdf',
    description: 'Step-by-step slide deck for how hex encoding maps bytes into hexadecimal pairs.',
  ),
  'core.text.hex.decode': PdfDeck(
    title: 'Inside Hex Decode',
    assetPath: 'assets/pdfs/operations/inside_hex_decode.pdf',
    repoPath: 'apps/mobile/assets/pdfs/operations/inside_hex_decode.pdf',
    description: 'Visual walkthrough of how hex pairs are converted back into raw bytes.',
  ),
  'core.cipher.xor': PdfDeck(
    title: 'The XOR Transform',
    assetPath: 'assets/pdfs/operations/the_xor_transform.pdf',
    repoPath: 'apps/mobile/assets/pdfs/operations/the_xor_transform.pdf',
    description: 'Slide deck explaining repeating-key XOR, byte-wise reversibility, and why XOR is educational rather than modern secure crypto.',
  ),
  'core.hash.crc32': PdfDeck(
    title: 'CRC32 Mechanics',
    assetPath: 'assets/pdfs/operations/crc32_mechanics.pdf',
    repoPath: 'apps/mobile/assets/pdfs/operations/crc32_mechanics.pdf',
    description: 'Visual guide to reflected CRC32 bit steps, polynomial reduction, and checksum output.',
  ),
  'core.cipher.caesar_box': PdfDeck(
    title: 'Caesar Box Mechanics',
    assetPath: 'assets/pdfs/operations/caesar_box_mechanics.pdf',
    repoPath: 'apps/mobile/assets/pdfs/operations/caesar_box_mechanics.pdf',
    description: 'Grid-first walkthrough of row-wise write, column-wise read, and the reverse reconstruction path.',
  ),
  'core.cipher.affine': PdfDeck(
    title: 'The Affine Engine',
    assetPath: 'assets/pdfs/operations/the_affine_engine.pdf',
    repoPath: 'apps/mobile/assets/pdfs/operations/the_affine_engine.pdf',
    description: 'Explains modular multiplication, additive shifts, and why affine keys need a valid inverse.',
  ),
  'core.cipher.bacon': PdfDeck(
    title: 'Bacon Binary Blueprint',
    assetPath: 'assets/pdfs/operations/bacon_binary_blueprint.pdf',
    repoPath: 'apps/mobile/assets/pdfs/operations/bacon_binary_blueprint.pdf',
    description: 'Shows how five-symbol A/B groups encode alphabet positions in the modern and classical Bacon variants.',
  ),
  'core.cipher.aes': PdfDeck(
    title: 'AES-CBC Engineering Blueprint',
    assetPath: 'assets/pdfs/operations/aes_cbc_engineering_blueprint.pdf',
    repoPath: 'apps/mobile/assets/pdfs/operations/aes_cbc_engineering_blueprint.pdf',
    description: 'Walks through AES block encryption, CBC chaining, IV usage, and PKCS7 padding in the app.',
  ),
};
