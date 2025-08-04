# TDD Workflow Guide for Go-Labs Project

## 📋 Table of Contents
1. [What Is This Workflow?](#what-is-this-workflow)
2. [Files Created for This Setup](#files-created-for-this-setup)
3. [How to Use This Workflow](#how-to-use-this-workflow)
4. [Complete Example: Get Client by ID](#complete-example-get-client-by-id)
5. [Command Reference](#command-reference)
6. [Common Scenarios](#common-scenarios)
7. [FAQ](#faq)

## What Is This Workflow?

This is a **Test-Driven Development (TDD)** workflow with **mandatory planning phases** designed to:
- ✅ Prevent overengineering and scope creep
- ✅ Ensure high-quality, well-tested code
- ✅ Create clear requirements before coding
- ✅ Enforce a disciplined development process

### The Core Process
```
SYNC → Requirements → Explore → Plan → STOP → Test → Code → Refactor → Commit & PR
 ↑                                       ↑
 └─ Latest Main Branch                   └─ Human Review Required!
```

## Files Created for This Setup

```
/home/gaetan/Projects/go-labs/
├── CLAUDE.md                           # ✅ UPDATED: Added TDD workflow rules
├── .claude/                            # ✅ NEW: TDD workflow directory
│   ├── commands/                       # Slash commands for each phase
│   │   ├── explore-feature.md         # Research without coding
│   │   ├── plan-feature.md            # Create plan (mandatory stop)
│   │   ├── sync-with-main.md          # Sync to latest main branch
│   │   ├── requirements-spec.md       # Define precise requirements
│   │   ├── scope-check.md             # Prevent overengineering
│   │   ├── test-first.md              # Write failing tests (TDD Red)
│   │   ├── implement-minimal.md       # Minimal code (TDD Green)
│   │   └── commit-and-create-pr.md    # Automated Git workflow & PR
│   ├── templates/                      # Reusable templates
│   │   ├── requirement-template.md    # Standard requirement format
│   │   ├── tdd-cycle-template.md      # Track TDD cycles
│   │   └── commit-message-template.md # Standardized commit format
│   └── README-TDD-WORKFLOW.md         # This guide
└── billing-api/
    ├── CLAUDE.md                      # ✅ NEW: Billing-specific context
    └── .github/
        └── pull_request_template.md   # ✅ NEW: PR template with TDD checklist

Total: 14 files (1 updated, 13 new)
```

## How to Use This Workflow

### 🚀 Starting a New Feature

#### Step 0: Sync with Main Branch (MANDATORY)
```
You: /sync-with-main
Claude: [Checks current branch, fetches latest, switches to main, pulls updates]
Claude: ✅ Ready for feature development on latest main branch
```

**What happens:**
- Validates current working directory is clean
- Fetches latest changes from remote repository
- Switches to main branch and pulls latest updates
- Confirms ready to start feature development

**Why this matters:**
- Ensures discovery uses latest architectural patterns
- Prevents merge conflicts during PR creation
- Guarantees working with current domain models
- Maintains clean, professional git history

#### Step 1: Define Requirements
```
You: /requirements-spec
Claude: [Shows requirement template]
You: [Fill out the template with precise requirements]
```

**Example:**
```markdown
# Feature Requirement: Get Client by ID

## Goal
Retrieve a single client's information by their unique ID

## Acceptance Criteria
- [ ] GIVEN valid client ID WHEN GetClient called THEN return client data
- [ ] GIVEN non-existent ID WHEN GetClient called THEN return NotFound error
- [ ] GIVEN invalid ID format WHEN GetClient called THEN return BadRequest error
```

#### Step 2: Explore the Codebase
```
You: /explore-feature Get Client by ID
Claude: [Validates main branch sync, then researches existing code, patterns, integration points]
```

Claude will analyze but NOT write any code. Output includes:
- Verification of main branch sync status
- Current patterns to follow (latest versions)
- Integration points identified
- Recent architectural changes that affect this feature
- Potential challenges

#### Step 3: Create a Plan
```
You: /plan-feature
Claude: [Creates detailed implementation plan]
Claude: 🛑 STOP - AWAITING APPROVAL
```

The plan includes:
- TDD cycles broken down
- Test scenarios for each cycle
- Minimal implementation approach
- What's OUT of scope

#### Step 4: The Approval Gate 🛑

**YOU MUST EXPLICITLY APPROVE THE PLAN!**

Options:
- ✅ `Approved` - Continue to implementation
- 🔄 `Revise: [specific changes]` - Adjust the plan
- ❌ `Reject` - Cancel and start over

#### Step 5: Write Tests First (Red Phase)
```
You: Approved
You: /test-first
Claude: [Writes failing tests only]
```

Output:
- Test files created
- All tests failing (as expected)
- No implementation code

#### Step 6: Implement Minimal Code (Green Phase)
```
You: /implement-minimal
Claude: [Writes just enough code to pass tests]
```

Rules:
- Only code to make tests pass
- No extra features
- Stop when tests are green

#### Step 7: Refactor (Blue Phase)
```
You: Tests are passing. Any refactoring needed?
Claude: [Suggests improvements while keeping tests green]
```

### Step 8: Commit & Push (Automation Phase)
```
You: /commit-and-create-pr
Claude: [Creates feature branch, commits with standard message, pushes to remote]
```

### Step 9: Create Pull Request (Review Phase)
```
Claude: [Automatically creates PR with comprehensive description and requests review]
```

## Complete Example: Get Client by ID

### 0️⃣ Sync Phase
```
You: /sync-with-main
```

Claude ensures we're working from latest main:
```markdown
## Git Sync Status Report

### Pre-Sync State
- Previous branch: feature/some-old-feature
- Uncommitted changes: No
- Remote status: Connected

### Sync Operations Performed
- ✅ Fetched latest changes from origin
- ✅ Switched to main branch
- ✅ Pulled latest main branch updates
- ✅ Verified main is up-to-date

### Current State
- Current branch: main
- Latest commit: c447d6a - Revert "Remove test payment_processor.go file"
- Working directory: Clean
- Ready for feature development: ✅
```

### 1️⃣ Requirements Phase
```
You: /requirements-spec
```

Claude helps fill out:
```markdown
# Feature Requirement: Get Client by ID

## Goal
Retrieve a single client by their unique identifier

## Acceptance Criteria
- [ ] GIVEN existing client ID WHEN GetClient called THEN return client data
- [ ] GIVEN non-existent ID WHEN GetClient called THEN return ErrClientNotFound
- [ ] GIVEN malformed ID WHEN GetClient called THEN return validation error

## Scope Constraints
- Maximum implementation time: 3 hours
- Maximum files to modify: 5 files

## Anti-Requirements
- ❌ No caching
- ❌ No batch operations
```

### 2️⃣ Explore Phase
```
You: /explore-feature Get Client by ID
```

Claude responds:
```markdown
## Feature Exploration: Get Client by ID

### Pre-Exploration Validation
- ✅ Current branch: main
- ✅ Up-to-date with origin/main
- ✅ Working directory clean
- ✅ Latest codebase patterns available

### Current State Analysis
- Repository interface: internal/domain/repository/client_repository.go
- Similar pattern: CreateClient in internal/application/billing_service.go
- HTTP handler pattern: internal/api/http/handlers/client_handler.go
- Latest architectural decisions: Recent ListAll implementation patterns

### Integration Points
- Need to add GetByID to ClientRepository interface
- Need to add GetClient to BillingService
- Need to add GET /api/v1/clients/:id route
```

### 3️⃣ Plan Phase
```
You: /plan-feature
```

Claude creates plan and **STOPS**:
```markdown
# Implementation Plan: Get Client by ID

## TDD Cycles

### Cycle 1: Repository Layer
**Red Phase - Tests:**
1. Test_ClientRepository_GetByID_Success
2. Test_ClientRepository_GetByID_NotFound

**Green Phase:**
- Add GetByID(ctx, id string) (*entity.Client, error) to interface
- Implement in PostgreSQL repository

### Cycle 2: Service Layer
[... more cycles ...]

## 🛑 STOP - AWAITING APPROVAL
Reply with: "Approved" or "Revise: [changes]"
```

### 4️⃣ Approval
```
You: Approved
```

### 5️⃣ Test Phase
```
You: /test-first
```

Claude writes tests:
```go
func Test_ClientRepository_GetByID_Success(t *testing.T) {
    // Arrange
    repo := NewTestRepository()
    client := createTestClient()
    repo.Save(client)
    
    // Act
    result, err := repo.GetByID(context.Background(), client.ID())
    
    // Assert
    assert.NoError(t, err)
    assert.Equal(t, client.ID(), result.ID())
}
```

### 6️⃣ Implementation Phase
```
You: /implement-minimal
```

Claude implements minimal code:
```go
func (r *ClientRepository) GetByID(ctx context.Context, id string) (*entity.Client, error) {
    var client models.Client
    err := r.db.Where("id = ?", id).First(&client).Error
    if err == gorm.ErrRecordNotFound {
        return nil, errors.ErrClientNotFound
    }
    if err != nil {
        return nil, err
    }
    return client.ToDomain()
}
```

### 7️⃣ Git Workflow & PR Creation Phase
```
You: /commit-and-create-pr
```

Claude automates the complete Git workflow:
1. **Validation**: Ensures all tests pass with ≥95% coverage
2. **Branch Creation**: Creates `feature/get-client-by-id` branch
3. **Commit**: Standardized commit message with TDD documentation
4. **Push**: Pushes to remote with upstream tracking
5. **PR Creation**: Comprehensive pull request with detailed description
6. **Review Request**: Automatically requests code review

**Automated PR Description includes:**
- TDD workflow completion checklist
- Implementation summary and technical changes
- Test coverage details and validation
- Architecture compliance verification
- Review guidelines for team members

## Command Reference

| Command | Purpose | When to Use |
|---------|---------|-------------|
| `/sync-with-main` | Sync to latest main branch | **MANDATORY FIRST STEP** |
| `/requirements-spec` | Create precise requirements | After sync, starting any new feature |
| `/explore-feature` | Research without coding | After requirements defined |
| `/plan-feature` | Create implementation plan | After exploration |
| `/scope-check` | Validate against overengineering | When plan seems complex |
| `/test-first` | Write failing tests | After plan approved |
| `/implement-minimal` | Write minimal code | After tests written |
| `/commit-and-create-pr` | Automated Git workflow + PR | After all tests passing |

## Common Scenarios

### Scenario: "The plan seems too complex"
```
You: /scope-check
Claude: [Analyzes complexity and suggests simplifications]
```

### Scenario: "I want to add extra features"
```
You: Can we also add caching while we're at it?
Claude: ❌ This violates our Anti-Requirements. Caching was explicitly marked as out of scope.
```

### Scenario: "Tests are failing for wrong reason"
```
You: The tests are failing but with a different error
Claude: [Fixes test setup to fail for the right reason]
```

### Scenario: "Want to skip sync and start immediately"
```
You: /explore-feature Get Client by ID
Claude: ❌ STOP! Must sync with main branch first. Run /sync-with-main
```

### Scenario: "Want to skip planning"
```
You: Just implement GetClient without the planning phase
Claude: ❌ STOP! The TDD workflow requires planning. Let's start with /sync-with-main then /requirements-spec
```

### Scenario: "Ready to commit and create PR"
```
You: /commit-and-create-pr
Claude: [Validates tests, creates feature branch, commits, pushes, creates PR]
Claude: ✅ Feature successfully committed and PR created!
Claude: 🔗 PR URL: https://github.com/user/repo/pull/123
```

### Scenario: "Integration tests seem slow"
```
You: Why are integration tests taking longer?
Claude: Integration tests use PostgreSQL with automatic cleanup between runs.
        This ensures test isolation but takes more time than in-memory tests.
        Use 'make test-unit' for fast feedback during development.
```

## FAQ

### Q: What if I want to skip the sync phase?
**A:** You can't skip syncing! The `/explore-feature` command validates you're on the latest main branch. Claude will refuse to proceed without proper sync.

### Q: What if I want to skip the planning phase?
**A:** You can't! The workflow is designed to enforce planning. Claude will refuse to write code without an approved plan.

### Q: What if the plan is too complex?
**A:** Use `/scope-check` to validate. Claude will identify overengineering and suggest simplifications.

### Q: Can I modify requirements mid-implementation?
**A:** Yes, but you need to go back to the planning phase. Requirements changes = new plan = new approval.

### Q: What if I don't agree with the plan?
**A:** Use "Revise: [specific changes]" to request adjustments. Be specific about what needs to change.

### Q: How strict is the "minimal implementation" rule?
**A:** Very strict! If a test doesn't require it, don't implement it. You can always add more in future cycles.

### Q: Can I write tests and implementation together?
**A:** No! Tests must be written first and fail before any implementation. This is core to TDD.

### Q: What about refactoring?
**A:** Refactoring happens AFTER tests are green. Never refactor with failing tests.

### Q: What happens during the commit and PR creation phase?
**A:** The `/commit-and-create-pr` command validates all tests pass, creates a feature branch, commits with a standardized message, pushes to remote, and creates a comprehensive PR with TDD documentation.

### Q: Can I commit manually instead of using the automated command?
**A:** While possible, using `/commit-and-create-pr` ensures consistency, proper documentation, and adherence to the established workflow standards.

### Q: How does database cleanup work in integration tests?
**A:** Integration tests use `testhelpers.NewIntegrationTestServer()` which automatically cleans the PostgreSQL test database between runs using DELETE operations. This ensures test isolation without requiring superuser permissions.

### Q: Can I use PostgreSQL for unit tests to be more realistic?
**A:** No! Unit tests MUST use in-memory storage for speed and isolation. Integration tests handle database realism. This separation is enforced by the testing strategy.

## Tips for Success

1. **Always sync first** - `/sync-with-main` prevents conflicts and ensures latest patterns
2. **Keep requirements small** - Smaller features = faster cycles
3. **Be specific in requirements** - Ambiguity leads to overengineering
4. **Trust the process** - The stops and gates prevent problems
5. **Use anti-requirements** - Explicitly state what NOT to build
6. **Check scope regularly** - Use `/scope-check` when in doubt
7. **Use automated Git workflow** - `/commit-and-create-pr` ensures consistency and proper documentation
8. **Follow testing strategy** - Unit tests = memory, Integration tests = PostgreSQL with cleanup

## Quick Start Checklist

- [ ] Read this guide completely
- [ ] **START WITH** `/sync-with-main` for every new feature
- [ ] Understand the approval gates
- [ ] Try a simple feature first
- [ ] Use the templates provided
- [ ] Don't skip steps!
- [ ] Use `/commit-and-create-pr` for consistent Git workflow

---

## Need Help?

- Check command files in `.claude/commands/` for detailed usage
- Review templates in `.claude/templates/` for examples
- Use `.github/pull_request_template.md` for PR formatting guidance
- Read `docs/TEST_STRATEGY.md` for testing strategy details
- The workflow is designed to guide you - trust it!

Remember: **This workflow is about discipline, not speed.** Better to build the right thing slowly than the wrong thing quickly.

Happy TDD coding! 🚀