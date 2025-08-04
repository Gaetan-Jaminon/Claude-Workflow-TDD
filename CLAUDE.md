# Claude Memory - GoTuto Project

## 🚨 MANDATORY TDD WORKFLOW - NO EXCEPTIONS 🚨

### Workflow Enforcement
**YOU MUST FOLLOW THIS EXACT SEQUENCE:**
1. **EXPLORE** → Research and understand requirements (READ-ONLY - no code)
2. **PLAN** → Create detailed implementation plan with test scenarios
3. **STOP** → MANDATORY pause - present plan for human review/approval
4. **TEST** → Write failing tests first (Red phase)
5. **CODE** → Write minimal code to pass tests (Green phase)
6. **REFACTOR** → Improve code quality while keeping tests green
7. **COMMIT & PUSH** → Create feature branch, commit with standard message, push to remote
8. **CREATE PR** → Generate pull request with detailed description and request code review

**⛔ BREAKING THESE RULES = IMMEDIATE STOP**

### Anti-Pattern Prevention
- **NO** production code without failing tests first
- **NO** implementing features not covered by tests
- **NO** skipping the planning phase - EVER
- **NO** implementing beyond the requirements (YAGNI)
- **NO** continuing after PLAN without explicit approval
- **NO** committing without proper feature branch and descriptive message
- **NO** manual PR creation - always use automated workflow
- **ALWAYS** use scope constraints in requirements
- **ALWAYS** check against overengineering
- **ALWAYS** create feature branch named `feature/[feature-name-kebab-case]`
- **ALWAYS** push to remote after successful implementation
- **ALWAYS** create PR immediately after successful push with comprehensive description

### Go-Specific Testing Standards
- Test files MUST end with `_test.go`
- Use table-driven tests for multiple scenarios
- Prefer `testify/assert` and `testify/require` for assertions
- Unit tests go in same package, integration tests in `_test` package
- Minimum 95% test coverage for new code
- Use `t.Run()` for subtests
- Mock interfaces, not concrete types

### Available Commands
- `/explore-feature` - Research phase (no coding)
- `/plan-feature` - Create plan (stops for approval)
- `/requirements-spec` - Define precise requirements
- `/scope-check` - Validate against overengineering
- `/test-first` - Write failing tests
- `/implement-minimal` - Write minimal passing code

**See `.claude/README-TDD-WORKFLOW.md` for detailed usage guide**

---

## Project Overview
**Goal:** Learn Go as a .NET developer through practical Domain-Driven Design (DDD) implementation  
**Architecture:** Clean Architecture with DDD, dependency injection, and comprehensive testing strategy  
**Current Status:** Complete Application Dependencies Architecture with schema-based service isolation and test data isolation

## Project Structure
```
billing-service/
├── cmd/                         # Application entry points
│   ├── api/                    # Main REST API server
│   └── migrator/               # Database migration CLI tool
├── internal/                   # Internal application code
│   ├── domain/                 # Domain Layer (Business Logic)
│   │   ├── entity/            # Entities (Client)
│   │   ├── valueobject/       # Value Objects (Email, Phone)
│   │   ├── repository/        # Repository interfaces
│   │   └── errors/            # Domain-specific errors
│   ├── application/           # Application Layer (Use Cases)
│   │   ├── command/           # Commands and DTOs
│   │   └── usecase/           # Use case implementations
│   ├── infrastructure/        # Infrastructure Layer
│   │   ├── storage/           # Storage implementations (memory, postgres)
│   │   ├── persistence/       # PostgreSQL repository implementation
│   │   └── config/            # Configuration management
│   ├── interfaces/            # Interface Layer
│   │   └── rest/              # HTTP handlers and routing
│   ├── api/                   # API Layer
│   │   └── http/              # HTTP server and middleware
│   ├── di/                    # Dependency Injection
│   │   └── container.go       # DI container with lazy initialization
│   ├── config/                # Configuration loader
│   ├── migration/             # Migration service with golang-migrate
│   └── database/              # Database utilities
│       └── migrations/        # SQL migration files
├── tests/                     # Test organization
│   ├── unit/                  # Unit tests (memory storage)
│   ├── integration/           # Integration tests (PostgreSQL)
│   ├── testhelpers/          # Test utilities and bootstraps
│   └── testdata/             # External test data (JSON files)
├── configs/                   # YAML configuration files
│   ├── base.yaml             # Base configuration
│   ├── development.yaml      # Development overrides
│   ├── test.yaml             # Test environment (PostgreSQL)
│   └── production.yaml       # Production configuration
├── docs/                      # Documentation
│   ├── TEST_STRATEGY.md      # Comprehensive testing documentation
│   └── INTEGRATION_TYPES.md  # Integration patterns explanation
└── Makefile                  # Build and development automation
```

## Implementation Status

### ✅ COMPLETED - Core Infrastructure
**Advanced Testing & Development Environment:**

