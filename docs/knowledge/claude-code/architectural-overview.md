# Claude Code: Architectural Overview

## System Architecture

Claude Code follows a five-layer architecture designed for extensibility, security, and seamless integration with development workflows.

```
┌─────────────────────────────────────────────────────────┐
│                   User Terminal                          │
│                  (claude command)                       │
└─────────────────────────────────────────────────────────┘
                             │
┌─────────────────────────────────────────────────────────┐
│                 CLI Interface Layer                     │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────────────┐│
│  │ Interactive │ │ Print Mode  │ │ Slash Commands      ││
│  │ Mode        │ │ (-p flag)   │ │ (/help, /mcp, etc.) ││
│  └─────────────┘ └─────────────┘ └─────────────────────┘│
└─────────────────────────────────────────────────────────┘
                             │
┌─────────────────────────────────────────────────────────┐
│                Extension Framework                      │
│  ┌─────────────────────┐    ┌─────────────────────────┐ │
│  │    Hook System      │    │     MCP Framework       │ │
│  │ • UserPromptSubmit  │    │ • stdio transport       │ │
│  │ • PreToolUse        │    │ • HTTP transport        │ │
│  │ • PreCompact        │    │ • SSE transport         │ │
│  │ • Stop/SubagentStop │    │ • OAuth auth            │ │
│  └─────────────────────┘    └─────────────────────────┘ │
└─────────────────────────────────────────────────────────┘
                             │
┌─────────────────────────────────────────────────────────┐
│                Tool Execution System                    │
│  ┌──────────────────────────────────────────────────────┐│
│  │                Built-in Tools                        ││
│  │ BashTool • SearchTool • WebTool • TaskTool          ││
│  │ ReadTool • EditTool • Git Integration               ││
│  └──────────────────────────────────────────────────────┘│
│  ┌──────────────────────────────────────────────────────┐│
│  │                 MCP Tools                            ││
│  │ mcp__github__* • mcp__jira__* • Custom MCP Servers  ││
│  └──────────────────────────────────────────────────────┘│
└─────────────────────────────────────────────────────────┘
                             │
┌─────────────────────────────────────────────────────────┐
│                AI Model Layer                           │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────────────┐│
│  │ Anthropic   │ │ AWS Bedrock │ │ Google Vertex AI    ││
│  │ API         │ │             │ │                     ││
│  └─────────────┘ └─────────────┘ └─────────────────────┘│
│  ┌─────────────────────────────────────────────────────┐ │
│  │ Models: Sonnet 3.5, Sonnet 4, Opus 4             │ │
│  └─────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────┘
                             │
┌─────────────────────────────────────────────────────────┐
│              Configuration Management                   │
│  Environment Variables → settings.json → .claude/      │ 
│  • API Keys • Model Selection • Tool Permissions       │
└─────────────────────────────────────────────────────────┘
```

## Core Components Deep Dive

### 1. CLI Interface Layer
The entry point for all user interactions, providing multiple modes of operation:

**Interactive Mode**: Persistent conversation sessions with context retention
```bash
claude
> Help me debug this authentication issue
> Now let's add unit tests for the fix
```

**Print Mode**: Single-shot command execution
```bash
claude -p "Refactor the user service to use dependency injection"
```

**Slash Commands**: System management and introspection
```bash
/mcp          # View MCP server status
/permissions  # Manage tool access
/doctor       # System diagnostics
```

### 2. Extension Framework
Two parallel extension mechanisms providing powerful customization:

#### Hook System
Event-driven extension points throughout the execution flow:
- **UserPromptSubmit**: Intercept and modify user input
- **PreToolUse**: Validate tool execution before running
- **PreCompact**: Control conversation compression
- **Stop/SubagentStop**: Post-execution cleanup and logging

#### MCP Framework  
Standardized protocol for external service integration:
- **Transport Layer**: stdio, HTTP, SSE connections
- **Authentication**: OAuth and token-based auth
- **Resource Management**: Dynamic tool discovery and execution
- **Scoping**: User, local, and project-level configurations

### 3. Tool Execution System
Dual-tier tool architecture with built-in and extensible tools:

#### Built-in Tool Ecosystem
```
BashTool
├── Command execution with progress tracking
├── Shell snapshot management for reliability  
└── Environment variable support

SearchTool (Grep)
├── Regex pattern matching across codebase
├── jq filter support for structured data
└── Context-aware result ranking

WebTool
├── URL content fetching with date context
├── HTML to markdown conversion
└── Caching for performance optimization

TaskTool
├── TODO list management and persistence
├── Task execution with status tracking
└── Integration with project management systems

ReadTool/EditTool
├── File I/O with line-specific operations
├── Intelligent indentation preservation
└── Change tracking and validation

Git Integration
├── Repository operations (status, diff, commit)
├── Branch management and merging
└── Workflow automation (PR creation, etc.)
```

