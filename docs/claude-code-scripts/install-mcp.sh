# Documentation

## Context7 MCP
claude mcp add --transport http context7 https://mcp.context7.com/mcp

## DeepWiki MCP - https://deepwiki.com/
claude mcp add -s user -t http deepwiki https://mcp.deepwiki.com/mcp

## Github MCP - https://github.com/github/github-mcp-server/blob/main/docs/installation-guides/install-claude.md
claude mcp add --transport http github https://api.githubcopilot.com/mcp -H "Authorization: Bearer YOUR_GITHUB_PAT"

## Atlassian MCP
npx -y mcp-remote https://mcp.atlassian.com/v1/sse
#### Note: If this command doesn't work due to a version-related issue, try specifying an older version of mcp-remote. The example below uses version 0.1.13, but you may use another version if needed:
npx -y mcp-remote@0.1.13 https://mcp.atlassian.com/v1/sse
#### Configure your client's settings with this format:
"mcp.servers": {
  "atlassian": {
    "command": "npx",
    "args": ["-y", "mcp-remote", "https://mcp.atlassian.com/v1/sse"]
}

## Naver Search (DataLab) MCP
{
  "mcpServers": {
    "naver-search": {
      "command": "npx",
      "args": ["-y", "@isnow890/naver-search-mcp"],
      "env": {
        "NAVER_CLIENT_ID": "KiSVb29hBxUV8Ja_Q7JD",
        "NAVER_CLIENT_SECRET": "cnzABrQuFI"
      }
    }
  }
}