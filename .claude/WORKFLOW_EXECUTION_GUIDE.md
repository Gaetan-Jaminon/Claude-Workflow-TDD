# How Claude Works: Development Workflow Execution Guide

**Quick Reference: When you provide a feature/UC request, here's exactly how I work and what requirements I enforce.**

---

## When You Give Me a Feature Request

**What happens**: I follow a strict 10-phase workflow that enforces TDD, quality standards, and collaborative review.  
**Your role**: Make approval decisions at key checkpoints.  
**End result**: Production-ready code merged to main branch.

---

## The 10-Phase Workflow I Follow

### **Phase 1-3: Preparation (Your Approval Required)**
```
1. SYNC → Pull latest main branch  
2. EXPLORE → Research requirements (read-only, no coding)
3. PLAN → Create detailed implementation plan + test scenarios
   └── STOP: Present plan → Wait for your "Yes, proceed" approval
```

### **Phase 4-6: Test-Driven Development (Automated)**
```
4. TEST-FIRST → Write failing tests (Red phase)
   • Unit tests: In-memory storage, fast feedback
   • Integration tests: PostgreSQL, real database behavior
   
5. IMPLEMENT-MINIMAL → Write minimal passing code (Green phase)
   • Just enough code to make tests pass
   • Follow Clean Architecture + DDD patterns
   
6. REFACTOR → Improve code quality (tests stay green)
```

### **Phase 7-10: Integration & Review (Your Approval Required)**
```
7. COMMIT & CREATE PR → Feature branch + comprehensive PR

8. CLAUDE GITHUB REVIEW LOOP → Iterative improvement cycle
   ├── Claude GitHub reviews code automatically
   ├── I present improvement suggestions  
   └── You decide: "Apply improvements" OR "Skip them"
   
9. LOOP CONTINUES → Until Claude GitHub satisfied OR you say stop

10. MERGE → Only with your explicit "Yes, merge" approval
```

---

## Requirements I Enforce (Non-Negotiable)

### **🔴 TDD Requirements**
- **No production code without failing tests first** (Red → Green → Refactor)
- **95% minimum test coverage** for new code
- **Business descriptions** in all integration tests

### **🧪 Testing Strategy**  
- **Unit Tests**: In-memory storage, domain logic validation, fast feedback
- **Integration Tests**: PostgreSQL storage, full request/response cycles, automatic cleanup
- **External Test Data**: JSON fixtures for consistent scenarios

### **🏗️ Architecture Standards**
- **Clean Architecture**: Domain → Application → Infrastructure → API layers
- **Domain-Driven Design**: Rich entities, value objects, repository pattern  
- **Error Handling**: Structured domain errors with user-friendly messages
- **Go Best Practices**: Standard libraries, proper error wrapping, testify assertions

### **📋 Quality Gates**
- All tests must pass before proceeding
- No overengineering beyond requirements
- Proper git workflow with descriptive commits
- Comprehensive PR documentation

---

## Decision Points Where I Need Your Input

### **🛑 Mandatory Approval Points**

1. **After PLAN Phase**: "Should I proceed with this implementation plan?"
2. **After Claude GitHub Review**: "Should I implement these suggested improvements?"  
3. **Before MERGE**: "Should I merge the PR to main branch?"

### **🤔 Your Decision Options**

**At Planning**: 
- ✅ "Yes, proceed" → Continue to implementation
- ❌ "Modify the plan" → Revise and re-present
- ⏸️ "Not now" → Stop workflow

**At Review**: 
- ✅ "Apply improvements" → Implement suggestions → Continue review loop
- ❌ "Skip improvements" → Ask for merge approval
- 🔄 "Apply some only" → Specify which ones to implement

**At Merge**:
- ✅ "Yes, merge" → Merge to main, delete feature branch, workflow complete
- ❌ "Not ready" → Leave PR open, workflow paused

---

## What You Control

✅ **Feature Scope**: Define requirements and acceptance criteria  
✅ **Implementation Approval**: Approve or modify the technical plan  
✅ **Quality vs Speed**: Decide which review improvements to apply  
✅ **Merge Timing**: Control when code goes to production  
✅ **Workflow Pace**: Pause or continue at any decision point  

---

## What I Control (Automated)

🤖 **TDD Enforcement**: Strict Red-Green-Refactor cycles  
🤖 **Testing Strategy**: Unit + Integration test execution  
🤖 **Code Quality**: Architecture compliance and best practices  
🤖 **Git Workflow**: Branch creation, commits, PR generation  
🤖 **Review Integration**: Fetch and analyze Claude GitHub feedback  

---

## Example: Feature Request → Delivered Code

```
You: "Add email validation to client creation"

Me: SYNC → EXPLORE email validation patterns → PLAN implementation
    └── "Here's my plan: [detailed plan]. Should I proceed?"

You: "Yes, proceed"

Me: TEST-FIRST → Write failing email validation tests
    IMPLEMENT-MINIMAL → Add email validation logic  
    REFACTOR → Clean up validation error messages
    COMMIT & CREATE PR → feature/email-validation

Claude GitHub: Reviews code → Suggests improvements

Me: "Claude GitHub suggests: [X, Y, Z]. Should I implement these?"

You: "Apply X and Y, skip Z"  

Me: Apply improvements → Push changes → Claude GitHub reviews again
    "Claude GitHub has no more recommendations. Should I merge the PR?"

You: "Yes, merge"

Me: Merge to main → Delete feature branch → Workflow complete ✅

Result: Email validation feature live in production with comprehensive tests
```

---

## Available Commands (Optional Usage)

- `/explore-feature` - Trigger exploration phase manually
- `/plan-feature` - Create implementation plan  
- `/test-first` - Write failing tests
- `/implement-minimal` - Write minimal passing code
- `/commit-and-create-pr` - Git workflow automation
- `/analyze-pr-feedback` - Process Claude GitHub review

**Note**: I execute these automatically in the workflow, but you can trigger them individually if needed.

---

## Anti-Patterns I Prevent

❌ **Never**: Write code without tests first  
❌ **Never**: Skip the planning approval step  
❌ **Never**: Implement beyond stated requirements  
❌ **Never**: Auto-merge without your permission  
❌ **Never**: Ignore test failures or coverage gaps  
❌ **Never**: Break Clean Architecture principles  

---

## Success Indicators

✅ **Feature delivered** with comprehensive test coverage  
✅ **TDD cycles documented** (Red → Green → Refactor)  
✅ **Claude GitHub approval** with quality improvements applied  
✅ **Your approval** at all decision points  
✅ **Production-ready code** merged to main branch  

---

**This workflow ensures disciplined development with collaborative decision-making at every critical juncture.**

*When you provide a feature request, I'll execute this workflow with your approval at each decision point.*