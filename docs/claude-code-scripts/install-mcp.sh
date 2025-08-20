# Documentation

## Context7 MCP - https://github.com/upstash/context7 (-s user install global)
claude mcp add -s user --transport http context7 https://mcp.context7.com/mcp


## DeepWiki MCP - https://deepwiki.com/
claude mcp add -s user -t http deepwiki https://mcp.deepwiki.com/mcp


## Github MCP - https://github.com/github/github-mcp-server/blob/main/docs/installation-guides/install-claude.md
claude mcp add -s user --transport http github https://api.githubcopilot.com/mcp -H "Authorization: Bearer YOUR_GITHUB_PAT"


## Atlassian MCP
claude mcp add -s user --transport sse --scope local atlassian https://mcp.atlassian.com/v1/sse
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


## Install MCP-Obsidian with Local Rest API
{
  "mcp-obsidian": {
    "command": "uvx",
    "args": [
      "mcp-obsidian"
    ],
    "env": {
      "OBSIDIAN_API_KEY": "6ecb98e1f27d4b5288e60bdcda5d4b8281803fd57edb8535b946f406d852e383",
      "OBSIDIAN_HOST": "127.0.0.1",
      "OBSIDIAN_PORT": "27124"
    }
  }
}