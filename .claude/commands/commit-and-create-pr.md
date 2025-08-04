# Commit and Create PR Command

## Purpose
Automate the final steps of the TDD workflow by creating a feature branch, committing all changes with a standardized message, pushing to remote, and creating a pull request. This combines **Steps 7 & 8** of the mandatory TDD workflow.

## When to Use
**ONLY AFTER** completing all previous TDD workflow steps:
1. ✅ EXPLORE - Requirements research completed
2. ✅ PLAN - Implementation plan approved 
3. ✅ TEST - All failing tests written (Red phase)
4. ✅ CODE - Minimal implementation completed (Green phase)
5. ✅ REFACTOR - Code quality improvements completed
6. ✅ All tests passing with ≥95% coverage

## What I Will Do

### Pre-Commit Validation
1. **Verify all tests pass** - Run full test suite
2. **Check test coverage** - Ensure ≥95% coverage for new code
3. **Generate business coverage report** - Create stakeholder documentation
4. **Validate no TODO/FIXME** - Ensure no temporary comments
5. **Confirm clean implementation** - No debug code or console logs

### Git Operations (Step 7)
1. **Create feature branch** using naming convention `feature/[feature-name-kebab-case]`
2. **Stage all relevant changes** for the implemented feature
3. **Generate comprehensive commit message** following project standards
4. **Commit with proper attribution** including Claude Code signature
5. **Push to remote** with upstream tracking

### PR Creation (Step 8)
1. **Generate PR title** from feature name and commit message
2. **Create comprehensive PR description** including:
   - Implementation summary
   - TDD cycles completed
   - Test coverage details
   - Technical changes overview
   - Review checklist
3. **Create pull request** targeting main branch
4. **Apply relevant labels** (feature, tdd, needs-review)
5. **Request code review** from team members

## Branch Naming Convention
- **Format**: `feature/[feature-name-kebab-case]`
- **Examples**: 
  - `feature/list-all-clients`
  - `feature/update-client`
  - `feature/delete-client`
  - `feature/client-validation`

## PR Title Format
```
feat: [Brief description of feature]
```

## PR Description Template
```markdown
## Summary
[Auto-generated from commit message and TDD implementation]

## TDD Implementation
- [X] **EXPLORE**: Requirements research completed
- [X] **PLAN**: Implementation plan approved by human reviewer
- [X] **TEST**: Failing tests written first (Red phase)
- [X] **CODE**: Minimal implementation (Green phase)
- [X] **REFACTOR**: Code quality improvements completed

## Test Coverage
- Unit tests: [Coverage percentage]% 
- Integration tests: [Coverage percentage]%
- HTTP tests: Full request/response cycle testing
- Business coverage report: Generated for stakeholder review
- All tests passing ✅

## Technical Changes
### Architecture
- [Clean Architecture layer changes]
- [DDD principle compliance]
- [Interface additions/modifications]

### API Changes
- [New endpoints added]
- [Request/response format details]
- [Backward compatibility notes]

### Database Changes
- [Schema modifications if any]
- [Migration requirements]

## Review Checklist
- [ ] Code follows project conventions and style guide
- [ ] All tests pass (unit, integration, HTTP)
- [ ] Test coverage ≥95% for new code
- [ ] No TODO/FIXME comments in production code
- [ ] Error handling follows domain error patterns
- [ ] API responses follow established DTO format
- [ ] Documentation updated if needed
- [ ] No breaking changes to existing functionality

## Manual Testing
- [ ] Feature works as described in requirements
- [ ] Error cases handled appropriately
- [ ] Performance impact assessed
- [ ] Security implications reviewed

## Claude GitHub Review
This PR will be automatically reviewed by Claude GitHub for:
- Code quality and best practices
- Security vulnerabilities
- Performance issues
- Architectural improvements

After review, use `/analyze-pr-feedback` to process and apply feedback.

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

## Automated Validations

### Before Committing
- [ ] All unit tests passing
- [ ] All integration tests passing
- [ ] Test coverage ≥95% for new code
- [ ] Business coverage report generated (if integration tests added/modified)
- [ ] Integration tests include business descriptions
- [ ] No TODO or FIXME comments in production code
- [ ] No console.log, print, or debug statements
- [ ] All code follows project conventions
- [ ] No uncommitted debugging or temporary files

### Git Operations Checklist
- [ ] Feature branch created with proper naming
- [ ] All relevant files staged (no accidental inclusions)
- [ ] Commit message follows template format
- [ ] Commit includes Claude Code attribution
- [ ] Branch pushed to remote successfully

### PR Creation Checklist
- [ ] PR title follows format convention
- [ ] PR description comprehensive and detailed
- [ ] Base branch set to main
- [ ] Labels applied appropriately
- [ ] Review requested from team members
- [ ] PR template checklist included

## GitHub CLI Commands Used
```bash
# Create pull request
gh pr create \
  --title "feat: [Feature Name]" \
  --body "[Comprehensive PR description]" \
  --base main \
  --head feature/[feature-name] \
  --label "feature,tdd,needs-review"

