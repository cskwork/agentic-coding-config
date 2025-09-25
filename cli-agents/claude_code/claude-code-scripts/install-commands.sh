# Create a personal command
mkdir -p ~/.claude/commands

# Make Developer Doc
echo "You are professional project document maker.
Create These Documentation in docs/ folder. 
Be professional and use no emoticons. Write Doc in Korean.

- **API Documentation**- 상세한 API endpoint 및 예제
- **README**- 프로젝트 개요
- **User Guide**- 최종 사용자를 위한 단계별 가이드 문서
- **Developer Guide**- 소스 공헌자를 위한 깊이있는 기술적인 문서
- **Configuration Guide**- 설정 및 배포 가이드
- **Troubleshooting Guide**- 일반적으로 발생할 수 있는 문제해결 가이드" > ~/.claude/commands/make-developer-doc.md

# Make Test API
echo "API를 손쉽게 호출하기 위한 테스트 스크립트 작성해줘
- 필수 도구: curl
- 선택 도구: jq (요청/응답을 보기 좋게 출력)
- 기본값은 로컬 환경을 가정하며, 환경변수로 조정 가능. 예) : "${REL_TYPE:=RTQI}" 
- docs/scripts/ 폴더에 작성 
- 파일명은 test-{url주소} 예) https://host:port/v-api/ailearning/1161954 에 대한 테스트면 host, port 제외하고-> test-v-api-ailearning-aiLrnNo.sh" > ~/.claude/commands/make-test-api.md



# =========================
# Common Example

# Security Check
echo "Think. Review this code for security vulnerabilities:" > ~/.claude/commands/security-review.md

# Full Code Review
echo "Ultra Think. Are there redundant, deprecated, or legacy methods that remain in this codebase? 
Is there duplication or scattered logic? Is there confusion, mismatches, or misconfiguration? Overengineering, dead code, or unnecessary features? 
Is the system completely streamlined and elegant, with clear separation of concerns, and no security vulnerabilities? 
Audit DEEPLY and provide a clear, actionable response, and a highly specific plan to resolve any issues you discover. 
Do not guess or make assumptions. Review the codebase directly. Keep the big picture in mind always, tracking how files interact and the overall structure of the system. 
You will need supporting evidence and data flow from the codebase to approve the plan and move forward. 
If the intended functionality is muddy or difficult to understand, STOP, ask the user to clarify. The intended functionality must be CRYSTAL CLEAR." > ~/.claude/commands/code-full-review.md

# Add Feature
echo "Ultra Think. We would like to add [FEATURE] to this system. This feature should [DESCRIBE]. It must align with our existing system of [EXPLAIN]. 
Create a detailed implementation plan that outlines each file that must be touched, and specific changes that must be made. 
We are looking for a clean, seamless implementation strategy. You must conduct thorough research during this planning phase. Your plan should not contain any analysis or code review. I expect that to be completed by the time you present your plan.  
Prepare a detailed action plan for my review. Together we will finalize and refine the plan for execution." > ~/.claude/commands/add-feature.md

# Review Feature
echo "Think. Audit the [FEATURE] system for completeness, security standards, and correct wiring, specifically related to [REQUIREMENT]. 
Identify dead or redundant code, scattered or overly complex logic, and areas where things can be simplified but maintain functionality. Also note gaps in implementation or incomplete refactors, loose ends, and sources of confusion.
Present a focused audit with a step-by-step action plan that outlines the current implementation, discovered errors, opportunities for improvement, and potential for optimization.
Prepare to enhance, debug, or refactor the system as needed according to user feedback in order to ensure a robust and reliable operation that is flexible, extensible, easy to maintain, and crafted with precision." > ~/.claude/commands/review-feature.md

# Documentation for Knowlednge
cat << 'EOF' > ~/.claude/commands/record-knowledge-doc.md
# Study Knowledge Folder
You are an expert research analyst specializing in technical documentation analysis and knowledge synthesis. Your expertise includes identifying patterns across complex materials, extracting actionable insights, and building comprehensive mental models from diverse sources. 

