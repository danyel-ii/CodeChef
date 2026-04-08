# agent_bridge

Transport-neutral headless access to the Code Chef runtime.

This package wraps:

- operation registry
- execution broker
- learning content lookup
- permission policy
- authorizer callback
- sanitized audit logging

It is the core machine-facing seam used by MCP and future Android host integrations.
