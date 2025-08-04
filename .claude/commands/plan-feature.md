# Plan Feature Command

## Purpose
Create a detailed implementation plan following TDD principles. This command MUST end with a STOP for mandatory human review before any coding begins.

## What I Will Do
1. **Break down the feature** into small TDD cycles
2. **Define test scenarios** for each cycle (Red phase)
3. **Specify minimal implementation** for each test (Green phase)
4. **Identify refactoring opportunities** (Refactor phase)
5. **Set explicit scope constraints**
6. **List what's OUT of scope**
7. **STOP and await approval**

## Plan Output Format
```markdown
# Implementation Plan: [Feature Name]

## TDD Cycles

### Cycle 1: [Component/Function Name]
**Red Phase - Tests to Write:**
1. `Test_[TestName]_[Scenario]` - [what it tests]
2. `Test_[TestName]_[ErrorCase]` - [what it tests]

**Test Data Required:**
- Create/update: `tests/testdata/[entity]/[filename].json`
- Test scenarios: [brief description of test cases]
- External data loading pattern required

**Business Context for Integration Tests:**
- Business Title: [Clear business feature name]
- Business Description: [What this enables for users/business]
- User Story: As a [role], I want [capability] so that [benefit]
- Business Value: [Why this matters - ROI, efficiency, etc.]
- Scenarios Tested: [Business scenarios to validate]

**Green Phase - Minimal Implementation:**
- Add method: `func [Name]([params]) [return]`
- Implementation: [2-3 bullet points of minimal code]

**Refactor Opportunities:**
- [What can be improved after green]

### Cycle 2: [Next Component]
[Same structure...]

## Scope Constraints
- Maximum files to modify: [X]
- Maximum new dependencies: [0 unless justified]
- Time estimate: [X hours]

## OUT OF SCOPE (Do NOT implement)
- ❌ [Feature/optimization we're NOT doing]
- ❌ [Complexity we're deferring]
- ❌ [Nice-to-have we're skipping]

## Test Execution Order
1. [Which test file to create/modify first]
2. [Order of test implementation]
3. [Integration test order]

## 🛑 STOP - AWAITING APPROVAL
This plan requires explicit approval before proceeding.
Reply with:
- "Approved" to continue
- "Revise: [specific changes needed]" to adjust
- "Reject" to cancel
```

## Approval Criteria
The plan should be approved if:
- Each cycle is small and focused
- Tests are comprehensive but not excessive
- Implementation is truly minimal
- Scope constraints are reasonable
- No overengineering is present
- External testdata requirements are clearly defined
- No hardcoded test data is planned

## Usage
Type: `/plan-feature` after exploring the feature