#### MCP Tool Integration
```
mcp__[server]__[tool] naming convention
├── mcp__github__get_issue
├── mcp__github__update_issue  
├── mcp__jira__create_ticket
└── mcp__custom__domain_specific_tool
```

### 4. AI Model Layer
Multi-provider model access with intelligent selection:

**Provider Architecture**:
- **Anthropic API**: Direct access to latest Claude models
- **AWS Bedrock**: Enterprise deployment with additional security
- **Google Vertex AI**: Integration with Google Cloud ecosystem

**Model Selection Strategy**:
```
Task Complexity Assessment
├── Simple tasks → Sonnet 3.5 (speed + cost optimization)
├── Complex reasoning → Opus 4 (maximum capability)
└── Latest features → Sonnet 4 (cutting-edge performance)
```

### 5. Configuration Management
Hierarchical configuration system with clear precedence:

```
Priority Order (highest to lowest):
1. Environment Variables (ANTHROPIC_API_KEY, CLAUDE_MODEL, etc.)
2. User Settings (~/.claude/settings.json)
3. Project Settings (.claude/settings.json)
4. Default Values (built-in fallbacks)
```

## Data Flow Architecture

### Request Processing Flow
```
User Input → Hook Processing → Context Assembly → AI Processing → Tool Execution → Response Generation
     ↓              ↓                ↓               ↓               ↓                ↓
┌─────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐
│ Natural │ │UserPrompt   │ │ Codebase    │ │ Model       │ │ Tool        │ │ Formatted   │
│Language │ │Submit Hook  │ │ Context +   │ │ Inference   │ │ Execution   │ │ Output +    │
│Command  │ │Validation   │ │ Memory      │ │ + Tool      │ │ (Built-in   │ │ Context     │
│         │ │             │ │ Integration │ │ Selection   │ │ or MCP)     │ │ Updates     │
└─────────┘ └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘ └─────────────┘
```

### Context Management
Claude Code maintains rich context through multiple mechanisms:

**Codebase Context**: 
- File structure mapping
- Dependency graph analysis  
- Recent change tracking
- Pattern recognition across project

**Conversation Context**:
- Multi-turn conversation memory
- Task completion tracking
- Error and solution history
- User preference learning

**System Context**:
- Environment state monitoring
- Tool availability assessment
- Permission and security constraints
- Performance metrics tracking

## Security Architecture

### Multi-Layer Security Model
```
┌─────────────────────────────────────────────────────────┐
│                User-Controlled Permissions              │
│  /permissions command • Tool-specific access control   │
└─────────────────────────────────────────────────────────┘
                             │
┌─────────────────────────────────────────────────────────┐
│                 Hook-Based Validation                   │
│  PreToolUse hooks • Custom validation logic            │
└─────────────────────────────────────────────────────────┘
                             │  
┌─────────────────────────────────────────────────────────┐
│                Environment Isolation                    │
│  DevContainer support • Network restrictions           │
└─────────────────────────────────────────────────────────┘
                             │
┌─────────────────────────────────────────────────────────┐
│               Credential Management                     │
│  Keychain integration • Environment variable handling  │
└─────────────────────────────────────────────────────────┘
```

### Data Privacy Safeguards
- **Local Processing**: Code analysis happens locally when possible
- **Minimal Data Retention**: 30-day retention for feedback transcripts
- **No Training Data**: User feedback not used for model training  
- **Encryption in Transit**: All API communications encrypted
- **Audit Logging**: Comprehensive activity logging for compliance

## Performance Architecture

### Optimization Strategies
**Context Optimization**:
- Intelligent context pruning
- Incremental codebase analysis
- Cached dependency resolution
- Selective file inclusion

**Token Efficiency**:
- Model-appropriate task routing  
- Context compression algorithms
- Memory system for frequent patterns
- Progressive disclosure of information

**Network Optimization**:
- Connection pooling for MCP servers
- Async tool execution where possible
- Request batching for related operations
- Intelligent retry mechanisms with backoff

## Extensibility Patterns

### Plugin Development Model
```
Custom Hook Development
├── Event-driven architecture
├── TypeScript/JavaScript support
├── Async operation handling
└── Error boundary management

MCP Server Development  
├── Standardized protocol implementation
├── Multiple transport options
├── OAuth integration support
└── Resource discovery mechanisms

Custom Command Development
├── Markdown-based command definition
├── Parameter handling and validation
├── Integration with existing tool ecosystem  
└── Documentation auto-generation
```

This architecture enables Claude Code to function as a comprehensive AI development platform while maintaining the flexibility and composability that developers expect from command-line tools.