# Feature Requirement: [FEATURE NAME]

## Goal
[One clear sentence describing what we want to achieve - be specific!]

## User Story
As a [specific user type]  
I want to [specific action]  
So that [specific business value]

## Acceptance Criteria
- [ ] GIVEN [initial context/state] WHEN [user action] THEN [expected outcome]
- [ ] GIVEN [another context] WHEN [another action] THEN [expected outcome]
- [ ] GIVEN [error context] WHEN [invalid action] THEN [error handling]
- [ ] GIVEN [edge case] WHEN [boundary action] THEN [expected behavior]

## Technical Constraints
- MUST use existing `repository.ClientRepository` interface
- MUST follow current error handling pattern (domain errors)
- MUST maintain backward compatibility with existing API
- MUST use same validation approach as Create Client
- MUST NOT add external dependencies
- MUST NOT modify existing database schema

## Scope Constraints  
- Maximum implementation time: **4 hours**
- Maximum files to modify: **6 files**
- Maximum new methods: **3 methods**
- Maximum new types: **0 types** (reuse existing)

## Anti-Requirements (DO NOT IMPLEMENT)
- ❌ Caching layer (defer to future iteration)
- ❌ Batch operations (single client only)
- ❌ Soft delete support (hard delete only)
- ❌ Audit logging (separate feature)
- ❌ Permission checks (separate feature)
- ❌ Rate limiting (platform concern)
- ❌ Webhooks or events (future iteration)

## Definition of Done
- [ ] All acceptance criteria tests passing
- [ ] Unit test coverage ≥ 95% for new code
- [ ] Integration tests passing with real PostgreSQL
- [ ] No TODO or FIXME comments in code
- [ ] Error messages follow project convention
- [ ] API documentation updated (if applicable)
- [ ] No performance degradation in existing tests
- [ ] Code follows Go project style guide

## Example Usage
```go
// For a GetClient endpoint
client, err := service.GetClient(ctx, clientID)
if err != nil {
    if errors.Is(err, domain.ErrClientNotFound) {
        return NotFound("client not found")
    }
    return InternalError(err)
}
return OK(client)
```

## Notes
[Any additional context, dependencies, or considerations]