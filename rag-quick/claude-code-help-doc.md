## claude-code-help-doc

ex)
```bash
claude --add-dir ../aidt-lcms-api ../aidt-lms-sse-api ../aidt-lms-websocket-api ../aidt-viewer-api ../aidt-bo-was ../aidt-lcms-was ../aidt-sso-api
```

# Understanding
 /init
You are an expert software architect and technical writer. Evaluate the main features in the project features and make mermaid chart for main features and organize them in docs/ folder in markdown, README.md in root as project overview 
 ## 📚 문서 목록
- [시스템 아키텍처](./architecture/README.md) - 전체 시스템 구조 및 컴포넌트 관계
- [API 명세서](./api/README.md) - REST API 엔드포인트 상세 정보
- [데이터 모델](./data-model/README.md) - 데이터베이스 스키마 및 DTO 구조
- [서비스 로직](./service/README.md) - 비즈니스 로직 상세 분석
- [배포 가이드](./deployment/README.md) - 애플리케이션 배포 방법
# Refactoring
refactor current project to be intuitive and well organized
# Features
You are a system design expert. explain the features in this project and also tell me the system design. for core features give code snippets that helps explain better.
# Security
You are a security expert. Look for any web request to a third party or outside source. Check if any data from my project is send to an external source. 
# Bruno API
 i want the project apis to be held also in bruno so easy quick testing is possible. organize the contents in aidt-bruno-api relevant folder and make sure all test works and add any missing apis required for api testing. organize the files and folders that already exist to make structure intuitive and relevant to api testing. 
 

