# Claude Code TDD Workflow Memory

## 🚨 MANDATORY TDD WORKFLOW - NO EXCEPTIONS 🚨

### Workflow Enforcement
**YOU MUST FOLLOW THIS EXACT SEQUENCE:**
1. **SYNC** → Pull latest main branch
2. **EXPLORE** → Research and understand requirements (READ-ONLY - no code)
3. **PLAN** → Create detailed implementation plan with test scenarios
4. **STOP** → MANDATORY pause - present plan for human review/approval
5. **TEST-FIRST** → Write failing tests first (Red phase)
6. **IMPLEMENT-MINIMAL** → Write minimal code to pass tests (Green phase)
7. **REFACTOR** → Improve code quality while keeping tests green
8. **COMMIT & CREATE PR** → Feature branch, commit, push to remote
9. **CLAUDE GITHUB REVIEW LOOP** → Iterative collaborative review with approval gates
10. **MERGE** → User-approved merge to main branch

**⛔ BREAKING THESE RULES = IMMEDIATE STOP**

### Anti-Pattern Prevention
- **NO** production code without failing tests first
- **NO** implementing features not covered by tests
- **NO** skipping the planning phase - EVER
- **NO** implementing beyond the requirements (YAGNI)
- **NO** continuing after PLAN without explicit approval
- **NO** committing without proper feature branch and descriptive message
- **NO** manual PR creation - always use automated workflow
- **NO** auto-merging without explicit user permission
- **ALWAYS** use scope constraints in requirements
- **ALWAYS** check against overengineering
- **ALWAYS** create feature branch named `feature/[feature-name-kebab-case]`
- **ALWAYS** push to remote after successful implementation
- **ALWAYS** create PR immediately after successful push with comprehensive description
- **ALWAYS** wait for Claude GitHub review before asking for merge approval
- **ALWAYS** work in iterative loop with Claude GitHub until no recommendations OR user rejects fixes

### Testing Standards
- Test files MUST end with `_test.go` (Go projects) or appropriate extension for other languages
- Use table-driven tests for multiple scenarios
- Unit tests: In-memory storage only for fast feedback
- Integration tests: Real database/external services with automatic cleanup
- Minimum 95% test coverage for new code
- Business descriptions mandatory for all integration tests
- Mock interfaces, not concrete types
- Use `t.Run()` for subtests with descriptive names

### Available Commands
The following workflow commands are available in `.claude/commands/`:
- `/sync-with-main` - Synchronize with latest main branch
- `/explore-feature` - Research phase without writing code
- `/plan-feature` - Create implementation plan (triggers mandatory stop)
- `/requirements-spec` - Define precise requirements with scope constraints
- `/scope-check` - Validate against overengineering
- `/test-first` - Write failing tests (TDD Red phase)
- `/implement-minimal` - Write minimal passing code (TDD Green phase)
- `/commit-and-create-pr` - Automated Git workflow and PR creation
- `/analyze-pr-feedback` - Process Claude GitHub review feedback

### Decision Points Requiring User Approval
1. **After PLAN Phase**: "Should I proceed with this implementation plan?"
2. **After Claude GitHub Review**: "Should I implement these suggested improvements?"
3. **Before MERGE**: "Should I merge the PR to main branch?"

### User Decision Options
**At Planning**:
- ✅ "Yes, proceed" → Continue to implementation
- ❌ "Modify the plan" → Revise and re-present
- ⏸️ "Not now" → Stop workflow

**At Review**:
- ✅ "Apply improvements" → Implement suggestions → Continue review loop
- ❌ "Skip improvements" → Ask for merge approval
- 🔄 "Apply some only" → Specify which ones to implement

**At Merge**:
- ✅ "Yes, merge" → Merge to main, delete feature branch
- ❌ "Not ready" → Leave PR open, workflow paused

### Quality Gates
- All tests must pass before proceeding to next phase
- No overengineering beyond stated requirements
- Proper git workflow with descriptive commits
- Comprehensive PR documentation with TDD checklist
- Architecture compliance validation
- Error handling with structured domain errors

### Architecture Standards (Language-Agnostic)
- **Clean Architecture**: Proper layer separation with dependency inversion
- **Domain-Driven Design**: Rich domain models with business logic encapsulation
- **Repository Pattern**: Interface-based data access abstraction
- **Dependency Injection**: Constructor injection for all dependencies
- **Error Handling**: Structured error types with context preservation
- **API Design**: RESTful principles with proper HTTP status codes

### Detailed Documentation
- **Comprehensive Workflow Guide**: `.claude/COMPLETE_WORKFLOW_GUIDE.md`
- **TDD Implementation Guide**: `.claude/README-TDD-WORKFLOW.md`
- **Execution Guide**: `.claude/WORKFLOW_EXECUTION_GUIDE.md`

### Project-Specific Memory Hierarchy
This file contains the **generic workflow rules** that apply to all projects using this TDD methodology.

Project-specific context and memory is maintained in subdirectories:
- **Platform documentation**: `platform-docs/CLAUDE.md` - Platform-wide memory and context
- **Service-specific**: `services/*/CLAUDE.md` - Individual service/microservice contexts
- **Module-specific**: `modules/*/CLAUDE.md` - Individual module contexts

Each level inherits from parent levels, creating a memory hierarchy:
```
Root CLAUDE.md (this file - workflow rules)
  └── platform-docs/CLAUDE.md (platform context)
      └── services/billing-api/CLAUDE.md (service context)
```

### Reusable Workflow Template
This TDD workflow methodology is available as a reusable template at:
https://github.com/Gaetan-Jaminon/Claude-Workflow-TDD

To use this workflow in other projects:
1. Clone the workflow repository
2. Copy `.claude/` directory to your project
3. Create a root CLAUDE.md with this workflow definition
4. Add project-specific CLAUDE.md files in subdirectories
5. Configure Claude Code to use the workflow commands

### Success Indicators
✅ **Successful TDD Implementation**: All tests written before production code
✅ **Successful Claude GitHub Integration**: Iterative improvements with user control
✅ **Successful Architecture Compliance**: Clean separation and proper patterns
✅ **Successful Quality Gates**: All tests passing with high coverage
✅ **Successful Workflow Completion**: Feature delivered and merged to main

---

**This workflow ensures disciplined development with collaborative decision-making at every critical juncture.**

*Workflow Version: 1.0 - Complete TDD + Testing + Claude GitHub Review Integration*