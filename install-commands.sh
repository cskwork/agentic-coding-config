# Create a personal command
mkdir -p ~/.claude/commands

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