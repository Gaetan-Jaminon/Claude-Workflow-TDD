# Commit Message Template

## Standard Commit Message Format

### Format
```
feat: [Brief description of feature]

[Detailed implementation summary]

TDD Implementation:
- EXPLORE: Requirements research completed ✅
- PLAN: Implementation plan approved by human reviewer ✅
- TEST: Failing tests written first (Red phase) ✅
- CODE: Minimal implementation completed (Green phase) ✅
- REFACTOR: Code quality improvements completed ✅

Technical Changes:
- [Architecture layer changes]
- [API endpoints added/modified]
- [Database schema changes if any]
- [Interface additions/modifications]

Test Coverage:
- Unit tests: [X]% coverage
- Integration tests: Full PostgreSQL storage testing
- HTTP tests: Complete request/response cycle testing
- All tests passing ✅

Files Modified:
- [List of key files changed]

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

### Usage Guidelines

**When to Use:**
- After completing all TDD workflow steps (1-6)
- Before running `/commit-and-create-pr` command
- For consistent commit messages across all features

**Commit Type Prefixes:**
- `feat:` - New feature implementation
- `fix:` - Bug fix or error correction
- `refactor:` - Code improvements without functionality changes
- `test:` - Test additions or improvements
- `docs:` - Documentation updates
- `chore:` - Maintenance tasks, build changes

**Brief Description Guidelines:**
- Use present tense ("add" not "added")
- Use imperative mood ("move cursor to..." not "moves cursor to...")
- Don't capitalize first letter
- No period at the end
- Maximum 50 characters

**Examples:**
```
feat: add list all clients endpoint
feat: implement client update functionality
feat: add client deletion with cascade rules
fix: resolve client validation error handling
refactor: improve repository pattern implementation
```

### TDD Workflow Integration

**Mandatory Checklist Items:**
- [ ] All TDD phases completed (EXPLORE → PLAN → TEST → CODE → REFACTOR)
- [ ] Implementation plan was approved by human reviewer
- [ ] Tests written first and failed appropriately
- [ ] Minimal implementation approach followed
- [ ] Code quality improvements applied during refactor phase
- [ ] Test coverage ≥95% for all new code
- [ ] All tests passing (unit, integration, HTTP)

**Technical Details Required:**
- Architecture layer changes (domain, application, infrastructure, interface)
- API changes (new endpoints, request/response modifications)
- Database changes (schema modifications, migrations)
- Interface additions or modifications

**Test Coverage Details:**
- Unit test coverage percentage
- Integration test confirmation
- HTTP test completion status
- Overall test suite status

### Auto-Generation Support

This template is designed to work with the `/commit-and-create-pr` command which will:

1. **Auto-populate TDD checklist** based on completed workflow steps
2. **Calculate test coverage** from test runs
3. **Extract technical changes** from code analysis
4. **Generate file list** from git diff
5. **Format consistently** for both commit and PR description

### PR Description Compatibility

Commit messages using this template will automatically:
- **Populate PR title** from the first line
- **Generate PR summary** from the detailed description
- **Include TDD checklist** in PR description
- **Add technical details** to PR body
- **Maintain consistent formatting** across commit and PR

### Quality Standards

**Required Elements:**
- Clear, concise feature description
- Complete TDD workflow documentation
- Technical implementation details
- Test coverage verification
- File modification list

**Formatting Requirements:**
- Use markdown formatting for readability
- Include emoji checkmarks (✅) for completed items
- Maintain consistent indentation and structure
- Include Claude Code attribution footer

### Integration with Git Workflow

**Branch Naming Alignment:**
- Commit messages should align with feature branch names
- Example: `feature/list-all-clients` → `feat: add list all clients endpoint`

**PR Title Generation:**
- First line of commit message becomes PR title
- Ensures consistency between commit and PR naming

**Multi-commit Features:**
- For features requiring multiple commits, use consistent prefixes
- Final commit should include complete TDD checklist
- Intermediate commits can focus on specific phases

This template ensures consistency, traceability, and professional commit history while supporting automated PR generation and maintaining compliance with the established TDD workflow.