# Slide Decks

CodeChef ships bundled PDF slide decks for product orientation and selected learning modules.

## Included Decks

- About / Blueprint
  - [CodeChef Blueprint](/Users/danyel-ii/CodeChef/apps/mobile/assets/pdfs/about/codechef_blueprint.pdf)
- Operation Learning
  - [Base64 Deconstructed](/Users/danyel-ii/CodeChef/apps/mobile/assets/pdfs/operations/base64_deconstructed.pdf)
  - [Hexadecimal Encoding Mechanics](/Users/danyel-ii/CodeChef/apps/mobile/assets/pdfs/operations/hexadecimal_encoding_mechanics.pdf)
  - [Inside Hex Decode](/Users/danyel-ii/CodeChef/apps/mobile/assets/pdfs/operations/inside_hex_decode.pdf)
  - [The XOR Transform](/Users/danyel-ii/CodeChef/apps/mobile/assets/pdfs/operations/the_xor_transform.pdf)

## In-App Access

- Open `Settings` and tap `Open Blueprint PDF` to launch the CodeChef blueprint deck.
- Open `Learn`, choose a supported operation, and tap `Open PDF` to launch its linked deck.
- The viewer is in-app, so bundled decks no longer depend on an external PDF application.

## Storage

The decks live under [apps/mobile/assets/pdfs](/Users/danyel-ii/CodeChef/apps/mobile/assets/pdfs) so they are versioned in the repository and bundled into the Android app.

## Update workflow

When new slide PDFs are added:

1. place them in [apps/mobile/assets/pdfs/operations](/Users/danyel-ii/CodeChef/apps/mobile/assets/pdfs/operations) or the matching subfolder
2. add or update the corresponding operation id mapping in [pdf_deck_catalog.dart](/Users/danyel-ii/CodeChef/apps/mobile/lib/src/features/documents/pdf_deck_catalog.dart)
3. rebuild the app so the new deck is bundled
