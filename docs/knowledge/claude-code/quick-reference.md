# Claude Code: Quick Reference Guide

## Installation & Setup
```bash
# Install
npm install -g @anthropic-ai/claude-code

# Start
cd your-project
claude
```

## Core Commands
```bash
# Interactive mode
claude

# Single command
claude -p "your prompt here"

# Continue previous conversation  
claude --continue

# Resume from saved state
claude --resume
```

## Slash Commands
- `/help` - Get help and documentation
- `/mcp` - View MCP server status and tools
- `/permissions` - Manage tool permissions
- `/export` - Export conversation history
- `/status` - Show system status
- `/config` - View configuration
- `/doctor` - Diagnose system issues
- `/bug` - Report bugs

## Configuration Files
```
~/.claude/settings.json          # User settings
.claude/settings.json            # Project settings  
.claude/commands/*.md            # Custom commands
.mcp.json                        # MCP server config
```

## Essential Settings
```json
{
  "model": "claude-3-5-sonnet-20241022",
  "provider": "anthropic", 
  "maxTokens": 4096,
  "temperature": 0.7
}
```

## Built-in Tools
- **BashTool** - Execute shell commands
- **SearchTool** - Search codebase with regex
- **WebTool** - Fetch web content
- **TaskTool** - Manage TODO lists
- **ReadTool** - Read file contents
- **EditTool** - Modify files
- **Git Integration** - Version control

## Common Workflows

### Feature Development
```bash
claude -p "Add a user authentication system with login/logout functionality"
```

### Debugging
```bash
claude -p "Fix the memory leak in the UserService class"
```

### Code Review
```bash
claude -p "Review this pull request and suggest improvements"
```

### Refactoring
```bash
claude -p "Refactor the payment processing module to use the Strategy pattern"
```

## MCP Integration
```json
{
  "mcpServers": {
    "github": {
      "command": "docker",
      "args": ["run", "-i", "--rm", "github-mcp-server"],
      "env": {"GITHUB_TOKEN": "$GITHUB_TOKEN"}
    }
  }
}
```

## Hook System
```bash
# Available hooks
- UserPromptSubmit
- PreToolUse  
- PreCompact
- Stop
- SubagentStop
```

## Environment Variables
```bash
ANTHROPIC_API_KEY=your-key
CLAUDE_CONFIG_DIR=~/.config/claude-code
AWS_BEARER_TOKEN_BEDROCK=token
CLAUDE_MODEL=claude-3-5-sonnet-20241022
```

## Troubleshooting

### Permission Issues
```bash
claude /permissions  # Check current permissions
```

### MCP Server Problems
```bash
claude /mcp          # View MCP server status
```

### Configuration Problems
```bash
claude /doctor       # Run diagnostics
```

### Token Limits
- Use focused prompts
- Leverage `/memory` for context
- Choose appropriate model for task

## Best Practices

### Prompting
- Be specific and actionable
- Include context and constraints
- Break complex tasks into steps

### Security
- Review generated code
- Use git for change tracking  
- Configure permission restrictions
- Store API keys securely

### Performance
- Start with small tasks
- Use appropriate models
- Monitor token usage
- Leverage caching when possible

## Common Patterns

### Multi-step Development
```bash
claude -p "Create a React component for user profiles, add unit tests, and update the main app to use it"
```

### Error Investigation
```bash
claude -p "The application is throwing 'Cannot read property of undefined' errors. Investigate and fix the root cause."
```

### Documentation
```bash
claude -p "Generate comprehensive documentation for the API endpoints in src/routes/"
```

### Code Quality
```bash
claude -p "Run linting, fix all warnings, and ensure the code follows project conventions"
```

## Integration Examples

### GitHub Actions
```yaml
- uses: anthropics/claude-code-action@v1
  with:
    prompt: "Review this PR and add appropriate labels"  
    mcp_config: .mcp.json
    allowed_tools: ["mcp__github__*", "Bash"]
```

### VS Code Integration
```json
{
  "claude.autoComplete": true,
  "claude.contextAware": true,
  "claude.model": "claude-3-5-sonnet-20241022"
}
```

## Model Selection Guide

### Sonnet 3.5 (Default)
- General coding tasks
- Code review and debugging
- Documentation generation

### Opus 4  
- Complex architectural decisions
- Advanced refactoring
- Research and analysis

### Sonnet 4
- Latest features
- Enhanced reasoning
- Improved codebase understanding