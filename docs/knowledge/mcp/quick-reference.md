# MCP Quick Reference Guide

## What is MCP?
Universal protocol for connecting AI models to external data and tools - think "USB-C for AI applications"

## Core Components

### 1. Tools (Functions AI can call)
```python
# Python FastMCP
@mcp.tool()
def add_numbers(a: int, b: int) -> str:
    """두 숫자를 더하는 도구"""
    return str(a + b)
```

```typescript
// TypeScript
server.registerTool("add", {
  inputSchema: { a: z.number(), b: z.number() }
}, async ({ a, b }) => ({ content: [{ type: "text", text: String(a + b) }] }));
```

### 2. Resources (Data AI can read)
```python
# Python - Static resource
@mcp.resource("config")
def get_config() -> str:
    """설정 정보 반환"""
    return "config data"

# Python - Dynamic resource template
@mcp.resource("user/{user_id}")
def get_user(user_id: str) -> str:
    """사용자 정보 조회"""
    return f"User data for {user_id}"
```

### 3. Prompts (Reusable templates)
```python
@mcp.prompt("greet_user")
def greeting_prompt(name: str, style: str = "formal") -> list:
    """사용자 인사 프롬프트 생성"""
    return [{"role": "user", "content": f"Greet {name} in {style} style"}]
```

## Transport Options

| Transport | Best For | Command |
|-----------|----------|---------|
| **stdio** | Local tools, Claude Desktop | `mcp.run(transport="stdio")` |
| **HTTP** | Web services | `mcp.run(transport="streamable-http")` |
| **WebSocket** | Real-time apps | Custom implementation |

## Quick Start Templates

### Basic Python Server
```python
from mcp.server.fastmcp import FastMCP

mcp = FastMCP("my-server")

@mcp.tool()
def hello(name: str) -> str:
    """인사 도구"""
    return f"Hello, {name}!"

@mcp.resource("status")
def server_status() -> str:
    """서버 상태 확인"""
    return "Server is running"

if __name__ == "__main__":
    mcp.run(transport="stdio")  # Claude Desktop용
```

### Basic TypeScript Server
```typescript
import { McpServer } from "@modelcontextprotocol/sdk/server/mcp";
import { z } from "zod";

const server = new McpServer({ name: "my-server", version: "1.0.0" });

server.registerTool("hello", {
  inputSchema: { name: z.string() }
}, async ({ name }) => ({
  content: [{ type: "text", text: `Hello, ${name}!` }]
}));

server.run({ transport: "stdio" });
```

### Client Usage
```typescript
import { Client } from "@modelcontextprotocol/sdk/client";

const client = new Client({ name: "my-client", version: "1.0.0" });
await client.connect(transport);

// 도구 호출
const result = await client.callTool({ name: "hello", arguments: { name: "World" } });

// 리소스 읽기
const resource = await client.readResource({ uri: "status://" });

// 프롬프트 가져오기
const prompt = await client.getPrompt("greet_user", { name: "Alice" });
```

## Common Patterns

### Error Handling
```python
@mcp.tool()
def safe_divide(a: float, b: float) -> str:
    """안전한 나눗셈"""
    if b == 0:
        raise ValueError("Division by zero not allowed")
    return str(a / b)
```

### Progress Notifications
```python
@mcp.tool()
async def long_task(duration: int) -> str:
    """긴 작업 실행"""
    for i in range(duration):
        await ctx.progress(f"Step {i+1}/{duration}")
        await asyncio.sleep(1)
    return "Task completed"
```

### Dynamic Resources
```python
@mcp.resource("file/{path}")
def read_file(path: str) -> str:
    """파일 내용 읽기"""
    with open(path, 'r') as f:
        return f.read()
```

## Authentication Setup
```python
from mcp.server.auth import OAuth2Settings

auth_settings = OAuth2Settings(
    token_url="https://auth.example.com/token",
    scopes=["read", "write"]
)

mcp = FastMCP("secure-server", auth=auth_settings)
```

## Debugging Tips

### Enable Logging
```python
import logging
logging.basicConfig(level=logging.DEBUG)
```

### Test with Claude Desktop
1. Add server to `claude_desktop_config.json`:
```json
{
  "mcpServers": {
    "my-server": {
      "command": "python",
      "args": ["path/to/server.py"]
    }
  }
}
```

### Common Issues
- **Connection failures**: Check transport configuration
- **Schema errors**: Validate input/output schemas match implementation
- **Permission errors**: Verify authentication setup
- **Resource not found**: Check URI patterns and templates

## Performance Best Practices

1. **Use structured schemas** - Reduces parsing overhead
2. **Implement caching** - For frequently accessed resources
3. **Choose right transport** - stdio for local, HTTP for web
4. **Add progress notifications** - For operations >1 second
5. **Validate inputs early** - Prevent unnecessary processing

## Quick Decision Tree

```
Need AI to access external data/tools?
├─ Yes: Use MCP
│  ├─ Local desktop app? → stdio transport
│  ├─ Web service? → streamable-http transport
│  └─ Real-time updates? → WebSocket transport
└─ No: Direct API integration sufficient
```

## CLI Commands (if available)
```bash
# Create new MCP project
mcp create my-project

# Run development server
mcp dev

# Test server
mcp test server.py

# Deploy to production
mcp deploy
```

---

*Quick Reference - Last Updated: 2025-07-26*