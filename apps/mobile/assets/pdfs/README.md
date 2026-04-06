# PDF Deck Library

This folder is the source of truth for bundled slide-deck PDFs shipped with the Android app.

## Structure

- `about/`
  - long-form product/about decks
- `operations/`
  - operation-specific learning decks

## Current operation deck mapping

- `base64_deconstructed.pdf` -> `core.text.base64.encode`
- `base64_decoding_mechanics.pdf` -> `core.text.base64.decode`
- `hexadecimal_encoding_mechanics.pdf` -> `core.text.hex.encode`
- `inside_hex_decode.pdf` -> `core.text.hex.decode`
- `the_xor_transform.pdf` -> `core.cipher.xor`
- `crc32_mechanics.pdf` -> `core.hash.crc32`
- `caesar_box_mechanics.pdf` -> `core.cipher.caesar_box`
- `the_affine_engine.pdf` -> `core.cipher.affine`
- `bacon_binary_blueprint.pdf` -> `core.cipher.bacon`
- `aes_cbc_engineering_blueprint.pdf` -> `core.cipher.aes`

## Update workflow

1. Drop new or updated PDFs into the correct subfolder.
2. Update [pdf_deck_catalog.dart](../../lib/src/features/documents/pdf_deck_catalog.dart) with the matching operation id.
3. Rebuild the app so the updated assets are bundled.
4. Commit the PDFs so GitHub can serve them as downloadable files from the repository and releases.
