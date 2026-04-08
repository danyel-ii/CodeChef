# agent_mcp_server

Minimal MCP server host for Code Chef.

This package provides:

- MCP-style JSON-RPC request handling
- `initialize`
- `tools/list`
- `tools/call`
- stdio framing via `Content-Length`

The current CLI entrypoint boots the full shipped core runtime:

- `core.text`
- `core.cipher`
- `core.hash`
- `core.format`

HTTPS hosting is intentionally not implemented here yet. That remains blocked on certificate and trust-model decisions.
