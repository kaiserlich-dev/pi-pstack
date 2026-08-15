# Pi compatibility

This repository is the original Cursor pstack subtree with a thin Pi compatibility layer.
When a pstack skill uses Cursor terminology, translate it as follows:

- `Task` or `subagent_type` → Pi's `subagent` tool. Call `action: "list"` first and use only executable agents.
- Parallel `Task` calls → one `workflowScript` using `runs.all`; keep one writer per worktree.
- Background tasks → `subagent` with `async: true`; consume results before dependent work.
- Cursor `/loop` → a bounded Pi workflow, project schedule, or session reminder, depending on duration.
- `AskQuestion` → ask directly in chat unless five or more independent decisions justify a structured interview.
- `.cursor/skills` → `.pi/skills` for project-local generated skills.
- `~/.cursor/skills` → `~/.pi/agent/skills` for user-local generated skills.
- `~/.cursor/rules/pstack-models.mdc` → `~/.pi/agent/pstack-models.md`.
- Cursor model slugs → available Pi agents/models; never assume an upstream default slug exists.
- Cursor transcript paths → Pi session files exposed by the current session/runtime.
- Cursor-specific built-ins with no Pi equivalent are skipped explicitly rather than simulated.

Pi's safety and repository rules override pstack. In particular, never push without explicit permission and never let parallel writers share a worktree.
