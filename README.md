# Introduction to `git` and GitHub

A hands-on 1-day course covering version control with Git and collaboration on GitHub.
Designed for researchers at the University of Zurich / Comprehensive Cancer Center Zurich (CCCZ), University Hospital Zurich.

## Acknowledgements

| | |
|---|---|
| <img src="assets/images/krauthammer.jpg" width="150" style="vertical-align: middle;"> | <img src="assets/images/cccz.jpg" width="350" style="vertical-align: middle;"> |
| We thank [Prof. Michael Krauthammer](https://krauthammerlab.ch/authors/michaelkrauthammer/) for supporting this course. | Special thanks to **CCCZ** — Dr. Maja Zenz and Ms. Silke Uflacker — for providing coffee breaks. |

---

**Instructor:** Deepak Tanwar — [deepak.tanwar@uzh.ch](mailto:deepak.tanwar@uzh.ch)

---

## Course Format

| | |
|---|---|
| **Format** | 1-day intensive workshop |
| **Duration** | 09:00 – 17:00 |
| **Audience** | Researchers with little or no Git experience |
| **Prerequisites** | See [setup.md](setup.md) — complete before the course |

---

## Day Schedule

| Time | Session | Topics | Exercises |
|------|---------|---------|-----------|
| 09:00–09:30 | Welcome | Introductions, why version control, course overview | — |
| 09:30–10:30 | **Module 1: Concepts & GitHub** | Version control problem, Git vs others, terminologies, GitHub account, Markdown | Ex 1, Ex 2 |
| 10:30–11:00 | *Break* | | |
| 10:45–12:00 | **Module 2: Local Git** | `init`, `status`, `add`, `commit`, `log`, staging area, `diff`, HEAD | Ex 3 |
| 12:00–13:00 | *Lunch* | | |
| 13:00–14:30 | **Module 3: Branching & History** | `branch`, `checkout`, `merge`, merge conflicts, `git log --oneline`, `.gitignore`, `reset` | Ex 4 |
| 14:30–14:45 | *Break* | | |
| 14:45–16:00 | **Module 4: GitHub Collaboration** | SSH setup, `remote`, `push`, `pull`, `clone`, Issues, Projects, Pull Requests, Fork | Ex 5, Ex 6 |
| 16:00–16:45 | **Final Exercise** | Full workflow: local → branch → push → PR | [final_exercise.md](final_exercise.md) |
| 16:45–17:00 | Wrap-up | Q&A, cheat sheet, next steps, feedback | — |

---

## Module Overview

### Module 1 — Concepts & GitHub (60 min)
- The version control problem (FINAL.doc, manuscript revisions)
- What is Git? What is GitHub? Why not just email files?
- Key terminologies: repository, commit, branch, fork, pull request
- Create a GitHub account and first repository
- Markdown basics: headings, bold, lists, tables, links, code blocks
- **Applications in bioinformatics:** reproducible data analysis, collaborative scripts

### Module 2 — Local Git (75 min)
- Installing and configuring git (`git config`)
- Creating a repository (`git init`)
- The staging area: working directory → stage → repository
- Core commands: `git status`, `git add`, `git commit -m`, `git log`
- Inspecting changes: `git diff`, `git diff --staged`, `git diff HEAD`
- Understanding HEAD and commit hashes

### Module 3 — Branching & History (90 min)
- Why branches? Parallel development without breaking main
- `git branch`, `git checkout`, `git switch`
- Merging branches: `git merge`
- Dealing with merge conflicts
- Exploring history: `git log --oneline`, `git checkout <hash>`
- Ignoring files: `.gitignore`
- Undoing changes: `git reset` (soft vs hard)

### Module 4 — GitHub Collaboration (75 min)
- SSH key setup (local ↔ GitHub authentication)
- Connecting local repo to GitHub: `git remote add`
- Sharing your work: `git push`, `git pull`
- Getting others' work: `git clone`
- Tracking issues: creating, assigning, labelling
- GitHub Projects: kanban board for your repo
- Contributing: Fork → branch → commit → Pull Request

---

## Exercises

| Exercise | Topic | When |
|----------|-------|------|
| Ex 1 | GitHub account + first repo | Module 1 |
| Ex 2 | Write README.md with Markdown | Module 1 |
| Ex 3 | Local git workflow (init → add → commit → log → diff) | Module 2 |
| Ex 4 | Branching, merging, .gitignore | Module 3 |
| Ex 5 | SSH setup + push local repo to GitHub | Module 4 |
| Ex 6 | Fork → branch → PR on course repo | Module 4 |
| Final | Full workflow combining all modules | End of day |

---

Visit the course website: [https://dqbm-cccz.github.io/intro_git_github/](https://dqbm-cccz.github.io/intro_git_github/)

Access slides, exercises, cheat sheets, and schedule there.
