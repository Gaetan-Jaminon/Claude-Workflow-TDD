# Sync with Main Command

## Purpose
**MANDATORY FIRST STEP** before starting any new feature development. Ensures that discovery, planning, and implementation are based on the latest version of the main branch, preventing outdated patterns and merge conflicts.

## When to Use
**ALWAYS** use this command before:
- Starting feature requirements specification
- Beginning feature exploration
- Creating implementation plans
- Any new feature development work

## What I Will Do

### Pre-Sync Safety Checks
1. **Check working directory status** - Ensure no uncommitted changes
2. **Identify current branch** - Document where we're starting from
3. **Verify remote connectivity** - Ensure can fetch from origin
4. **Check for potential conflicts** - Warn about any blocking issues

### Git Synchronization Process
1. **Fetch latest changes** from remote repository
2. **Switch to main branch** (stash changes if needed)
3. **Pull latest main branch** updates from origin
4. **Verify main is up-to-date** with remote
5. **Clean working directory** confirmation

### Post-Sync Validation
1. **Confirm on main branch** and up-to-date
2. **Verify clean working state** - no uncommitted changes
3. **Display latest commits** for context
4. **Ready for feature development** confirmation

## What I Will NOT Do
- ❌ Force push or override local changes
- ❌ Delete uncommitted work without warning
- ❌ Proceed if merge conflicts exist
- ❌ Skip safety validations

## Expected Output
```markdown
## Git Sync Status Report

### Pre-Sync State
- Previous branch: [branch-name]
- Uncommitted changes: [Yes/No - details if any]
- Remote status: [Connected/Disconnected]

### Sync Operations Performed
- ✅ Fetched latest changes from origin
- ✅ Switched to main branch
- ✅ Pulled latest main branch updates
- ✅ Verified main is up-to-date

### Current State
- Current branch: main
- Latest commit: [commit-hash] - [commit-message]
- Working directory: Clean
- Ready for feature development: ✅

### Next Steps
Ready to proceed with:
1. `/requirements-spec` - Define feature requirements
2. `/explore-feature` - Research implementation approach
```

## Safety Scenarios

### Scenario: Uncommitted Changes
```
Current branch has uncommitted changes
Action: Offer to stash changes before sync
Prompt: "Stash changes and sync with main? (y/n)"
```

### Scenario: Merge Conflicts
```
Potential merge conflicts detected
Action: Stop and request manual resolution
Message: "Please resolve conflicts manually before proceeding"
```

### Scenario: Remote Unavailable
```
Cannot connect to remote repository
Action: Work with local main branch
Warning: "Working with local main - may not have latest changes"
```

### Scenario: Already on Updated Main
```
Current branch: main, up-to-date with origin/main
Action: Skip sync operations
Message: "✅ Already on latest main branch"
```

## Integration with TDD Workflow

### Mandatory First Step
- **Step 0**: `/sync-with-main` - MUST be completed first
- **Step 1**: `/requirements-spec` - Can only proceed after sync
- **Step 2**: `/explore-feature` - Validates main branch sync

### Validation Integration
- All subsequent commands check for main branch sync
- Commands will refuse to proceed if not synchronized
- Provides clear guidance to run `/sync-with-main` first

### Branch Management
- Creates clean starting point for feature branches
- Ensures feature branches are based on latest main
- Prevents conflicts during PR creation process

## Command Sequence Example
```
You: /sync-with-main
Claude: [Performs git sync operations]
Claude: ✅ Ready for feature development on latest main branch

You: /requirements-spec
Claude: [Validates main branch sync, then shows requirement template]

You: /explore-feature [Feature Name]
Claude: [Validates main branch sync, then researches latest codebase]
```

## Git Commands Executed
```bash
# Safety checks
git status
git fetch origin

# Main sync process  
git checkout main
git pull origin main

# Validation
git status
git log --oneline -3
```

## Professional Development Benefits
- **Latest Patterns**: Discovery uses most recent architectural decisions
- **Conflict Prevention**: Avoid merge conflicts before they happen
- **Team Collaboration**: Ensures everyone works from same baseline
- **Clean History**: Maintains linear, professional git history
- **Current Context**: Planning based on latest domain models and interfaces

## Usage
```
You: /sync-with-main
```

**Required before any other TDD workflow commands!**