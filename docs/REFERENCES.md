# References

These references ground the architecture choices behind this pack.

## CyberChef

- GCHQ CyberChef repository  
  Describes CyberChef as a browser app for encoding, encryption, compression, data analysis, hashes, checksums, X.509, IPv6, and more.

- CyberChef README  
  Useful for understanding the original desktop/browser interaction model and operation breadth.

- CyberChef issue #181 (“Mobile UI”)  
  Important architectural signal:
  - current UI was acknowledged as poor on mobile,
  - maintainers discussed either a separate mobile UI or adapting the current one,
  - parts of `src/web/` were noted as tightly coupled to the DOM,
  - “focus should be on simplicity.”

- CyberChef changelog  
  Important architectural signal:
  - recipe processing moved into a Web Worker,
  - module system created so operations depending on large libraries can load separately.

## Flutter

- Flutter architectural overview  
  Documents Flutter as an extensible layered system with independent libraries and replaceable parts.

- Flutter isolates documentation  
  Important for keeping heavy transforms off the UI thread.

- Flutter platform channels documentation  
  Important for optional future platform-native integrations.

## Suggested interpretation of the references

These references support the following design choices:

1. **Do not port a desktop pane layout directly to mobile.**
2. **Separate engine/protocol from UI from the beginning.**
3. **Use a module/pack model for algorithm expansion.**
4. **Use background execution for heavy work.**
5. **Treat platform-native integration as optional and isolated.**

## Working note

This project is inspired by CyberChef’s useful operation model, but the intended product is a separate mobile-first experience with its own architecture.
