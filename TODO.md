# Gemini Gateway — TODO

## Phase: BUILD (Approved March 11, 2026)

### Setup
- [ ] Fork CLIProxyAPI → breverdbidder/gemini-gateway
- [ ] Push upstream code to new repo
- [ ] Add CLAUDE.md root directive

### Surgery (Strip Non-Gemini Modules)
- [ ] Strip auth providers (claude, codex, antigravity, iflow, qwen, kimi, vertex)
- [ ] Strip executors (claude, codex, cloak, antigravity, iflow, kimi, qwen, aistudio)
- [ ] Strip translators (claude, codex, antigravity, openai/claude)
- [ ] Strip amp module
- [ ] Strip non-Gemini test files

### Compilation Fix
- [ ] Fix broken imports from stripped modules
- [ ] Fix registry/model_definitions.go — remove non-Gemini models
- [ ] Fix registry/model_registry.go — remove non-Gemini provider branches
- [ ] Fix api/server.go — remove non-Gemini handler routes
- [ ] Fix config/config.go — simplify to Gemini-only fields
- [ ] Fix translator/init.go — remove stripped provider registrations
- [ ] Fix thinking_providers.go — keep Gemini only
- [ ] Fix cmd/ — remove non-Gemini CLI auth commands
- [ ] Fix store/ — remove non-Gemini store branches
- [ ] Fix watcher/ — remove non-Gemini watcher config
- [ ] Fix sdk/ — remove non-Gemini builder options and handlers
- [ ] Clean build: `go build ./cmd/server/` succeeds

### Testing
- [ ] `go test ./...` passes
- [ ] Zero grep results for cloak/obfuscate/fakeUser/utlsRound
- [ ] Zero grep results for internal/auth/claude or internal/auth/codex
- [ ] Codebase < 30K lines Go

### Deployment
- [ ] Create simplified config.yaml
- [ ] Update Dockerfile for Gemini-only
- [ ] Update docker-compose.yml
- [ ] Docker build succeeds locally
- [ ] Deploy to Hetzner
- [ ] Verify /v1/models returns 200

### OAuth (HUMAN — Ariel)
- [ ] Run OAuth login on Hetzner
- [ ] Verify /v1/models returns Gemini model list

### Integration
- [ ] Update LiteLLM config on Render with Gateway as FREE tier
- [ ] E2E: Direct gateway chat completion works
- [ ] E2E: LiteLLM → Gateway → Gemini works
- [ ] E2E: Streaming works
- [ ] E2E: Function calling works

### Finalize
- [ ] Add HARNESS.md (cli-anything pattern)
- [ ] Add SECURITY.md
- [ ] Update README.md
- [ ] Run go mod tidy
- [ ] Final push to GitHub
- [ ] Add to Supabase master_index
- [ ] Add weekly health check (Sunday 9AM EST → Telegram)
