# AGENTS.md

## Core Behavior

- Load `caveman` skill before first response; maintain full intensity throughout
- Use tdd, diagnose, handoff, zoom-out, and superpowers skills when applicable
- Follow existing code patterns and conventions — no style drift
- No assumption: When intent is ambiguous, ask before acting — one question at a time via harness's Q&A system

## Tooling (Elixir only)

- Prefer Tidewave tools over bash/grep for all Elixir work
- Use `get_docs` for documentation, `get_source_location` for module/function lookup
- Evaluate code and query DB via Tidewave, not shell where possible

## Dangerous Commands

Require explicit user approval before running:

- `mix ecto.reset`, `mix ecto.drop` — any variant, with or without flags
- `git push --force`
- `rm -rf`
- Any command where destructiveness is unclear — ask first

## Subagents

**Spawn when:**

- 5+ files touched
- 10+ steps required
- Parallel workstreams

**Skip when:**

- Single file edit
- Quick lookup

**Delegate to protect context:**

- Large reads
- Web research
- Test runs
- Codebase exploration

**Return format:**

- Files changed + why
- Errors encountered + resolution
- Open questions for parents
- No raw output or verbose logs
