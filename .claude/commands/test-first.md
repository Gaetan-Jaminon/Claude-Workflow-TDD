# Test First Command

## Purpose
Write failing tests before any implementation code. This is the RED phase of the Red-Green-Refactor cycle.

## What I Will Do
1. **Create test files** following Go conventions and testing strategy
2. **Write failing tests** that define the behavior
3. **Use table-driven tests** for multiple scenarios
4. **Include edge cases** and error conditions
5. **Follow testing strategy**: Unit tests use memory, Integration tests use PostgreSQL
6. **Use external testdata**: All test data MUST be in JSON files under `tests/testdata/`
7. **Run tests to ensure they fail** (for the right reasons)
8. **NO implementation code** - only tests

## ⚠️ Testing Strategy Enforcement
**MANDATORY**: All tests must follow the documented testing strategy:

### Unit Tests (`tests/unit/`)
- **Storage**: MUST use `testhelpers.NewUnitTestServer()` (in-memory storage)
- **Purpose**: Test individual components in isolation
- **Speed**: Very fast (< 1 second)
- **No Database**: No real database dependencies

### Integration Tests (`tests/integration/`)
- **Storage**: MUST use `testhelpers.NewIntegrationTestServer()` (PostgreSQL)
- **Purpose**: Test component interactions with real database
- **Database**: `go-labs-tst` with `billing` schema
- **Cleanup**: Automatic database cleanup between tests
- **Business Context**: MUST include business descriptions for stakeholder reporting

## 📁 External Test Data Requirements
**MANDATORY**: All test data MUST be stored in external JSON files under `tests/testdata/`

### Test Data Organization
```
tests/testdata/
├── client/
│   ├── client_test_cases.json       # Validation test cases
│   ├── client_fixtures.json         # Basic client fixtures
│   ├── single_client_fixture.json   # Single client fixture
│   └── repository_test_fixtures.json # Repository-specific fixtures
├── http/
│   └── create_client_requests.json  # HTTP request test cases
└── [entity]/
    ├── [entity]_test_cases.json     # Validation scenarios
    └── [entity]_fixtures.json       # Basic fixtures
```

### Test Data Loading Pattern
```go
type ClientFixture struct {
    Name    string `json:"name"`
    Email   string `json:"email"`
    Phone   string `json:"phone"`
    Address string `json:"address"`
}

func loadClientFixtures(t *testing.T) []ClientFixture {
    // Get current file directory
    _, currentFile, _, ok := runtime.Caller(0)
    assert.True(t, ok, "Failed to get current file path")
    
    // Build path to testdata
    testDataPath := filepath.Join(filepath.Dir(currentFile), "..", "..", "testdata", "client", "client_fixtures.json")
    
    // Read and parse JSON
    data, err := os.ReadFile(testDataPath)
    assert.NoError(t, err, "Failed to read fixture data file")
    
    var fixtures []ClientFixture
    err = json.Unmarshal(data, &fixtures)
    assert.NoError(t, err, "Failed to parse fixture data JSON")
    
    return fixtures
}
```

## 📋 Business Description Requirements for Integration Tests
**MANDATORY**: All integration tests MUST include business context for stakeholder reporting.

### Business Description Template
```go
// BUSINESS_TITLE: [Clear business feature name]
// BUSINESS_DESCRIPTION: [What this enables for users/business in plain language]
// USER_STORY: As a [role], I want [capability] so that [benefit]
// BUSINESS_VALUE: [Why this matters to the business - ROI, efficiency, etc.]
// SCENARIOS_TESTED: [List of business scenarios covered by this test]
func TestBusinessFeature_Integration(t *testing.T) {
    // Test implementation
}
```

### Example Business Description
```go
// BUSINESS_TITLE: Create New Client via API
// BUSINESS_DESCRIPTION: Sales representatives can add new clients through the web interface, ensuring all client data is properly validated and stored
// USER_STORY: As a sales representative, I want to create new client records through a web form so that I can organize and track my customer relationships
// BUSINESS_VALUE: Enables customer onboarding, relationship management, and sales tracking. Critical for business growth and customer data organization
// SCENARIOS_TESTED: Valid client creation, data validation (email format, required fields), error handling for invalid data, duplicate prevention
func TestClientHandler_CreateClient(t *testing.T) {
    // Integration test implementation
}
```

