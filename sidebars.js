/**
 * Creating a sidebar enables you to:
 - create an ordered group of docs
 - render a sidebar for each doc of that group
 - provide next/previous navigation

 The sidebars can be generated from the filesystem, or explicitly defined here.

 Create as many sidebars as you want.
 */

// @ts-check

/** @type {import('@docusaurus/plugin-content-docs').SidebarsConfig} */
const sidebars = {
  // By default, Docusaurus generates a sidebar from the docs folder structure
  tutorialSidebar: [
    'intro',
    {
      type: 'category',
      label: 'Knowledge Base',
      items: [
        'knowledge/index',
        {
          type: 'category',
          label: 'Claude Code',
          items: [
            'knowledge/claude-code/README',
            'knowledge/claude-code/architectural-overview',
            'knowledge/claude-code/comprehensive-analysis',
            'knowledge/claude-code/quick-reference'
          ]
        },
        {
          type: 'category',
          label: 'MCP (Model Context Protocol)',
          items: [
            'knowledge/mcp/README',
            'knowledge/mcp/comprehensive-analysis',
            'knowledge/mcp/quick-reference'
          ]
        },
        {
          type: 'category',
          label: 'RAG (Retrieval Augmented Generation)',
          items: [
            'knowledge/retrieval-augmented-generation/README',
            'knowledge/retrieval-augmented-generation/comprehensive-analysis',
            'knowledge/retrieval-augmented-generation/decision-framework',
            'knowledge/retrieval-augmented-generation/implementation-guide',
            'knowledge/retrieval-augmented-generation/pitfalls-recommendations'
          ]
        }
      ]
    },
    {
      type: 'category',
      label: 'Agents',
      items: [
        'agents/index',
        'agents/captcha-solver',
        'agents/code-reviewer',
        'agents/data-analyst',
        'agents/debug-specialist',
        'agents/korean-law-expert',
        'agents/research-specialist'
      ]
    },
    {
      type: 'category',
      label: 'Commands',
      items: [
        'commands/index',
        'commands/code-review-full',
        'commands/organize-all-files'
      ]
    }
  ],
};

export default sidebars;