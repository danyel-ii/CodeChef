# Slide Decks

Code Chef ships bundled PDF slide decks for product orientation and selected learning modules.

## Included Decks

- About / Blueprint
  - [Code Chef Blueprint](../apps/mobile/assets/pdfs/about/codechef_blueprint.pdf)
- Operation Learning
  - [Base64 Deconstructed](../apps/mobile/assets/pdfs/operations/base64_deconstructed.pdf)
  - [Base64 Decoding Mechanics](../apps/mobile/assets/pdfs/operations/base64_decoding_mechanics.pdf)
  - [Hexadecimal Encoding Mechanics](../apps/mobile/assets/pdfs/operations/hexadecimal_encoding_mechanics.pdf)
  - [Inside Hex Decode](../apps/mobile/assets/pdfs/operations/inside_hex_decode.pdf)
  - [The XOR Transform](../apps/mobile/assets/pdfs/operations/the_xor_transform.pdf)
  - [CRC32 Mechanics](../apps/mobile/assets/pdfs/operations/crc32_mechanics.pdf)
  - [Caesar Box Mechanics](../apps/mobile/assets/pdfs/operations/caesar_box_mechanics.pdf)
  - [The Affine Engine](../apps/mobile/assets/pdfs/operations/the_affine_engine.pdf)
  - [Bacon Binary Blueprint](../apps/mobile/assets/pdfs/operations/bacon_binary_blueprint.pdf)
  - [AES-CBC Engineering Blueprint](../apps/mobile/assets/pdfs/operations/aes_cbc_engineering_blueprint.pdf)

## In-App Access

- Open `Settings` and tap `Open Blueprint PDF` to launch the Code Chef blueprint deck.
- Open `Learn`, choose a supported operation, and tap `Open PDF` to launch its linked deck.
- The viewer is in-app, so bundled decks no longer depend on an external PDF application.

## Storage

The decks live under [apps/mobile/assets/pdfs](../apps/mobile/assets/pdfs) so they are versioned in the repository and bundled into the Android app.

Because the PDFs are committed into git, those same paths are also directly downloadable from GitHub when browsing the repository.

## Update workflow

When new slide PDFs are added:

1. place them in [apps/mobile/assets/pdfs/operations](../apps/mobile/assets/pdfs/operations) or the matching subfolder
2. add or update the corresponding operation id mapping in [pdf_deck_catalog.dart](../apps/mobile/lib/src/features/documents/pdf_deck_catalog.dart)
3. rebuild the app so the new deck is bundled
