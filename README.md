# Claude TDD Workflow - Development Execution Guide

**A complete Test-Driven Development workflow with collaborative AI review integration for any software project.**

---

## Overview

This repository contains a comprehensive TDD workflow that enforces disciplined development practices through:
- **Strict TDD cycles** (Red → Green → Refactor)
- **Collaborative AI review integration** with Claude GitHub
- **Quality gates and approval checkpoints**
- **Clean Architecture and testing best practices**

**Goal**: When you provide a feature request, Claude follows this exact workflow to deliver production-ready code with your approval at every critical decision point.

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
   • Unit tests: Fast, isolated testing
   • Integration tests: Real database/API behavior
   
5. IMPLEMENT-MINIMAL → Write minimal passing code (Green phase)
   • Just enough code to make tests pass
   • Follow established architecture patterns
   
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
- **High test coverage** for new code
- **Business descriptions** in integration tests

### **🧪 Testing Strategy**  
- **Unit Tests**: Fast, isolated testing of business logic
- **Integration Tests**: Full system behavior with real dependencies
- **External Test Data**: Consistent test scenarios

### **🏗️ Architecture Standards**
- **Clean Architecture**: Proper layer separation and dependency flow
- **Domain-Driven Design**: Rich domain models and business logic encapsulation
- **Error Handling**: Structured error types with user-friendly messages
- **Best Practices**: Language-specific conventions and standard libraries

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
🤖 **Testing Strategy**: Comprehensive test execution  
🤖 **Code Quality**: Architecture compliance and best practices  
🤖 **Git Workflow**: Branch creation, commits, PR generation  
🤖 **Review Integration**: Fetch and analyze Claude GitHub feedback  

---

## Example: Feature Request → Delivered Code

```
You: "Add user authentication to the application"

Me: SYNC → EXPLORE authentication patterns → PLAN implementation
    └── "Here's my plan: [detailed plan]. Should I proceed?"

You: "Yes, proceed"

Me: TEST-FIRST → Write failing authentication tests
    IMPLEMENT-MINIMAL → Add authentication logic  
    REFACTOR → Clean up authentication flow
    COMMIT & CREATE PR → feature/user-authentication

Claude GitHub: Reviews code → Suggests security improvements

Me: "Claude GitHub suggests: [security fixes, code improvements]. Should I implement these?"

You: "Apply security fixes, skip style changes"  

Me: Apply security improvements → Push changes → Claude GitHub reviews again
    "Claude GitHub has no more recommendations. Should I merge the PR?"

You: "Yes, merge"

Me: Merge to main → Delete feature branch → Workflow complete ✅

Result: User authentication feature live in production with comprehensive tests
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
❌ **Never**: Break established architecture principles  

---

## Success Indicators

✅ **Feature delivered** with comprehensive test coverage  
✅ **TDD cycles documented** (Red → Green → Refactor)  
✅ **Claude GitHub approval** with quality improvements applied  
✅ **Your approval** at all decision points  
✅ **Production-ready code** merged to main branch  

---

## How to Use This Workflow

### **Setup**
1. Copy the `.claude/` directory to your project root
2. Update `CLAUDE.md` with your project-specific context
3. Configure Claude Code to use these workflow commands

### **Usage**
1. Provide a feature request to Claude Code
2. I'll automatically follow the 10-phase workflow
3. Make approval decisions at each checkpoint
4. Receive production-ready code with comprehensive tests

### **Customization**
- Modify commands in `.claude/commands/` for your specific needs
- Update testing strategies in `CLAUDE.md` for your tech stack
- Adjust architecture standards for your project requirements

---

**This workflow ensures disciplined development with collaborative decision-making at every critical juncture.**

*Ready to deliver high-quality features with TDD and collaborative AI review integration.*