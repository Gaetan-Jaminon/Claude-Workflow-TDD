# Complete Development Workflow Guide
**Go-Labs Project - TDD + Testing Strategy + Claude GitHub Review Integration**

---

## 📋 Table of Contents
1. [Overview & Philosophy](#overview--philosophy)
2. [Core Workflow Phases](#core-workflow-phases)
3. [Testing Strategy Integration](#testing-strategy-integration)
4. [Claude GitHub Review Loop](#claude-github-review-loop)
5. [Quality Standards & Anti-Patterns](#quality-standards--anti-patterns)
6. [Command Reference](#command-reference)
7. [Complete Workflow Examples](#complete-workflow-examples)
8. [Troubleshooting & FAQ](#troubleshooting--faq)

---

## Overview & Philosophy

### 🎯 **Core Mission**
This workflow enforces **disciplined Test-Driven Development (TDD)** with **comprehensive testing strategies** and **collaborative AI review integration** to deliver production-ready Go code following Clean Architecture and Domain-Driven Design principles.

### 🚨 **MANDATORY WORKFLOW - NO EXCEPTIONS**
**YOU MUST FOLLOW THIS EXACT SEQUENCE:**
1. **SYNC** → Pull latest main branch
2. **EXPLORE** → Research and understand requirements (READ-ONLY - no code)
3. **PLAN** → Create detailed implementation plan with test scenarios
4. **STOP** → MANDATORY pause - present plan for human review/approval
5. **TEST-FIRST** → Write failing tests first (Red phase)
6. **IMPLEMENT-MINIMAL** → Write minimal code to pass tests (Green phase)  
7. **REFACTOR** → Improve code quality while keeping tests green
8. **COMMIT & CREATE PR** → Create feature branch, commit, push, create PR
9. **CLAUDE GITHUB REVIEW LOOP** → Iterative collaborative review with approval gates
10. **MERGE** → User-approved merge to main branch

**⛔ BREAKING THESE RULES = IMMEDIATE STOP**

### 🏗️ **Architecture Integration**
- **Clean Architecture**: Domain → Application → Infrastructure → API layers
- **Domain-Driven Design**: Rich domain models, value objects, repository pattern
- **Dependency Injection**: Interface-based design with proper inversion
- **Storage Abstraction**: In-memory (tests) and PostgreSQL (integration) backends

---

## Core Workflow Phases

### **Phase 1: Preparation & Planning**

#### **🔄 SYNC - Pull Latest Main Branch**
```bash
git checkout main
git pull origin main
```
**Purpose**: Ensure clean starting point with latest production code

#### **🔍 EXPLORE - Research Requirements (READ-ONLY)**
**Available Command**: `/explore-feature`

**What to do:**
- Research existing codebase patterns
- Understand domain model and architecture  
- Identify integration points and dependencies
- **NO CODE WRITING** - research only

**Deliverables:**
- Clear understanding of requirements
- Architecture impact analysis
- Integration point identification

#### **📋 PLAN - Create Implementation Plan**
**Available Command**: `/plan-feature`

**What to do:**
- Create detailed test scenarios (unit + integration)
- Define API contracts and DTOs
- Plan database schema changes (if needed)
- Estimate complexity and identify risks

**Deliverables:**
- Comprehensive implementation plan
- Test scenario descriptions
- **MANDATORY STOP** - Wait for human approval before proceeding

### **Phase 2: Test-Driven Development**

#### **🔴 TEST-FIRST - Write Failing Tests (Red Phase)**
**Available Command**: `/test-first`

**Unit Tests Strategy:**
- Use **in-memory storage** for fast, isolated testing
- Test business logic and domain rules
- External test data in JSON files (`tests/testdata/`)
- Business descriptions for stakeholder reporting

**Integration Tests Strategy:**  
- Use **local PostgreSQL** for real database interactions
- Test complete request/response cycles
- Automatic test data cleanup (DELETE operations)
- Test migration behavior and constraints

**Requirements:**
- All tests must **FAIL** initially (Red phase)
- Comprehensive test coverage planned
- Business-friendly test descriptions included

#### **🟢 IMPLEMENT-MINIMAL - Write Passing Code (Green Phase)**
**Available Command**: `/implement-minimal`

**Principles:**
- Write **minimum code** to make tests pass
- Follow existing patterns and conventions
- Maintain Clean Architecture layer separation
- Use standard libraries (avoid custom implementations)

**Quality Gates:**
- All tests must pass (Green phase)
- No overengineering or extra features
- Proper error handling with domain error types

#### **🔄 REFACTOR - Improve Code Quality**

**Focus Areas:**
- Code clarity and maintainability
- Performance optimizations
- Error handling improvements
- Architecture compliance validation

**Requirements:**
- All tests must remain green during refactoring
- No functional changes - only quality improvements
- Follow Go best practices and project conventions

### **Phase 3: Collaborative Review & Integration**

#### **📦 COMMIT & CREATE PR**
**Available Command**: `/commit-and-create-pr`

**Git Workflow:**
```bash
git checkout -b feature/[feature-name-kebab-case]
git add .
git commit -m "[Comprehensive commit message]"
git push -u origin feature/[feature-name-kebab-case]
gh pr create --title "..." --body "..."
```

**PR Requirements:**
- Feature branch with kebab-case naming
- Comprehensive commit message with TDD documentation
- Detailed PR description with implementation summary
- Test coverage report and quality metrics
- Ready for Claude GitHub review

#### **🤖 CLAUDE GITHUB REVIEW LOOP**
**Available Command**: `/analyze-pr-feedback`

**Review Loop Process:**
```
1. Push Code → Claude GitHub Review
2. Fetch Review Feedback → Plan Improvements  
3. Ask User Approval → "Should I implement [X, Y, Z]?"
4. User Decision:
   ├── YES → Apply Improvements → Push → LOOP back to step 1
   ├── NO → Ask "Should I merge PR without these changes?"
   └── If no recommendations → Ask "Should I merge the PR?"
```

**Two Exit Conditions Only:**
1. **Claude GitHub has no recommendations** → Ask user for merge approval
2. **User rejects improvements** → Ask user for merge approval

**User Approval Gates:**
- **Never auto-merge** - always ask for explicit permission
- Present improvements as options requiring user decision
- Respect user choice to accept/reject suggestions
- Clear merge decision prompts

#### **🔀 MERGE - User-Controlled Integration**

**Merge Decision Flow:**
```
Claude GitHub Review Complete →
├── No Recommendations → "Should I merge the PR?" → User Decision
└── Has Recommendations → "Should I implement X, Y, Z?" →
    ├── User: YES → Apply → Push → Loop back to review
    └── User: NO → "Should I merge without these changes?" → User Decision
```

**Merge Options:**
- **Squash and Merge** (recommended): Clean single commit on main
- **Merge Commit**: Preserves individual commit history  
- **Rebase and Merge**: Linear history without merge commit

**Post-Merge Cleanup:**
- Delete feature branch (local and remote)
- Switch back to main branch
- Pull latest changes to verify merge

---

## Testing Strategy Integration

### **🧪 Unit Tests - In-Memory Storage**

**Location**: `tests/unit/`  
**Storage**: In-memory storage only  
**Command**: `make test-unit`  
**Speed**: Very fast (< 1 second)

**Characteristics:**
- Test individual components in isolation
- Test domain logic and business rules  
- Test service methods and validation
- No external dependencies
- Perfect for TDD Red-Green-Refactor cycles

**Standards:**
- Test files must end with `_test.go`
- Use table-driven tests for multiple scenarios
- Prefer `testify/assert` and `testify/require` for assertions
- Use `t.Run()` for subtests
- Business descriptions for all test scenarios

### **🔗 Integration Tests - PostgreSQL Storage**

**Location**: `tests/integration/`  
**Storage**: Local PostgreSQL only  
**Command**: `make test-integration`  
**Database**: Uses test database with automatic cleanup

**Characteristics:**
- Test component interactions with real database
- Test complete API endpoints with real storage
- Verify database migrations and constraints
- Test business workflows end-to-end

**Test Data Isolation System:**
```
Integration Test Start
    ↓
Clean Database (DELETE operations)
    ↓  
Run Test Logic
    ↓
Clean Database (DELETE operations)
    ↓
Test Complete
```

**Cleanup Strategy:**
- **Secure**: Works with application user permissions
- **Fast**: Efficient DELETE operations for test volumes
- **Safe**: Respects foreign key constraints
- **Reliable**: No special database permissions needed

### **📊 Business Coverage Reporting**

**Command**: `make test-integration-report`

**Features:**
- Non-technical test descriptions for stakeholders
- Business value explanations for each test scenario
- HTML and Markdown report generation
- User story mapping for test coverage
- Stakeholder-friendly test documentation

---

## Claude GitHub Review Loop

### **🔄 Iterative Review Process**

The Claude GitHub review process is designed as an **iterative improvement loop** that continues until either:
1. Claude GitHub has no more recommendations
2. User decides to stop accepting improvements

### **Review Round Structure**

#### **Round 1: Initial Review**
```
Create PR → Wait for Claude GitHub → Fetch Review → Plan Improvements → Ask User
```

**Typical Round 1 Issues:**
- UUID validation improvements
- Error handling enhancements  
- HTTP status code mapping
- Input validation strengthening

#### **Round 2+: Iterative Improvements**
```
Apply Round N Improvements → Push → Claude GitHub Review → Plan New Improvements → Ask User
```

**Common Later Round Issues:**
- Performance optimizations
- Observability and monitoring hooks
- Future scalability considerations
- Code style and maintainability

### **User Decision Points**

#### **After Each Review Round:**
```
Claude GitHub: "Suggests [X, Y, Z improvements]"
Me: "Should I implement these improvements?"
User Options:
├── "Yes" → Apply improvements → Push → Continue loop
├── "No" → "Should I merge PR without these changes?" → User decides
└── If no recommendations → "Should I merge the PR?" → User decides
```

#### **Merge Decision Gates:**
- **Never auto-merge** regardless of PR approval status
- Always present clear merge options to user
- Respect user timeline and quality preferences
- Allow flexible workflow endings based on user needs

### **Quality Benefits of Review Loop**

✅ **Iterative Quality Improvement**: Code gets progressively better through multiple review cycles  
✅ **Learning Opportunities**: Each review provides education on Go best practices  
✅ **Production Readiness**: Multiple AI perspectives ensure code quality  
✅ **User Control**: User maintains full control over quality vs. speed tradeoffs  

---

## Quality Standards & Anti-Patterns

### **🚨 Anti-Pattern Prevention**

**Forbidden Actions:**
- ❌ **NO** production code without failing tests first
- ❌ **NO** implementing features not covered by tests  
- ❌ **NO** skipping the planning phase - EVER
- ❌ **NO** implementing beyond the requirements (YAGNI)
- ❌ **NO** continuing after PLAN without explicit approval
- ❌ **NO** committing without proper feature branch and descriptive message
- ❌ **NO** manual PR creation - always use automated workflow
- ❌ **NO** auto-merging without explicit user permission

**Required Actions:**
- ✅ **ALWAYS** use scope constraints in requirements
- ✅ **ALWAYS** check against overengineering
- ✅ **ALWAYS** create feature branch named `feature/[feature-name-kebab-case]`
- ✅ **ALWAYS** push to remote after successful implementation  
- ✅ **ALWAYS** create PR immediately after successful push
- ✅ **ALWAYS** wait for user approval before merging

### **📏 Go-Specific Testing Standards**

**Test Organization:**
- Test files MUST end with `_test.go`
- Unit tests go in same package, integration tests in `_test` package
- External test data in `tests/testdata/` directory
- Use `runtime.Caller()` for reliable path resolution

**Test Implementation:**  
- Use table-driven tests for multiple scenarios
- Prefer `testify/assert` and `testify/require` for assertions
- Use `t.Run()` for subtests with descriptive names
- Mock interfaces, not concrete types
- Minimum 95% test coverage for new code

**Business Test Documentation:**
- Include business descriptions for all integration tests
- Map test scenarios to user stories
- Provide stakeholder-friendly explanations
- Generate coverage reports for non-technical audiences

### **🏗️ Architecture Compliance**

**Clean Architecture Layers:**
- **Domain**: Entities, value objects, business rules (no dependencies)
- **Application**: Use cases, application services (depends on domain only)
- **Infrastructure**: Database, external APIs (implements domain interfaces)  
- **API**: HTTP handlers, DTOs (orchestrates application layer)

**Dependency Rules:**
- Dependencies must flow inward toward domain
- Outer layers can depend on inner layers
- Inner layers cannot depend on outer layers
- Use dependency injection for all external dependencies

**Error Handling Standards:**
- Use structured domain error types
- Separate internal and user-facing error messages
- Proper HTTP status code mapping
- Error context preservation through layers

---

## Command Reference

### **Planning Phase Commands**

#### `/explore-feature`
**Purpose**: Research phase without coding  
**Usage**: Understand requirements and existing architecture  
**Output**: Research summary and integration analysis

#### `/plan-feature`  
**Purpose**: Create detailed implementation plan  
**Usage**: Plan tests, APIs, and database changes  
**Output**: Comprehensive plan requiring human approval

#### `/requirements-spec`
**Purpose**: Define precise requirements with scope constraints  
**Usage**: Convert user stories into technical specifications  
**Output**: Detailed requirements document

#### `/scope-check`
**Purpose**: Validate against overengineering  
**Usage**: Ensure implementation stays within requirements  
**Output**: Scope validation and constraint verification

### **Implementation Phase Commands**

#### `/test-first`
**Purpose**: Write failing tests (TDD Red phase)  
**Usage**: Create comprehensive test coverage before coding  
**Output**: Failing unit and integration tests

#### `/implement-minimal`
**Purpose**: Write minimal passing code (TDD Green phase)  
**Usage**: Implement just enough code to make tests pass  
**Output**: Working implementation with passing tests

### **Integration Phase Commands**

#### `/commit-and-create-pr`
**Purpose**: Create feature branch, commit, and PR  
**Usage**: Automated Git workflow with proper branch naming  
**Output**: Feature branch pushed and PR created

#### `/analyze-pr-feedback`
**Purpose**: Fetch and analyze Claude GitHub review feedback  
**Usage**: Process review comments and plan improvements  
**Output**: Structured improvement plan requiring user approval

---

## Complete Workflow Examples

### **Example 1: Client CRUD Operations (Real Implementation)**

This example shows the complete workflow used to implement Get Client by ID, Update Client, and Delete Client operations.

#### **Phase 1: Preparation**
```
1. SYNC: git checkout main && git pull origin main
2. EXPLORE: Research existing Client entity and repository patterns
3. PLAN: Create detailed plan for 3 CRUD operations with test scenarios
4. STOP: Present plan → User approval: "Yes, proceed"
```

#### **Phase 2: Test-Driven Development**  
```
5. TEST-FIRST: Write failing tests
   - Unit tests: billing_service_get_client_test.go (in-memory storage)  
   - Integration tests: client_repository_crud_test.go (PostgreSQL)
   - External test data: get_client_scenarios.json

6. IMPLEMENT-MINIMAL: Write minimal passing code
   - Extended Storage interface with Delete method
   - Extended Repository interface with GetByID and Delete methods  
   - Implemented UUID validation with google/uuid library
   - Added HTTP handlers with proper DTOs

7. REFACTOR: Improve code quality
   - Enhanced error handling with proper HTTP status mapping
   - Improved phone validation with E.164 standard
   - Added comprehensive error wrapping
```

#### **Phase 3: Collaborative Review**
```  
8. COMMIT & CREATE PR: 
   - Branch: feature/client-crud-operations
   - PR #11: "Complete Client CRUD Operations (UC-B-002, UC-B-003, UC-B-004)"

9. CLAUDE GITHUB REVIEW LOOP:
   Round 1: Claude GitHub → 4 improvement suggestions → User: "Apply all"
   Applied: UUID validation, error handling, HTTP status mapping, phone validation
   
   Round 2: Claude GitHub → "Future enhancement suggestions" → User: "Don't implement"
   
10. MERGE: User approval → "Should I merge without future enhancements?" → "Yes"
    Result: Squash merged to main, feature branch deleted
```

**Outcome**: 3 complete CRUD operations delivered with 20 files (1,851 additions), comprehensive test coverage, and production-ready quality.

### **Example 2: Typical Feature Implementation Pattern**

```
Feature Request: "Add email validation to client creation"

SYNC → Pull latest main
EXPLORE → Research current validation patterns  
PLAN → Plan email validation tests and implementation → STOP for approval
TEST-FIRST → Write failing email validation tests
IMPLEMENT-MINIMAL → Add email validation logic
REFACTOR → Improve validation error messages
COMMIT & CREATE PR → feature/email-validation  
CLAUDE GITHUB REVIEW LOOP → Apply approved improvements
MERGE → User-approved merge to main
```

---

## Troubleshooting & FAQ

### **Common Issues & Solutions**

#### **Q: Tests failing after merge conflict resolution**
**A**: Always run full test suite after resolving conflicts:
```bash
make test-unit && make test-integration
```

#### **Q: Integration tests failing with database connection errors**  
**A**: Verify PostgreSQL setup and test database:
```bash
# Check PostgreSQL status
sudo systemctl status postgresql

# Verify test database exists
psql -h localhost -p 5432 -U billing_app_dev_user -d go-labs-dev
```

#### **Q: Claude GitHub review taking too long**
**A**: Reviews typically complete within 2-5 minutes. If delayed:
- Check GitHub Actions tab for review job status
- Verify PR is not in draft mode
- Ensure all CI checks are passing

#### **Q: Merge conflicts on feature branch**
**A**: Sync with main and resolve:
```bash
git checkout main
git pull origin main  
git checkout feature/your-branch
git merge main
# Resolve conflicts
git add . && git commit
```

### **Best Practices**

#### **✅ DO:**
- Wait for Claude GitHub to complete review before making decisions
- Consider all feedback, even if not applying all suggestions
- Keep commits atomic and well-described
- Test changes thoroughly before updating PR
- Document why certain suggestions were skipped

#### **❌ DON'T:**
- Apply changes blindly without understanding
- Skip critical security or bug fixes  
- Create merge conflicts with unreviewed changes
- Ignore the collaborative feedback loop
- Auto-merge without explicit user approval

### **Performance Tips**

#### **Fast Development Cycle:**
1. Use unit tests for rapid TDD cycles (< 1 second feedback)
2. Run integration tests after major changes (slower but comprehensive)
3. Use `make test-unit` during active development
4. Use `make test-integration` before committing

#### **Efficient Review Loop:**
1. Address critical issues first (security, bugs)  
2. Group related improvements in single commits
3. Test locally before pushing review fixes
4. Communicate with Claude GitHub through clear commit messages

---

## Workflow Success Indicators

### **✅ Successful TDD Implementation**
- All tests written before production code
- Clear Red → Green → Refactor cycles documented
- 95%+ test coverage for new code
- Business descriptions included in integration tests

### **✅ Successful Claude GitHub Integration**  
- Multiple review rounds with iterative improvements
- User maintains control over all merge decisions
- Quality improvements applied based on user preferences
- Clear workflow completion with merge or explicit stop

### **✅ Successful Architecture Compliance**
- Clean Architecture layer separation maintained
- Domain-driven design principles followed
- Proper error handling with user-friendly messages
- Interface-based design with dependency injection

---

**This comprehensive workflow ensures high-quality, well-tested Go code delivered through disciplined TDD practices with collaborative AI review integration.** 

*Last Updated: August 4, 2025*  
*Version: 1.0 - Complete TDD + Testing + Claude GitHub Review Integration*