#### Database Migration System
- **golang-migrate** integration for schema versioning
- **Environment-specific databases:** dev, test, production
- **Auto-migration** support for integration tests
- **Migration CLI tool** with up/down/status/force commands

#### Advanced Testing Strategy
- **Unit Tests:** In-memory storage for fast isolated testing
- **Integration Tests:** PostgreSQL with Docker container recreation
- **Smart PostgreSQL Detection:** Automatic Docker management
- **Test Isolation:** Fresh database state for every test run
- **Port Configuration:** Docker uses 5433 to avoid conflicts with local PostgreSQL

#### Docker Container Recreation
- **Automatic Detection:** Identifies if PostgreSQL is Docker or local
- **Fresh State:** Recreates Docker container for each test run
- **CI/CD Optimized:** Perfect for automated testing pipelines
- **Local Dev Friendly:** Respects existing local PostgreSQL installations

#### Dependency Injection Container
- **Lazy Initialization:** Components created only when needed
- **Thread-Safe:** Singleton pattern with proper synchronization
- **Environment-Aware:** Different configurations for test/dev/prod
- **Clean Architecture:** Maintains layer separation

### ✅ COMPLETED - Billing Domain Features
**Create Client Use Case (UC-B-001):**
- **Full validation:** Email format, name length, phone format
- **Business Rules:** Email uniqueness, field constraints
- **Error Handling:** Structured validation and domain errors
- **REST API:** Complete POST /api/v1/clients endpoint
- **Storage:** Both in-memory (tests) and PostgreSQL implementations

### 🚧 IN PROGRESS - Additional Use Cases
**Next Priority:**
- Get Client (UC-B-002)
- Update Client (UC-B-003)
- Delete Client (UC-B-004)
- List Clients (UC-B-005)

## Technical Achievements

### Architecture Decisions
- **Clean Architecture:** Clear separation of concerns with DDD principles
- **Dependency Injection:** Custom DI container with lazy initialization
- **Configuration Hierarchy:** Base YAML + environment overrides + env variables
- **Storage Abstraction:** Interface-based storage with memory and PostgreSQL implementations
- **Migration Strategy:** golang-migrate for version-controlled schema changes

### Advanced Testing Strategy
- **Dual Storage Approach:** Memory for unit tests, PostgreSQL for integration tests
- **Docker Container Recreation:** Fresh database state for every test run
- **Smart PostgreSQL Detection:** Automatically handles Docker vs local PostgreSQL
- **Port Conflict Resolution:** Docker uses 5433 to avoid local PostgreSQL conflicts
- **Test Isolation:** No data contamination between test runs
- **CI/CD Optimized:** Works perfectly in automated environments

### Development Environment
- **Make-based Workflow:** Comprehensive commands for all operations
- **Environment Separation:** dev, test, and production databases
- **Auto-setup Commands:** `make dev-setup` for complete environment
- **Smart Test Command:** `make test-all` with automatic PostgreSQL management

### Docker Integration
- **PostgreSQL Management:** Automatic container lifecycle management
- **Test Isolation:** Container recreation for fresh state
- **Port Configuration:** Configurable ports via environment variables
- **CI/CD Ready:** No manual setup required for testing

## Recent Session Summary (August 3, 2025)

### 🎯 Major Accomplishments
1. **Application Dependencies Architecture** - Complete shared-database infrastructure with schema-based service isolation
2. **Test Data Isolation System** - Automatic cleanup using DELETE operations for test isolation
3. **Development Environment Provisioning** - Full dev database setup with proper RBAC
4. **Infrastructure as Code** - Template-based database provisioning for multiple environments
5. **Two-Tier User Model** - Migration users (DDL) and application users (DML) for security

### 🔧 Technical Implementation
- **Shared Database Strategy:** `go-labs-dev` and `go-labs-tst` databases with schema-based service isolation
- **RBAC Implementation:** Service-specific users with least-privilege access (billing_app_dev_user, billing_migration_dev_user)
- **Test Data Cleanup:** DELETE-based cleanup respecting foreign key constraints without requiring superuser permissions
- **Infrastructure Templates:** Jinja2-based templates for reproducible database provisioning
- **Environment Separation:** Distinct passwords and configurations for dev/test environments

### 📊 Database Architecture
**Schema-Based Service Isolation:**
- **Database:** `go-labs-dev` (development), `go-labs-tst` (testing)
- **Schema:** `billing` (service-specific namespace)
- **Users:** 
  - `billing_migration_dev_user` - DDL operations (schema changes)
  - `billing_app_dev_user` - DML operations (runtime application)
- **Integration Tests:** PostgreSQL storage, real database behavior (`make test-integration`) 
- **Migration Tests:** Auto-migration disabled, manual migration control

**Current Test Strategy:**
- **Unit Tests:** In-memory storage, fast, isolated (`make test-unit`)
- **Integration Tests:** PostgreSQL storage, automatic test data cleanup (`make test-integration`)
- **Test Data Isolation:** DELETE-based cleanup ensuring fresh state for each test

