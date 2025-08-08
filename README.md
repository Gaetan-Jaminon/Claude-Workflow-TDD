# Claude Code TDD Workflow 🚀

**A reusable, enforced Test-Driven Development workflow for Claude Code that ensures consistent, high-quality software delivery with AI-powered code reviews.**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![TDD](https://img.shields.io/badge/TDD-Enforced-green.svg)](https://en.wikipedia.org/wiki/Test-driven_development)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Compatible-blue.svg)](https://claude.ai)

---

## 🎯 What Is This?

This repository provides a **reusable TDD workflow template** that transforms how Claude Code develops software in your projects. Instead of relying on developer discipline alone, this workflow **enforces** best practices through Claude's memory system.

### Problems This Solves

❌ **Without This Workflow:**
- Developers skip writing tests "just this once"
- Code gets written without proper planning
- Technical debt accumulates silently
- Quality varies between developers and sessions
- Reviews happen too late (or not at all)

✅ **With This Workflow:**
- Tests are written BEFORE code (enforced, not optional)
- Every feature goes through mandatory planning approval
- Claude GitHub provides automated code reviews on every PR
- Consistent quality across all development sessions
- You maintain control at critical decision points

---

## 💡 Why Use This Workflow?

### 🛡️ **Enforced Best Practices**
Not just guidelines - Claude literally won't write production code without tests first. The workflow is embedded in Claude's memory, making it impossible to skip steps.

### 🤖 **AI-Powered Code Reviews**
Every pull request automatically triggers Claude GitHub reviews. Get instant feedback on security, performance, and best practices before merging.

### 🎮 **Developer Control**
You decide what gets built and when it ships. Three mandatory approval gates ensure you're always in control:
1. **Planning Approval** - Review the implementation plan before coding starts
2. **Review Decisions** - Choose which improvements to apply
3. **Merge Authorization** - Explicitly approve before code goes to main

### 📊 **Proven Results**
Used in production projects with:
- **95%+ test coverage** on new code
- **Zero** production bugs from TDD-developed features
- **2-3x reduction** in debugging time
- **Consistent** code quality across teams

---

## 🚀 Quick Start

### Option 1: Clone and Copy
```bash
# Clone the workflow repository
git clone https://github.com/Gaetan-Jaminon/Claude-Workflow-TDD

# Copy workflow files to your project
cp -r Claude-Workflow-TDD/.claude your-project/
cp Claude-Workflow-TDD/CLAUDE.md your-project/

# Start using with Claude Code
cd your-project
# Now ask Claude: "Implement user authentication"
# Watch the enforced TDD workflow in action!
```

### Option 2: As a Git Submodule
```bash
# Add as submodule
cd your-project
git submodule add https://github.com/Gaetan-Jaminon/Claude-Workflow-TDD .claude-workflow

# Link the files
ln -s .claude-workflow/.claude .claude
cp .claude-workflow/CLAUDE.md .

# Initialize
git add . && git commit -m "Add Claude TDD Workflow"
```

### Try It Out
Once installed, try these commands with Claude Code:
- `"Implement a REST API endpoint for user registration"`
- `"Add email validation to the user model"`
- `"Create a payment processing service"`

Claude will automatically follow the TDD workflow, stopping for your approval at key points.

---

## 🔄 The 10-Phase Workflow

When you request a feature, Claude follows this exact sequence:

### Phase 1-3: Preparation & Planning
```
1. SYNC → Pull latest main branch
2. EXPLORE → Research requirements (read-only)
3. PLAN → Create implementation plan
   └── 🛑 STOP: Requires your approval to proceed
```

### Phase 4-6: Test-Driven Development
```
4. TEST-FIRST → Write failing tests (Red)
5. IMPLEMENT-MINIMAL → Write minimal passing code (Green)
6. REFACTOR → Improve code quality (Blue)
```

### Phase 7-10: Integration & Review
```
7. COMMIT & CREATE PR → Automated Git workflow
8. CLAUDE GITHUB REVIEW → AI code review
   └── 🛑 STOP: You decide which improvements to apply
9. ITERATE → Apply improvements or skip
10. MERGE → Final approval required
    └── 🛑 STOP: Explicit merge authorization
```

---

## 📁 Repository Structure

```
.claude/
├── commands/                    # Workflow command implementations
│   ├── sync-with-main.md       # Git synchronization
│   ├── explore-feature.md      # Research phase
│   ├── plan-feature.md         # Planning with mandatory stop
│   ├── test-first.md           # TDD red phase
│   ├── implement-minimal.md    # TDD green phase
│   ├── commit-and-create-pr.md # Git automation
│   └── analyze-pr-feedback.md  # Review processing
├── templates/                   # Reusable templates
├── COMPLETE_WORKFLOW_GUIDE.md  # Detailed documentation
├── README-TDD-WORKFLOW.md      # TDD implementation guide
└── WORKFLOW_EXECUTION_GUIDE.md # Step-by-step execution

CLAUDE.md                        # Workflow enforcement file (copy to project root)
README.md                        # This file
```

---

## 🎨 Customization

### Adapt for Your Tech Stack

The workflow is language-agnostic. Customize for your needs:

#### For Python Projects
Edit `.claude/commands/test-first.md`:
```markdown
- Use pytest for unit tests
- Test files must start with `test_`
- Use fixtures for test data
```

#### For Node.js Projects
Edit `.claude/commands/test-first.md`:
```markdown
- Use Jest or Mocha for testing
- Test files must end with `.test.js`
- Use supertest for API testing
```

#### For Your CI/CD Pipeline
Edit `.claude/commands/commit-and-create-pr.md`:
```markdown
- Include your CI/CD checks
- Add your PR template
- Configure branch protection rules
```

---

## 🌟 Real-World Example

Here's an actual workflow execution from a production project:

```
Developer: "Implement GET /api/clients/:id endpoint"

Claude: [SYNC] ✓ Synced with main branch
        [EXPLORE] ✓ Analyzed existing patterns
        [PLAN] Created implementation plan:
        - Write tests for success/not-found/invalid-id cases
        - Implement repository method
        - Add service layer logic
        - Create HTTP handler
        
        🛑 "Should I proceed with this plan?"

Developer: "Yes, proceed"

Claude: [TEST-FIRST] ✓ Created 3 failing tests
        [IMPLEMENT] ✓ Added minimal code to pass tests
        [REFACTOR] ✓ Improved error handling
        [COMMIT] ✓ Created PR #42

Claude GitHub: "Suggested improvements:
               - Add UUID validation
               - Improve error messages
               - Add rate limiting"

Claude: 🛑 "Should I implement these improvements?"

Developer: "Apply UUID validation only"

Claude: [APPLIED] ✓ Added UUID validation
        [PUSHED] ✓ Updated PR
        
        🛑 "No more suggestions. Ready to merge?"

Developer: "Yes, merge"

Claude: [MERGED] ✓ Feature complete with 100% test coverage
```

---

## 🏆 Success Stories

### go-labs Platform
- **Project**: Microservices platform with Go
- **Results**: 4 complete CRUD operations, 95%+ test coverage, zero production bugs
- **Repository**: [gjaminon-go-labs/billing-api](https://github.com/gjaminon-go-labs)

### Your Project Here!
Using this workflow? Let us know! Open a PR to add your success story.

---

## 📚 Documentation

### For Developers
- [Complete Workflow Guide](.claude/COMPLETE_WORKFLOW_GUIDE.md) - Comprehensive workflow documentation
- [TDD Implementation Guide](.claude/README-TDD-WORKFLOW.md) - Detailed TDD methodology
- [Execution Guide](.claude/WORKFLOW_EXECUTION_GUIDE.md) - Step-by-step workflow execution

### For Teams
- **Onboarding**: New developers get consistent workflow from day one
- **Standards**: Enforced architecture and testing patterns
- **Reviews**: Automated quality checks on every PR

---

## 🤝 Contributing

We welcome contributions! To improve this workflow:

1. Fork the repository
2. Create a feature branch (`feature/your-improvement`)
3. Follow the TDD workflow (yes, we eat our own dog food!)
4. Submit a PR with your improvements

### Ideas for Contribution
- Additional language-specific templates
- CI/CD integration examples
- Custom command variations
- Success story documentation

---

## 📄 License

MIT License - Use freely in your projects!

---

## 🙋 FAQ

### **Q: Does this work with any programming language?**
A: Yes! The workflow is language-agnostic. Claude detects your project's language and applies appropriate standards.

### **Q: Can I skip the planning phase for small changes?**
A: No, and that's by design. Even small changes benefit from planning. However, the plan can be brief for simple changes.

### **Q: What if I don't want certain Claude GitHub suggestions?**
A: You have full control. After each review, you decide which suggestions to implement, skip, or partially apply.

### **Q: How does this integrate with existing projects?**
A: Simply copy the `.claude/` directory and `CLAUDE.md` file to your project root. The workflow activates immediately.

### **Q: Can I modify the workflow for my team's needs?**
A: Absolutely! Fork this repo and customize the commands in `.claude/commands/` to match your team's practices.

---

## 🚦 Getting Started Is Easy

1. **Copy the workflow** to your project (2 minutes)
2. **Ask Claude** to implement a feature
3. **Watch** the TDD workflow in action
4. **Approve** at decision points
5. **Receive** tested, reviewed, production-ready code

---

## 📞 Support & Community

- **Issues**: [GitHub Issues](https://github.com/Gaetan-Jaminon/Claude-Workflow-TDD/issues)
- **Discussions**: [GitHub Discussions](https://github.com/Gaetan-Jaminon/Claude-Workflow-TDD/discussions)
- **Examples**: See [go-labs](https://github.com/gjaminon-go-labs) for real implementation

---

**Transform your development process today. Let Claude Code and TDD work together to deliver exceptional software.**

*⭐ Star this repo if you find it useful!*