<task>
Your task is to conduct a thorough, systematic analysis of all research materials in the specified knowledge folder(s). If $ARGUMENTS contains commas, process each folder separately in sequence (e.g., "api-design,microservices,testing" → analyze api-design, then microservices, then testing). This deep dive will enable you to provide expert-level guidance on these topics in future conversations.
</task>
<context>
The user has curated specific research materials in knowledge folders for important topics. By thoroughly studying these materials now, you'll be able to provide more accurate, nuanced, and actionable advice when the user needs help with related tasks. This upfront investment in understanding will significantly improve the quality of future assistance.
</context>

<instructions>
1. **PARSE FOLDER ARGUMENTS**
   <argument_parsing>
   - Check if $ARGUMENTS contains commas
   - If yes: Split into array of folder names (e.g., "folder1,folder2,folder3")
   - If no: Process as single folder name
   - Trim any whitespace from folder names
   </argument_parsing>

2. **PROCESS EACH FOLDER**
   For each folder in the list (or single folder), execute steps 3-10:

3. **MEMORY SYSTEM INTEGRATION**
   <memory_check>
   Before analyzing new materials:
   - Check for previous analyses of this topic
   - Present memory recap of related past work if found
   - Ask user if they want to build upon or start fresh from previous findings
   </memory_check>

4. **LOCATE THE KNOWLEDGE FOLDER**
   <folder_search>
   - Primary location: `~/.claude/knowledge/[current folder name]`
   - Full path: `~/.claude/knowledge/[current folder name]`
   
   If the exact folder doesn't exist:
   a. List all folders in `~/.claude/knowledge/` using the LS tool
   b. Try: `find ~/.claude/knowledge -type d -iname "*[current folder name]*"`
   c. Search for folders containing keywords from `[current folder name]`
   d. Identify partial matches or related topics
   e. If multiple candidates exist, select the most relevant or ask for clarification
   f. If no matches found:
      - Use MCP if available: `mcp__mcp-deepwiki__deepwiki_fetch` for supplementary info
      - Suggest creating the folder and populating it with relevant resources
      - Offer to search web for initial materials using WebSearch tool
   e. If no knowledge found make a new one and proceed writing according to SYSTEMATIC DOCUMENT ANALYSIS
   </folder_search>

5. **SYSTEMATIC DOCUMENT ANALYSIS**
   Process documents in this specific order:
   <document_order>
   1. Overview files (README.md, summary.md, overview.md, index.md)
   2. Foundational theory documents
   3. Implementation guides and technical specifications
   4. Comparison studies and benchmarks
   5. Case studies and real-world examples
   6. Advanced topics and edge cases
   </document_order>

6. **INTERACTIVE CHECKPOINT - FOCUS AREAS**
   <checkpoint_1>
   After initial folder scan:
   - Show document list and estimated content volume
   - Present: "I found [X] documents totaling approximately [Y] pages. Would you like me to:
     a) Analyze everything comprehensively
     b) Focus on specific subtopics or aspects
     c) Prioritize certain documents"
   - Adjust analysis approach based on user response
   </checkpoint_1>

7. **MULTI-LAYERED ANALYSIS FRAMEWORK**
   For each document, extract and synthesize:
   
   <analysis_layers>
   a. **Surface Layer**: Key facts, definitions, and explicit statements
   b. **Pattern Layer**: Recurring themes, common approaches, consensus views
   c. **Insight Layer**: Implicit assumptions, unstated trade-offs, hidden complexities
   d. **Application Layer**: Practical implications, use cases, implementation considerations
   e. **Meta Layer**: Quality of sources, potential biases, gaps in coverage
   f. **Visual Layer**: For any images, diagrams, or charts found:
      - Analyze visual materials using Read tool
      - Extract insights from diagrams and architectural drawings
      - Create textual descriptions of visual concepts
      - Note relationships shown visually but not described in text
   </analysis_layers>

8. **KNOWLEDGE SYNTHESIS APPROACH**
   <synthesis_method>
   - Create mental models that connect concepts across documents
   - Identify contradictions or debates within the materials
   - Note evolution of ideas if historical context is present
   - Map relationships between theoretical concepts and practical applications
   - Build a hierarchy of importance for key insights
   </synthesis_method>

9. **INTERACTIVE CHECKPOINT - EMERGING PATTERNS**
   <checkpoint_2>
   After pattern identification:
   - Present: "I've identified these emerging themes and patterns:
     [List key patterns found]
     Would you like me to:
     a) Explore any of these patterns deeper
     b) Look for specific connections between patterns
     c) Continue with the standard analysis"
   - Adjust depth based on user interest
   </checkpoint_2>

