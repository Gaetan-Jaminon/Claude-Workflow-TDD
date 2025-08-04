# Implement Minimal Command

## Purpose
Write the absolute minimum code required to make the failing tests pass. This is the GREEN phase of Red-Green-Refactor.

## What I Will Do
1. **Implement ONLY enough code** to make tests pass
2. **No extra methods** beyond what tests require
3. **No optimization** unless required by tests
4. **No abstractions** unless multiple tests need them
5. **Follow existing patterns** in the codebase
6. **Verify testing strategy compliance** during implementation
7. **Stop immediately** when all tests are green

## ⚠️ Testing Strategy Validation
During implementation, I will verify:

### Unit Test Implementation
- ✅ Unit tests still use `testhelpers.NewUnitTestServer()` (in-memory)
- ✅ No accidental PostgreSQL dependencies in unit tests
- ✅ Fast execution (< 1 second for unit test suite)

### Integration Test Implementation  
- ✅ Integration tests use `testhelpers.NewIntegrationTestServer()` (PostgreSQL)
- ✅ Database cleanup working properly between tests
- ✅ Real database interactions being tested

## Implementation Rules

### ✅ DO
- Write the simplest code that passes tests
- Follow project conventions
- Handle errors that tests expect
- Use existing interfaces/types
- Copy patterns from similar features

### ❌ DO NOT
- Add methods "for completeness"
- Create abstractions for single use
- Optimize without performance tests
- Add configuration that isn't tested
- Implement features not covered by tests
- Add "nice to have" functionality

## Examples of Minimal Implementation

### Bad (Over-engineered) ❌
```go
// Too abstract for single use
type ClientGetter interface {
    GetByID(ctx context.Context, id string) (*Client, error)
}

type CachedClientRepository struct {
    repo  ClientRepository
    cache Cache
}

func (r *CachedClientRepository) GetByID(ctx context.Context, id string) (*Client, error) {
    // Caching not required by tests!
}
```

### Good (Minimal) ✅
```go
// Direct implementation
func (r *ClientRepository) GetByID(ctx context.Context, id string) (*Client, error) {
    var client Client
    err := r.db.Where("id = ?", id).First(&client).Error
    if err == gorm.ErrRecordNotFound {
        return nil, ErrClientNotFound
    }
    return &client, err
}
```

## Validation Checklist
Before considering implementation complete:

```markdown
## Implementation Complete?

### All Tests Passing
- [ ] Unit tests: `make test-unit` ✅
- [ ] Integration tests: `make test-integration` ✅  
- [ ] Combined test suite: `make test-all` ✅
- [ ] No skipped tests
- [ ] Testing strategy compliance verified

### Code Minimalism
- [ ] Every line of code is required by a test
- [ ] No unused methods or variables
- [ ] No "future-proofing" code
- [ ] No premature optimization

### Following Patterns
- [ ] Error handling matches project style
- [ ] Naming follows project conventions
- [ ] Structure matches similar features

### Ready for Refactor?
- [ ] All tests green
- [ ] Code works but might need cleanup
- [ ] Duplication identified (if any)
```

## Common Traps to Avoid

### The "While I'm Here" Trap
❌ "While I'm here, let me also add Update functionality"
✅ Stop when tests pass

### The "Configuration" Trap
❌ Adding configuration for hardcoded values
✅ Hardcode until tests require configuration

### The "Interface All The Things" Trap
❌ Creating interfaces with single implementation
✅ Use concrete types until abstraction needed

### The "Performance" Trap
❌ Optimizing without performance requirements
✅ Make it work first, optimize when measured

## Usage
Type: `/implement-minimal` after all tests are written and failing