### 🏗️ Infrastructure Architecture
**Application Dependencies Strategy:**
- **Shared Database:** `go-labs-dev` and `go-labs-tst` with schema-based service isolation
- **RBAC Security:** Service-specific users with least-privilege access patterns
- **Infrastructure as Code:** Template-based provisioning with environment separation
- **Test Data Isolation:** Automatic cleanup without requiring superuser permissions

**Key Benefits:**
- **Operational Simplicity:** Shared PostgreSQL instance with service boundaries maintained
- **Security:** Two-tier user model (migration vs application users) 
- **Test Reliability:** Automatic cleanup prevents data contamination between tests
- **Developer Experience:** Environment-specific databases with proper configurations

### 🛠️ Development Workflow
**Database Commands:**
```bash
# Setup development environment
cd ../infrastructure && ./scripts/provision-database.sh dev

# Run migrations
make migrate-up                    # Development database
ENVIRONMENT=test make migrate-up   # Test database

# Run tests with automatic cleanup
make test-unit         # Fast unit tests (memory storage)
make test-integration  # Integration tests (PostgreSQL + cleanup)
make test-all          # Run both test suites
```

**Database Architecture:**
- **Development:** `go-labs-dev` database, `billing` schema
- **Testing:** `go-labs-tst` database with automatic test data cleanup  
- **Users:** Service-specific migration and application users per environment

## Next Steps Identified

### Immediate (Next Session)
1. **Additional Client CRUD Operations** - Implement Get, Update, Delete, List clients
2. **Repository Pattern Implementation** - Abstract data access from storage
3. **Service Layer** - Business logic orchestration

### Short Term
1. **Invoice Domain** - Complete invoice management features
2. **API Documentation** - OpenAPI/Swagger integration
3. **Error Handling Enhancement** - Consistent error responses across layers

### Long Term  
1. **Authentication/Authorization** - JWT-based security
2. **Event-Driven Architecture** - Domain events for cross-domain communication
3. **Performance Optimization** - Caching, query optimization, connection pooling

## Development Patterns Established

### Code Organization
- **Domain Isolation:** Complete separation of billing and catalog
- **Dependency Injection:** Clean, testable API handlers
- **External Test Data:** JSON files in testdata/ directories
- **Business Rules:** Enforced through model validation and state machines

### Testing Patterns
- **Test Data Loading:** runtime.Caller() for reliable path resolution
- **Type Duplication:** Avoid circular imports in test packages
- **Edge Case Coverage:** Comprehensive validation scenarios
- **Business Logic Testing:** Status transitions, overdue detection

### Git Workflow
- **Feature Branches:** Clean separation of work
- **Protected Main:** Pull request workflow for quality
- **Descriptive Commits:** Clear history with Claude Code attribution
- **Documentation:** Comprehensive tracking of decisions and progress

## Key Learning Outcomes (Go for .NET Developer)

### Go-Specific Concepts Learned
- **testdata/ Directories:** Go convention for external test data (excluded from builds)
- **Package Organization:** Clean domain separation without circular dependencies
- **GORM Integration:** Database ORM patterns in Go ecosystem
- **Dependency Injection:** Function-based DI pattern for handlers
- **Build Tags:** Conditional compilation for different environments

### DDD Implementation in Go
- **Domain Models:** Rich entities with business logic
- **Value Objects:** Status enums with validation
- **Business Rules:** Enforced through model methods
- **Repository Pattern:** Interface-based data access (planned)
- **Service Layer:** Orchestration of complex business operations (planned)

## GitHub Integration

### Claude Code Review Integration
**Automated Code Reviews:** Claude can provide code reviews and assistance directly on GitHub pull requests

**How to Request Code Reviews:**
```bash
# Comment on any PR or issue:
@claude please review this PR

# Specific review requests:
@claude can you check the error handling in this code?
@claude please suggest improvements for the billing service
@claude help me optimize this Go code
```

**Available Commands:**
- `@claude review` - General code review
- `@claude test` - Review test coverage and quality
- `@claude security` - Security-focused review
- `@claude performance` - Performance optimization suggestions
- `@claude help` - Get help with specific Go/DDD patterns

**Setup Requirements:**
- ✅ Claude GitHub App installed
- ✅ `ANTHROPIC_API_KEY` configured in repository secrets
- ✅ GitHub Actions workflow enabled (`.github/workflows/claude-code.yml`)

**Benefits:**
- **Context-Aware Reviews:** Claude understands your entire codebase and DDD architecture
- **Go-Specific Guidance:** Tailored advice for Go best practices and idioms
- **Integration Testing:** Reviews integration test strategies and database patterns
- **DDD Validation:** Ensures adherence to Domain-Driven Design principles

---

*Last Updated: August 3, 2025*  
*Session: GitHub integration setup for automated Claude code reviews*  
*Next Focus: Additional Client CRUD operations with repository pattern*