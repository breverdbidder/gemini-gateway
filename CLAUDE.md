# Gemini Gateway — CLAUDE.md

## Identity
Gemini-only fork of CLIProxyAPI. OpenAI-compatible API for Gemini 2.5 Pro via OAuth.
No Claude/Codex/Qwen. No cloaking. No TLS spoofing.

## Stack
Go 1.24+, Gin, Alpine Docker. Deploy: Hetzner. Feeds into LiteLLM on Render.

## Critical Rules
- NEVER add Claude/Codex/Qwen auth back
- NEVER add TLS fingerprint spoofing (utls)
- NEVER add cloaking, fake user IDs, or zero-width obfuscation
- Gemini-only, clean, simple

## Current State: SURGERY COMPLETE — COMPILATION FIX NEEDED
Non-Gemini modules deleted. Code does NOT compile yet.
Your job: go build ./..., fix errors iteratively, commit when clean.

## Key Files Modified
- sdk/cliproxy/service.go — stripped non-Gemini executor registrations
- internal/config/config.go — still has CloakConfig struct (remove it)
- internal/watcher/diff/config_diff.go — still has cloak diff logic (remove it)

## What Was Stripped
- internal/auth/{claude,codex,antigravity,iflow,qwen,kimi,vertex}
- internal/runtime/executor/{claude,codex,cloak,antigravity,iflow,kimi,qwen,aistudio}
- internal/translator/{claude,codex,antigravity}
- internal/api/modules/amp

## What Stays
- internal/auth/gemini/ (492 lines — OAuth)
- internal/runtime/executor/gemini_*.go
- internal/translator/gemini*/ + openai/gemini*/
- All infrastructure: config, api, registry, store, thinking, cache, util

## Credentials
All secrets are in GitHub Actions secrets. Never hardcode.
See .env.example for required environment variables.

## Compilation Fix Strategy
1. go build ./... 2>&1 | head -50
2. Fix broken imports (remove lines referencing deleted packages)
3. Fix undefined type/func refs (remove or stub switch cases)
4. Repeat until clean
5. go test ./... -short
6. Commit and push
