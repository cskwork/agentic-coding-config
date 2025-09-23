<<<<<<< Updated upstream:cli-agents/claude_code/CLAUDE.md
1.  Preserve stability above all: respect existing patterns, make surgical changes, keep backward compatible, and never break a working state.
2.  Deliver what the user needs (not just asks): add obvious error handling, sensible defaults, and validation—no unrelated features.
3.  Demand a green test suite: all existing tests pass; add tests for new/changed code; keep performance acceptable and types safe where applicable.
4.  Ship MVP first, iterate fast: brief plan → build minimal solution → test → refactor → document (repeat by priority).
5.  Handle failures explicitly: diagnose → try alternatives → comment decisions; after 3 failed attempts, skip and record in IMPLEMENTATION_NOTES_YYYYMMDD.md.
6.  Read code smartly: start with README/entry/config; open only affected modules and direct deps; ignore tests/docs/assets unless needed.
7.  Keep architecture clean: domain/module structure, clear entry points, single-responsibility functions, descriptive names; move deprecated code to /legacy.
8.  Follow project tooling & style: format/lint consistently; Python(uv, ruff/black, pytest) · JS(npm/yarn, prettier/eslint, jest/vitest) · Java(maven/gradle, junit).
9.  Document decisions and progress: implementation comments in Korean; public docs/README in Korean; maintain IMPLEMENTATION_NOTES with summary/changes/decisions/tests/limits; share progress & final summary. 
10. Pass the completion gate: core features work, errors handled, tests added, config externalized, README updated, code formatted.
11. Your response has to provide context so always explain as if to a beginner.
=======
## **DEVELOPMENT PROTOCOL**
**1. STABILITY** - Never break working code. Surgical changes only. Backward compatible always.
**2. BUILD RIGHT** - Deliver needs, not requests. Include: error handling, validation, sensible defaults. Skip unrelated features.
**3. TESTS PASS** - Green suite mandatory. Test new/changed code. Maintain performance & type safety.
**4. MVP → ITERATE** - Plan briefly → Build minimal → Test → Refactor → Document → Repeat by priority.
**5. FAIL SMART** - Diagnose → Try alternatives → Document decisions. After 3 attempts: skip & log in `IMPLEMENTATION_NOTES_YYYYMMDD.md`.
**6. READ EFFICIENT** - Start: README/entry/config. Open: affected modules + direct deps only. Skip: tests/docs/assets unless required.
**7. CLEAN ARCHITECTURE** - Domain structure. Single responsibility. Clear entry points. Descriptive names. Deprecated → `/legacy`.
**8. MATCH PROJECT STYLE**
   - **Python:** uv, ruff/black, pytest
   - **JS:** npm/yarn, prettier/eslint, jest/vitest  
   - **Java:** maven/gradle, junit
**9. DOCUMENT** - Code comments & public docs in Korean. Maintain IMPLEMENTATION_NOTES (summary/changes/decisions/tests/limits). Share progress.
**10. DONE = COMPLETE** - Features work. Errors handled. Tests added. Config externalized. README updated. Code formatted.
>>>>>>> Stashed changes:CLAUDE.md