|Command|Description|Example|
|---|---|---|
|`claude`|Start interactive REPL|`claude`|
|`claude "query"`|Start REPL with initial prompt|`claude "explain this project"`|
|`claude -p "query"`|Run one-off query, then exit|`claude -p "explain this function"`|
|`cat file \| claude -p "query"`|Process piped content|`cat logs.txt \| claude -p "explain"`|
|`claude -c`|Continue most recent conversation|`claude -c`|
|`claude -c -p "query"`|Continue in print mode|`claude -c -p "Check for type errors"`|
|`claude -r "<session-id>" "query"`|Resume session by ID|`claude -r "abc123" "Finish this PR"`|
|`claude update`|Update to latest version|`claude update`|
|`claude mcp`|Configure Model Context Protocol servers|[See MCP section in tutorials](https://docs.anthropic.com/en/docs/claude-code/tutorials#set-up-model-context-protocol-mcp)|
## Slash commands
Control Claude’s behavior during an interactive session:

|Command|Purpose|
|---|---|
|`/bug`|Report bugs (sends conversation to Anthropic)|
|`/clear`|Clear conversation history|
|`/compact [instructions]`|Compact conversation with optional focus instructions|
|`/config`|View/modify configuration|
|`/cost`|Show token usage statistics|
|`/doctor`|Checks the health of your Claude Code installation|
|`/help`|Get usage help|
|`/init`|Initialize project with CLAUDE.md guide|
|`/login`|Switch Anthropic accounts|
|`/logout`|Sign out from your Anthropic account|
|`/memory`|Edit CLAUDE.md memory files|
|`/model`|Select or change the AI model|
|`/permissions`|View or update [permissions](https://docs.anthropic.com/en/docs/claude-code/settings#permissions)|
|`/pr_comments`|View pull request comments|
|`/review`|Request code review|
|`/status`|View account and system statuses|
|`/terminal-setup`|Install Shift+Enter key binding for newlines (iTerm2 and VSCode only)|
|`/vim`|Enter vim mode for alternating insert and command modes|
### Quick memory with `#`

Add memories instantly by starting your input with `#`:

```
# Always use descriptive variable names
```

You’ll be prompted to select which memory file to store this in.

## Claude Code Quick Commands

```bash
# Start interactive mode
claude

# Start with an initial query
claude "explain this project"

# Run a single command and exit
claude -p "what does this function do?"

# Process piped content
cat logs.txt | claude -p "analyze these errors"

# Basic syntax 
claude mcp add-from-claude-desktop

claude mcp add mysql-server -s user -- npx -y @benborla29/mcp-server-mysql
# 기존 서버 제거
claude mcp remove mysql-server

# 환경 변수와 함께 다시 추가
claude mcp add mysql-server -s user \
  --env MYSQL_HOST=127.0.0.1 \
  --env MYSQL_PORT=3306 \
  --env MYSQL_USER=root \
  --env MYSQL_PASS=changeme_root! \
  --env MYSQL_DB=bo \
  --env ALLOW_INSERT_OPERATION=false \
  --env ALLOW_UPDATE_OPERATION=false \
  --env ALLOW_DELETE_OPERATION=false \
  -- npx -y @benborla29/mcp-server-mysql



# List all configured servers
claude mcp list

# Get details for a specific server
claude mcp get my-server

# Remove a server
claude mcp remove my-server
```

https://docs.anthropic.com/en/docs/claude-code/mcp

https://memoryhub.tistory.com/entry/Claude-Code%EB%A1%9C-%EA%B0%9C%EB%B0%9C-%EC%83%9D%EC%82%B0%EC%84%B1-%EA%B7%B9%EB%8C%80%ED%99%94%ED%95%98%EA%B8%B0-%EC%8B%A4%EC%A0%84-%ED%99%9C%EC%9A%A9-%EA%B0%80%EC%9D%B4%EB%93%9C


# ## CLI flags

Customize Claude Code’s behavior with these command-line flags:

| Flag                             | Description                                                                                                                                                                        | Example                                                    |
| -------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------- |
| `--add-dir`                      | Add additional working directories for Claude to access (validates each path exists as a directory)                                                                                | `claude --add-dir ../apps ../lib`                          |
| `--allowedTools`                 | A list of tools that should be allowed without prompting the user for permission, in addition to [settings.json files](https://docs.anthropic.com/en/docs/claude-code/settings)    | `"Bash(git log:*)" "Bash(git diff:*)" "Write"`             |
| `--disallowedTools`              | A list of tools that should be disallowed without prompting the user for permission, in addition to [settings.json files](https://docs.anthropic.com/en/docs/claude-code/settings) | `"Bash(git log:*)" "Bash(git diff:*)" "Write"`             |
| `--print`, `-p`                  | Print response without interactive mode (see [SDK documentation](https://docs.anthropic.com/en/docs/claude-code/sdk) for programmatic usage details)                               | `claude -p "query"`                                        |
| `--output-format`                | Specify output format for print mode (options: `text`, `json`, `stream-json`)                                                                                                      | `claude -p "query" --output-format json`                   |
| `--verbose`                      | Enable verbose logging, shows full turn-by-turn output (helpful for debugging in both print and interactive modes)                                                                 | `claude --verbose`                                         |
| `--max-turns`                    | Limit the number of agentic turns in non-interactive mode                                                                                                                          | `claude -p --max-turns 3 "query"`                          |
| `--model`                        | Sets the model for the current session with an alias for the latest model (`sonnet` or `opus`) or a model’s full name                                                              | `claude --model claude-sonnet-4-20250514`                  |
| `--permission-prompt-tool`       | Specify an MCP tool to handle permission prompts in non-interactive mode                                                                                                           | `claude -p --permission-prompt-tool mcp_auth_tool "query"` |
| `--resume`                       | Resume a specific session by ID, or by choosing in interactive mode                                                                                                                | `claude --resume abc123 "query"`                           |
| `--continue`                     | Load the most recent conversation in the current directory                                                                                                                         | `claude --continue`                                        |
| `--dangerously-skip-permissions` | Skip permission prompts (use with caution)                                                                                                                                         | `claude --dangerously-skip-permissions`                    |

The `--output-format json` flag is particularly useful for scripting and automation, allowing you to parse Claude’s responses programmatically.

For detailed information about print mode (`-p`) including output formats, streaming, verbose logging, and programmatic usage, see the [SDK documentation](https://docs.anthropic.com/en/docs/claude-code/sdk).


gemini integration mcp usage

https://github.com/BeehiveInnovations/gemini-mcp-server?tab=readme-ov-file#quickstart-5-minutes
```
Just ask Claude naturally:

- "Use gemini to think deeper about this architecture design" → `thinkdeep`
- "Get gemini to review this code for security issues" → `codereview`
- "Get gemini to debug why this test is failing" → `debug`
- "Use gemini to analyze these files to understand the data flow" → `analyze`
- "Brainstorm with gemini about scaling strategies" → `chat`
- "Share my implementation plan with gemini for feedback" → `chat`
- "Get gemini's opinion on my authentication design" → `chat`
```
- **Need a thinking partner?** → `chat` (brainstorm ideas, get second opinions, validate approaches)
- **Need deeper thinking?** → `thinkdeep` (extends Claude's analysis, finds edge cases)
- **Code needs review?** → `codereview` (bugs, security, performance issues)
- **Pre-commit validation?** → `precommit` (validate git changes before committing)
- **Something's broken?** → `debug` (root cause analysis, error tracing)
- **Want to understand code?** → `analyze` (architecture, patterns, dependencies)
- **Server info?** → `get_version` (version and configuration details)
# Reference
https://docs.anthropic.com/en/docs/claude-code/cli-usage