# Agent Access

## Goal

Expose Code Chef's existing engine as a machine-facing runtime so an agent can discover packs, inspect operations, validate recipes, run transformations, and load learning content without driving the UI.

## Why this fits the current architecture

The repo already separates:

- operation metadata and protocol
- registry and pack loading
- recipe domain
- execution broker
- learning content

That means agent access should sit above those layers, not inside Flutter widgets.

## Chosen direction

Primary transport target:

- `MCP`

Secondary transport target:

- `HTTPS`

Rejected for the first implementation:

- plain `HTTP`
- UI automation as the primary integration path

For Android, this keeps the runtime reusable while avoiding a brittle tap-driven integration.

## First implementation slice

The first slice adds a new pure-Dart package:

- `packages/agent_bridge`

It provides a transport-neutral headless runtime around:

- `OperationRegistry`
- `ExecutorBroker`
- learning content lookup

The second slice adds:

- `packages/agent_mcp`
- `packages/agent_mcp_server`
- persisted agent settings, sessions, and audit entries in Drift
- Android-visible consent and session state in the app

## Initial machine-facing surface

The runtime now exposes typed methods for:

- `list_packs`
- `list_operations`
- `search_operations`
- `describe_operation`
- `validate_recipe`
- `run_recipe`
- `run_single_operation`
- `load_learning_content`

Input and output use the existing protocol and recipe models wherever possible.

The MCP adapter now maps those methods to machine-facing tool names with stable JSON inputs and outputs:

- `list_packs`
- `list_operations`
- `search_operations`
- `describe_operation`
- `validate_recipe`
- `run_recipe`
- `run_single_operation`
- `load_learning_content`

The MCP server package now adds:

- JSON-RPC request handling for `initialize`
- `tools/list`
- `tools/call`
- stdio serving with MCP-style `Content-Length` framing
- a default CLI host that boots all shipped core packs:
  - `core.text`
  - `core.cipher`
  - `core.hash`
  - `core.format`

## Security model

Agent access is not unconditional.

The initial bridge includes:

- explicit permission policy
- request context carrying consent and session visibility flags
- optional authorizer callback for per-request decisions
- audit log sink

The Android app now persists:

- agent access settings
- agent sessions
- agent audit events

and surfaces:

- enable/disable agent access
- visible-session requirement
- discovery-before-consent policy
- approval mode
- current active session
- per-request approval prompts
- recent audit trail
- audit export and retention controls

The audit trail is intentionally sanitized:

- no raw payloads
- no raw outputs
- no secret params

Instead it records metadata such as:

- tool used
- transport
- agent id
- session id
- recipe id
- byte counts
- success/failure

## What is still missing

This branch still does not yet include:

- Android service/process packaging for the MCP host
- an HTTPS server implementation
- certificate / key management for HTTPS
- trust-bound local transport selection for HTTPS

HTTPS remains intentionally deferred. This branch does not open an HTTPS listener until:

- certificate provisioning is defined
- local trust/authentication is defined
- Android exposure rules are explicit
- the user-consent story for network access is settled

## Recommended next steps

1. Package the MCP host for Android invocation or bound-service use.
2. Feed host-created request contexts from the active Android session state.
3. Add audit export formatting options and retention policy tests for upgrades.
4. Add an HTTPS adapter only after the trust model and certificate strategy are explicit.