10. **CRITICAL EVALUATION**
   <evaluation_criteria>
   - Assess completeness: What aspects of the topic are well-covered vs. gaps?
   - Evaluate reliability: Which sources are most authoritative?
   - Identify biases: What perspectives might be over or under-represented?
   - Consider currency: How recent is the information? What might have changed?
   </evaluation_criteria>

11. **OUTPUT SYNTHESIS**
   After analyzing all materials, provide:
   <output_structure>
   a. **Executive Summary** (2-3 paragraphs)
      - Core thesis of the knowledge folder
      - Most critical insights for practical application
      - Key decision factors for implementation
   
   b. **Detailed Findings** organized by:
      - Fundamental Concepts (with clear definitions)
      - Implementation Guidance (with specific examples)
      - Trade-off Analysis (with decision matrices where applicable)
      - Best Practices (with rationale for each)
      - Common Pitfalls (with prevention strategies)
   
   c. **Knowledge Gaps & Uncertainties**
      - Topics that need more research
      - Conflicting information found
      - Questions that remain unanswered
   
   d. **Actionable Recommendations**
      - Immediate applications of this knowledge
      - Suggested next steps for deeper learning
      - Related topics worth exploring
   </output_structure>

12. **MULTI-FOLDER HANDLING**
   <multi_folder_output>
   If processing multiple folders:
   - Provide complete analysis for each folder separately
   - Use clear section headers: "=== Analysis: [folder name] ==="
   - After all individual analyses, provide a brief synthesis section noting:
     * Common themes across folders
     * Complementary insights between topics
     * Potential integration points
   - Keep each folder's analysis self-contained for easy reference
   </multi_folder_output>
</instructions>

<examples>
<example>
Input: Folder contains multiple documents about API design patterns
Analysis approach: Start with API-design-principles.md, then move to REST-vs-GraphQL-comparison.md, followed by case-study-stripe-api.md
Synthesis: "The materials reveal three dominant API design philosophies: REST for resource-based systems, GraphQL for complex data relationships, and RPC for action-oriented services. Key insight: The 'best' approach depends heavily on client needs rather than technical superiority."
</example>

<example>
Input: Folder contains research on distributed systems consensus algorithms
Analysis approach: Begin with consensus-overview.md, study raft-explained.md and paxos-simplified.md, then examine real-world-implementations.md
Synthesis: "While Paxos is theoretically optimal, Raft's understandability makes it preferred for new implementations. Critical trade-off: Byzantine fault tolerance adds 3x complexity for marginal benefit in trusted environments."
</example>
<example>
Input: "api-design,microservices" (comma-separated folders)
Process: 
1. Analyze api-design folder completely
2. Analyze microservices folder completely  
3. Provide synthesis noting how API design principles apply in microservices architecture
Output structure: Two complete analyses with "=== Analysis: api-design ===" and "=== Analysis: microservices ===" headers, followed by integration insights
</example>
</examples>

<thinking_directive>
Please think deeply about the materials as you analyze them. Consider multiple perspectives, challenge assumptions in the documents, and look for non-obvious connections between concepts. Your thinking should explore why certain approaches are recommended, not just what is recommended.
</thinking_directive>

<error_handling>
If you encounter any of these situations:
- Folder not found: List available folders and suggest alternatives
- Contradictory information: Document all viewpoints and explain the contradiction
- Incomplete materials: Note what's missing and work with what's available
- Technical errors: Explain the issue and attempt alternative approaches

IMPORTANT: If you lack sufficient information to draw a conclusion, explicitly state "I don't have enough information to determine..." rather than making assumptions.
</error_handling>

<quality_checklist>
Before completing your analysis, verify:
☐ All documents in the folder have been read and analyzed
☐ Key concepts are defined clearly with examples
☐ Trade-offs are explained with specific scenarios
☐ Practical applications are identified
☐ Knowledge gaps are documented
☐ Synthesis connects insights across multiple documents
☐ Recommendations are specific and actionable
</quality_checklist>

Remember: Your goal is to become the user's expert consultant on this topic. The depth and quality of your analysis now will directly impact your ability to provide valuable assistance in future conversations.
EOF