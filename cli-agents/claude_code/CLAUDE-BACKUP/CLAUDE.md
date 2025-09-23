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