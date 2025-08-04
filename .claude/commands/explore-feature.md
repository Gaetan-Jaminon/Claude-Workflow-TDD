# Explore Feature Command

## Purpose
Research and understand requirements without writing any code. This is a READ-ONLY exploration phase to gather context and identify integration points.

## Prerequisites
**⚠️ MANDATORY**: Must run `/sync-with-main` first to ensure exploration is based on the latest main branch.

### Main Branch Validation
I will verify that:
- Current branch is `main`
- Main branch is up-to-date with origin/main
- Working directory is clean
- Ready to explore latest codebase patterns

**If not on latest main branch, I will STOP and request `/sync-with-main` first.**

## What I Will Do
1. **Analyze existing codebase** relevant to the feature
2. **Identify integration points** with current architecture
3. **Review similar implementations** for pattern consistency
4. **Document current conventions** (error handling, validation, etc.)
5. **List potential challenges** or technical constraints
6. **Check for existing tests** that might be affected

## What I Will NOT Do
- ❌ Write any code (not even comments)
- ❌ Create or modify any files
- ❌ Suggest implementation details
- ❌ Make architectural decisions

## Expected Output
```markdown
## Feature Exploration: [Feature Name]

### Pre-Exploration Validation
- ✅ Current branch: main
- ✅ Up-to-date with origin/main
- ✅ Working directory clean
- ✅ Latest codebase patterns available

### Current State Analysis
- Relevant existing code: [files and patterns found]
- Integration points: [where this fits in architecture]
- Similar patterns: [existing implementations to follow]
- Latest architectural decisions: [recent changes that affect this feature]

### Technical Context
- Dependencies: [packages/modules needed]
- Conventions to follow: [project-specific patterns]
- Test patterns: [how similar features are tested]
- Recent pattern changes: [any new conventions to follow]

### Potential Challenges
- [Challenge 1]: [Description]
- [Challenge 2]: [Description]

### Questions for Clarification
- [Any ambiguities in requirements]
```

## Usage
Type: `/explore-feature` followed by the feature name or requirement reference