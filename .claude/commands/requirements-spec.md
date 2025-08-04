# Requirements Specification Command

## Purpose
Create extremely precise, testable requirements that prevent scope creep and overengineering. This ensures everyone understands EXACTLY what will be built.

## Prerequisites
**⚠️ RECOMMENDED**: Run `/sync-with-main` first to ensure requirements are defined against the latest codebase.

### Why Sync First?
- Requirements should reference latest architectural patterns
- Technical constraints based on current domain models
- Scope constraints reflect latest project conventions
- Anti-requirements avoid recently deprecated approaches

**Note**: While not strictly enforced for requirements definition, syncing ensures your requirements align with the current state of the project.

## What I Will Do
1. **Use the requirement template** from `.claude/templates/requirement-template.md`
2. **Define clear acceptance criteria** using Given-When-Then format
3. **Set explicit technical constraints**
4. **List anti-requirements** (what NOT to build)
5. **Create measurable Definition of Done**

## Template Structure to Follow
```markdown
# Feature Requirement: [FEATURE NAME]

## Goal
[One clear sentence - what problem does this solve?]

## User Story
As a [user type]
I want to [action]
So that [benefit]

## Acceptance Criteria
- [ ] GIVEN [context] WHEN [action] THEN [outcome]
- [ ] GIVEN [context] WHEN [action] THEN [outcome]
- [ ] GIVEN [edge case] WHEN [action] THEN [error handling]

## Technical Constraints
- MUST use existing [pattern/interface]
- MUST follow [project convention]
- MUST complete within [time limit]
- MUST NOT add external dependencies

## Scope Constraints
- Maximum implementation time: [X hours]
- Maximum files to modify: [X files]
- Maximum new methods: [X methods]

## Anti-Requirements (DO NOT IMPLEMENT)
- ❌ [Feature we're explicitly NOT building]
- ❌ [Optimization we're NOT doing]
- ❌ [Future feature we're deferring]

## Definition of Done
- [ ] All acceptance criteria passing
- [ ] Test coverage ≥ 95% for new code
- [ ] No TODO comments in production code
- [ ] Integration tests passing
- [ ] Code follows project conventions
```

## Best Practices
- Be EXTREMELY specific - ambiguity leads to overengineering
- Include error cases in acceptance criteria
- Anti-requirements are as important as requirements
- Keep scope small - can always add more later
- Focus on WHAT, not HOW

## Usage
```
Recommended workflow:
1. /sync-with-main          # Sync to latest main branch
2. /requirements-spec       # Define requirements (this command)
3. /explore-feature         # Research implementation approach
```

Type: `/requirements-spec` when starting a new feature