### Business Report Generation
- Integration tests automatically generate business coverage reports
- Use `make test-integration-report` to run tests and generate stakeholder reports
- Reports are created for Business Analysts and Product Managers
- HTML and Markdown formats available in `tests/reports/`

## Go Test Patterns to Follow

### Table-Driven Tests
```go
func Test_FunctionName_Behavior(t *testing.T) {
    tests := []struct {
        name    string
        input   InputType
        want    OutputType
        wantErr bool
    }{
        {
            name:    "successful case",
            input:   InputType{...},
            want:    OutputType{...},
            wantErr: false,
        },
        {
            name:    "error case - invalid input",
            input:    InputType{...},
            want:    OutputType{},
            wantErr: true,
        },
    }

    for _, tt := range tests {
        t.Run(tt.name, func(t *testing.T) {
            // Test implementation
        })
    }
}
```

### Test File Organization
```
package_test.go          # Unit tests (same package)
package_integration_test.go  # Integration tests (separate package)
```

### Assertion Patterns
```go
// Use testify/assert for clear assertions
assert.Equal(t, expected, actual, "descriptive message")
assert.NoError(t, err, "operation should succeed")
assert.Error(t, err, "should fail with error")

// Use testify/require when test can't continue
require.NoError(t, err, "setup must succeed")
```

## Test Categories to Include

### Happy Path Tests
- Normal successful operations
- Valid inputs producing expected outputs

### Edge Case Tests
- Boundary values
- Empty inputs
- Maximum size inputs

### Error Tests
- Invalid inputs
- Missing required fields
- Business rule violations

### Integration Tests (with PostgreSQL)
- **Database Interactions**: Real PostgreSQL queries and transactions
- **HTTP Endpoint Tests**: Full request/response cycle with database persistence
- **Multi-Component Workflows**: Service + Repository + Database integration
- **Automatic Cleanup**: Fresh database state for every test run

## Expected Output
```markdown
## Tests Created

### Unit Tests (In-Memory Storage)
- `tests/unit/application/billing_service_test.go`
  - Test_GetClientByID_Success (uses testhelpers.NewUnitTestServer)
  - Test_GetClientByID_NotFound
  - Test_GetClientByID_InvalidID

### Integration Tests (PostgreSQL Storage)
- `tests/integration/api/client_handler_test.go`
  - Test_GetClientEndpoint_Success (uses testhelpers.NewIntegrationTestServer)
  - Test_GetClientEndpoint_404
  - Database cleanup verified between tests

### Testing Strategy Compliance
- ✅ Unit tests use in-memory storage only
- ✅ Integration tests use PostgreSQL with automatic cleanup
- ✅ No cross-contamination between test types

### Test Execution Results
```
$ make test-unit
--- FAIL: Test_GetClientByID_Success (0.00s)
    billing_service_test.go:42: GetClientByID not implemented
FAIL

$ make test-integration
--- FAIL: Test_GetClientEndpoint_Success (0.00s)
    client_handler_test.go:55: GetClient endpoint not implemented
FAIL
```

All tests failing as expected ✅
```

## Important Rules
- ❌ NO implementation code in this phase
- ❌ NO making tests pass
- ❌ NO mixing storage types (unit tests with PostgreSQL, integration tests with memory)
- ❌ NO hardcoded test data in test files
- ❌ NO integration tests without business descriptions
- ✅ Tests MUST fail for the right reason
- ✅ Tests MUST be comprehensive
- ✅ Each test should test ONE thing
- ✅ MUST follow testing strategy: Unit = memory, Integration = PostgreSQL
- ✅ MUST use external JSON test data files under `tests/testdata/`
- ✅ MUST include business descriptions for all integration tests

## Usage
Type: `/test-first` after plan approval