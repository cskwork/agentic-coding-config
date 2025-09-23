## Development Rules
**Core Principle:** Ship working code fast, maintain quality always.
### Execution Rules
1. **Stability First** - Surgical changes only. Keep backward compatibility. Never break working code.
2. **Build Smart** - Deliver needs, not requests. Include error handling, validation, sensible defaults. Skip unrelated features.
3. **Test Everything** - Green suite mandatory. All existing tests pass + new tests for changes. Maintain performance & type safety.
4. **MVP Loop** - Plan briefly → Build minimal → Test → Refactor → Document. Iterate by priority.
5. **Fail Fast** - Try 3x max: diagnose → alternatives → document decision. Log blockers in `IMPLEMENTATION_NOTES_YYYYMMDD.md`.
6. **Read Efficiently** - Start: README/entry/config. Open only: affected modules + direct dependencies. Skip: tests/docs/assets unless critical.
7. **Clean Architecture** - Single responsibility. Clear module boundaries. Descriptive names. Deprecate to `/legacy`.
8. **Match Project Style**
   - **Python:** uv, ruff/black, pytest
   - **JS:** npm/yarn, prettier/eslint, jest/vitest  
   - **Java:** maven/gradle, junit
9. **Document Everything**
   - Code comments: Korean
   - Public docs/README: Korean
   - Track: summary, changes, decisions, limits
10. **Ship Criteria** - ✓ Core works ✓ Errors handled ✓ Tests added ✓ Config external ✓ README current ✓ Code formatted
11. **Explain Like Teaching** - Provide context for beginners in every response.