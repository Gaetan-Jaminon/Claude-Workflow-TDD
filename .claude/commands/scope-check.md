# Scope Check Command

## Purpose
Validate that the planned implementation isn't overcomplicating the solution. This is your defense against feature creep and overengineering.

## What I Will Check
1. **Is this the simplest solution** that meets requirements?
2. **Are we implementing ONLY** what's explicitly required?
3. **Can we defer any complexity** to a future iteration?
4. **Are we following YAGNI** (You Aren't Gonna Need It)?
5. **Is the time estimate reasonable** for the value delivered?

## Scope Check Questions
```markdown
## Scope Validation Checklist

### Simplicity Check
- [ ] Could this be done with fewer files/methods?
- [ ] Are we adding any "just in case" features?
- [ ] Is every piece of code directly tied to a requirement?

### YAGNI Validation
- [ ] Are we building for hypothetical future needs?
- [ ] Can any abstraction be removed without breaking requirements?
- [ ] Are we adding any "nice to have" features?

### Complexity Analysis
- Current solution complexity: [Low/Medium/High]
- Simpler alternative exists? [Yes/No]
- If yes, why not using it? [Justification required]

### Time/Value Assessment
- Estimated time: [X hours]
- Business value: [Critical/High/Medium/Low]
- Ratio acceptable? [Yes/No]

### Red Flags Found
⚠️ [Any overengineering detected]
⚠️ [Any scope creep identified]
⚠️ [Any unnecessary complexity]

### Recommendation
[ ] ✅ PROCEED - Scope is appropriate
[ ] ⚠️ REVISE - Simplify these areas: [list]
[ ] ❌ STOP - Major scope issues: [list]
```

## When to Use
- After `/plan-feature` if the plan seems complex
- When requirements seem to be growing
- Before approving any plan that modifies > 5 files
- Whenever you feel the solution is getting complicated

## Red Flags to Watch For
- 🚩 "While we're at it, we could also..."
- 🚩 "This might be useful later..."
- 🚩 "Let's make it generic..."
- 🚩 "We should add a framework for..."
- 🚩 Abstract classes/interfaces with single implementation
- 🚩 Configuration for things that never change
- 🚩 Optimization without performance requirements

## Usage
Type: `/scope-check` when reviewing a plan or feeling complexity creep