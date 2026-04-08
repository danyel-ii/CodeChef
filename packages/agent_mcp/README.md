# agent_mcp

Stable MCP-style tool contract over `agent_bridge`.

This package defines:

- tool descriptors
- typed JSON argument parsing
- tool dispatch for pack listing, operation discovery, recipe validation, execution, and learning lookup

It does not open sockets or stdio itself. That work belongs to `agent_mcp_server`.
