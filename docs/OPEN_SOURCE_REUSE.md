# Open Source Reuse Strategy

This project is **CyberChef-inspired** and may selectively reuse or adapt algorithm implementations where that is the most pragmatic path.

## 1. Guiding approach

Prefer this order:

1. **Pure Dart implementation from first principles** for simple/common operations.
2. **Careful adaptation of compatible open-source logic** where it materially reduces risk or effort.
3. **Optional native/FFI integration** only when strongly justified.

## 2. Reuse goals

Reuse should help us:
- accelerate delivery,
- preserve behavior on well-known transforms,
- inherit mature test vectors where possible,
- and reduce correctness risk.

Reuse must not:
- drag in a desktop-oriented UI architecture,
- force WebView-like assumptions into the app,
- or weaken provenance tracking.

## 3. Practical rule

Reuse **algorithms and test vectors**, not the desktop interaction model.

## 4. Provenance requirements

For any reused/adapted code, record:
- source project
- source file/function reference
- upstream license
- modification summary
- date of adaptation
- local owner/reviewer

Store this under:
- `tooling/licenses/`
- `docs/provenance/`
- relevant pack `licenseNotices`

## 5. Licensing requirements

Before adaptation:
- verify the upstream license is compatible with our distribution model
- preserve required notices
- preserve or generate NOTICE files where required
- track third-party transitive dependencies if code came with them

## 6. Packaging requirements

Reused logic must be wrapped behind our own:
- operation manifest
- parameter schema
- execution interface
- diagnostics/error model
- tests/examples

No reused logic should bypass the protocol.

## 7. Testing requirements for reused code

When adapting code:
- preserve or recreate upstream test vectors where legal/practical
- add our own regression tests
- validate error behavior, not just success cases
- verify behavior on mobile-relevant payload sizes

## 8. UI boundary rule

Do not import or port upstream desktop UI code into the mobile workbench.
If code is tightly coupled to DOM/web concerns, prefer reimplementation or narrow algorithm extraction.

## 9. Security note

For cryptographic or security-adjacent functionality:
- be explicit about whether the feature is educational or suitable for real security use
- prefer audited implementations for any operation that could mislead users into real security reliance
- document caveats clearly in learning content

## 10. Recommended initial reuse policy

### Safe to implement natively first
- Base64
- Hex
- URL encoding
- line transforms
- JSON pretty/minify/validate
- simple hashes
- Caesar/ROT13
- XOR

### Evaluate case by case
- compression
- more advanced crypto
- binary parsers
- certificate/X.509 handling
- anything with larger third-party dependency chains

## 11. Decision record template

For each reused/adapted algorithm, add a short ADR-like note:

```md
# Reuse Decision: core.text.base64.decode

- Source:
- License:
- Why reuse/adapt instead of reimplement:
- What was copied vs rewritten:
- Tests preserved:
- Risks:
- Reviewer:
```
