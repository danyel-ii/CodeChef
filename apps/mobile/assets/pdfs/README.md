# PDF Deck Library

This folder is the source of truth for bundled slide-deck PDFs shipped with the Android app.

## Structure

- `about/`
  - long-form product/about decks
- `operations/`
  - operation-specific learning decks

## Current operation deck mapping

- `base64_deconstructed.pdf` -> `core.text.base64.encode`
- `hexadecimal_encoding_mechanics.pdf` -> `core.text.hex.encode`
- `inside_hex_decode.pdf` -> `core.text.hex.decode`
- `the_xor_transform.pdf` -> `core.cipher.xor`

## Update workflow

1. Drop new or updated PDFs into the correct subfolder.
2. Update [pdf_deck_catalog.dart](/Users/danyel-ii/CodeChef/apps/mobile/lib/src/features/documents/pdf_deck_catalog.dart) with the matching operation id.
3. Rebuild the app so the updated assets are bundled.
