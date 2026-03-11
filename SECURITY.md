# Security — Gemini Gateway

## What Was Removed (vs upstream CLIProxyAPI)
- TLS fingerprint spoofing (utls Chrome/Firefox fingerprint)
- Claude Code user ID generation (fake session IDs)
- Zero-width character obfuscation of sensitive words
- All non-Gemini OAuth flows

## What Remains
- API key authentication (Bearer token required)
- Management API restricted to localhost only
- Gemini OAuth using Google's published client ID
- Token storage in mounted Docker volume
- TLS support available via config
