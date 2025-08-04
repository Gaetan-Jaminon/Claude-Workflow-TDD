# TDD Cycle Template

Use this template to track progress through each TDD cycle.

## Cycle: [Feature/Component Name]

### 📍 Current Phase: [RED/GREEN/REFACTOR]

### 🔴 RED Phase - Write Failing Tests
- [ ] Test file created: `[path/to/test_file.go]`
- [ ] Test scenarios identified:
  - [ ] Happy path: `Test_ComponentName_SuccessCase`
  - [ ] Error case: `Test_ComponentName_ErrorCase` 
  - [ ] Edge case: `Test_ComponentName_EdgeCase`
- [ ] Tests written using table-driven approach
- [ ] Tests run and fail with expected errors
- [ ] No implementation code written

**Test Failure Output:**
```
$ go test ./...
[paste actual test failure output here]
```

### 🟢 GREEN Phase - Make Tests Pass
- [ ] Minimal implementation planned
- [ ] Implementation files identified: `[files to modify]`
- [ ] Code written to pass tests only:
  - [ ] Method/function added: `[signature]`
  - [ ] Error handling added as tested
  - [ ] No extra features added
- [ ] All tests now passing
- [ ] No code without test coverage

**Test Success Output:**
```
$ go test ./...
PASS
ok      github.com/gjaminon-go-labs/billing-api/...     0.xyz s
```

### 🔵 REFACTOR Phase - Improve Code Quality
- [ ] Duplication identified and removed
- [ ] Names improved for clarity
- [ ] Complex methods extracted
- [ ] Comments added where needed
- [ ] Tests still passing after refactor

**Refactoring Done:**
- [ ] [Specific improvement made]
- [ ] [Another improvement]

### ✅ Cycle Complete Checklist
- [ ] All tests passing
- [ ] Code coverage ≥ 95% for new code
- [ ] No TODO comments
- [ ] Follows project patterns
- [ ] Ready for next cycle

### 📊 Coverage Report
```
$ go test -cover ./...
[paste coverage output]
```

## Next Cycle: [What's next]
[Brief description of the next TDD cycle to tackle]

---

## Quick Commands Reference
```bash
# Run tests for current package
go test .

# Run tests with coverage
go test -cover .

# Run tests with detailed coverage
go test -coverprofile=coverage.out .
go tool cover -html=coverage.out

# Run specific test
go test -run Test_ComponentName_SuccessCase

# Run tests with verbose output
go test -v .
```