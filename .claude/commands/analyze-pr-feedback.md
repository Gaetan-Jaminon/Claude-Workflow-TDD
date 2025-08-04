# Analyze PR Feedback Command

## Purpose
Fetch and analyze Claude GitHub's review feedback on your pull request, creating a collaborative pair programming experience between Claude Code and Claude GitHub.

## What I Will Do
1. **Fetch PR review comments** from Claude GitHub using `gh pr view --comments`
2. **Parse and categorize feedback** by severity and type
3. **Analyze feasibility** of each suggestion
4. **Present structured summary** with code examples
5. **Wait for your decision** on which changes to apply
6. **Implement approved changes** using appropriate tools
7. **Update the PR** with review fixes

## Feedback Categories

### 🚨 CRITICAL
- Security vulnerabilities
- Bugs and logic errors
- Breaking changes
- Data integrity issues

### ⚠️ IMPORTANT
- Performance problems
- Best practice violations
- Missing error handling
- Architectural concerns

### 💡 SUGGESTIONS
- Code style improvements
- Naming conventions
- Refactoring opportunities
- Documentation enhancements

### ❓ QUESTIONS
- Clarifications from Claude GitHub
- Design decisions to discuss
- Alternative approaches proposed

## Decision Options

After presenting the feedback analysis, I'll offer these options:

1. **Apply all suggestions** - Implement everything Claude GitHub suggested
2. **Apply critical/important only** - Focus on must-fix issues
3. **Review individually** - Go through each suggestion one by one
4. **Custom selection** - You specify which suggestions to apply
5. **Skip all** - Proceed without applying any changes
6. **Discuss further** - Get more context on specific feedback

## Expected Output

```markdown
## Claude GitHub Review Analysis

### PR #123: [PR Title]
**Reviewer:** Claude GitHub
**Review Status:** Changes Requested

### 🚨 CRITICAL Issues (1)
1. **Missing error handling in GetClient**
   - Location: `internal/api/handlers/client_handler.go:45`
   - Issue: No error handling for database connection failure
   - Suggested fix:
   ```go
   if err != nil {
       return nil, fmt.Errorf("database error: %w", err)
   }
   ```

### ⚠️ IMPORTANT Issues (2)
1. **Hardcoded timeout value**
   - Location: `internal/config/config.go:23`
   - Issue: Magic number should be a constant
   - Suggested fix: Create `const DefaultTimeout = 30 * time.Second`

2. **Missing test coverage**
   - Location: `internal/application/billing_service.go`
   - Issue: UpdateClient method has no tests
   - Suggested fix: Add comprehensive test cases

### 💡 SUGGESTIONS (3)
[... additional suggestions ...]

### 📊 Summary
- Total feedback items: 6
- Critical issues: 1 (must fix)
- Important issues: 2 (should fix)
- Suggestions: 3 (nice to have)

### 🤔 Your Decision?
How would you like to proceed with this feedback?
1. Apply all suggestions (6 changes)
2. Apply critical/important only (3 changes)
3. Review each suggestion individually
4. Custom selection
5. Skip all and proceed
```

## Implementation Flow

### Step 1: Fetch PR Comments
```bash
gh pr view <PR_NUMBER> --comments --json comments,reviews
```

### Step 2: Parse Claude GitHub Comments
- Filter comments from Claude GitHub bot
- Extract code suggestions and feedback
- Categorize by severity markers

### Step 3: Analyze and Present
- Group feedback by category
- Show code context for each issue
- Provide implementation suggestions

### Step 4: Apply Changes
- Use Edit/MultiEdit for code changes
- Maintain atomic commits for review fixes
- Update PR with clear commit messages

## Integration with TDD Workflow

This command fits after `/commit-and-create-pr`:

```
/commit-and-create-pr → [Wait for review] → /analyze-pr-feedback → [Apply changes]
```

## Best Practices

### ✅ DO
- Wait for Claude GitHub to complete review before running
- Consider all feedback, even if not applying
- Keep commits atomic and well-described
- Test changes before updating PR
- Document why certain suggestions were skipped

### ❌ DO NOT
- Apply changes blindly without understanding
- Skip critical security or bug fixes
- Merge conflicts with unreviewed changes
- Ignore the collaborative feedback loop

## Collaboration Benefits

This creates a powerful pair programming dynamic:
- **Claude Code**: Implementation and initial development
- **Claude GitHub**: Code review and quality assurance
- **You**: Final decision maker and quality gatekeeper

Together, this ensures higher code quality, better practices, and continuous improvement.

## Usage
Type: `/analyze-pr-feedback` after Claude GitHub has reviewed your PR