# Request review (if team members specified)
gh pr edit --add-reviewer [reviewer-username]
```

## Usage Example
```
You: /commit-and-create-pr
Claude: [Runs validation checks]
Claude: ✅ All tests passing (coverage: 98%)
Claude: [Creates feature branch: feature/list-all-clients]
Claude: [Stages changes and commits with standardized message]
Claude: [Pushes to remote: origin/feature/list-all-clients]
Claude: [Creates PR #X with comprehensive description]
Claude: ✅ Feature successfully committed and PR created!
Claude: 🔗 PR URL: https://github.com/user/repo/pull/X
Claude: 
Claude: 🤖 Claude GitHub will review this PR automatically.
Claude: Once the review is posted, use `/analyze-pr-feedback` to:
Claude: - Analyze the review feedback
Claude: - Apply approved suggestions
Claude: - Create a true pair programming experience!
```

## Failure Scenarios

### If Tests Fail
❌ **STOP** - Do not commit until all tests pass
- Run full test suite to identify failures
- Fix failing tests before proceeding
- Retry `/commit-and-create-pr` only after tests pass

### If Coverage Below 95%
❌ **STOP** - Add more tests before committing
- Identify uncovered code paths
- Write additional tests for edge cases
- Verify coverage meets standards

### If Validation Fails
❌ **STOP** - Clean up code before committing
- Remove TODO/FIXME comments
- Remove debug statements
- Ensure code meets quality standards

### If PR Creation Fails
❌ **Check GitHub CLI authentication**
- Verify `gh auth status`
- Ensure proper repository permissions
- Check branch naming and remote existence

## Claude GitHub Review Integration 🤖

### Next Step After PR Creation
After successfully creating the PR, Claude GitHub will automatically review your code. This creates a **pair programming dynamic** between Claude Code and Claude GitHub.

**What happens next:**
1. **Claude GitHub reviews the PR** - Usually within a few minutes
2. **Review feedback posted** - Comments on code quality, best practices, potential issues
3. **Use `/analyze-pr-feedback`** - Fetch and analyze the review feedback
4. **Collaborative improvement** - Apply approved suggestions before merge

### Review Workflow
```
Create PR → Wait for Claude GitHub review → /analyze-pr-feedback → Apply changes → Update PR
```

This collaborative review process ensures:
- 🎯 Higher code quality through dual AI review
- 📚 Learning from review feedback
- 🛡️ Catching issues before merge
- 👥 True pair programming experience

## Success Indicators
✅ All tests passing with ≥95% coverage
✅ Feature branch created successfully
✅ Comprehensive commit message generated
✅ Changes pushed to remote
✅ Pull request created with detailed description
✅ Review requested from appropriate team members
✅ Ready for Claude GitHub review
✅ **Next step:** Wait for review and run `/analyze-pr-feedback`

This command ensures complete end-to-end automation from feature completion to code review, maintaining consistency and quality standards across all implementations. The integration with Claude GitHub review creates a powerful collaborative development environment.