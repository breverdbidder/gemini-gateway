# Gemini Gateway

OpenAI-compatible API endpoint for Google Gemini via OAuth.
Clean fork of [CLIProxyAPI](https://github.com/router-for-me/CLIProxyAPI) — all non-Gemini providers and cloaking stripped.

## Features
- OpenAI `/v1/chat/completions` compatible
- Gemini 2.5 Pro via OAuth (unlimited, no API quota)
- Streaming and non-streaming responses
- Function calling / tools support
- Round-robin load balancing across accounts
- Docker deployment

## Quick Start
```bash
docker compose up -d
docker exec -it gemini-gateway ./gemini-gateway auth gemini
```

## What Was Removed
All Claude, Codex, Qwen, iFlow, Kimi auth/executors. All TLS fingerprint spoofing.
All cloaking and zero-width character obfuscation. See SECURITY.md.

## License
MIT (inherited from CLIProxyAPI)
