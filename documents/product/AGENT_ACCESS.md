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

## What works right now

You can already validate the agent-facing surface in two ways.

### 1. Local MCP host on your machine

Run:

```bash
cd packages/agent_mcp_server
dart run bin/agent_mcp_server.dart
```

Then connect an MCP-capable client to that stdio process and call:

- `tools/list`
- `tools/call` with `list_packs`
- `tools/call` with `list_operations`
- `tools/call` with `describe_operation`
- `tools/call` with `run_single_operation`
- `tools/call` with `run_recipe`

That proves:

- the registry is discoverable
- schemas and manifests are exposed
- the execution engine can be driven without the UI
- learning content is reachable from the machine-facing surface

### 2. Android control-plane verification

Install a build from the `AgentAccess` branch and open `Settings`.

Verify:

1. `Agent Access` settings load.
2. Agent access can be enabled and disabled.
3. Approval mode can be changed.
4. An `MCP` session can be started.
5. The app shows an active-session banner.
6. Per-request approval prompts appear when enabled.
7. Audit entries appear.
8. Audit export works.
9. Audit retention settings persist.

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

That means an external agent cannot yet attach directly to the installed Android app as a packaged host. Today, the MCP host runs as a Dart process on a development machine, while Android already provides the consent/session/audit control plane that a future packaged host will need.

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
