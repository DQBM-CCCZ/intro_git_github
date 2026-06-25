# Module 4 Slide Content — GitHub Collaboration
# (Missing from current presentation — add these slides)

---

## Slide: Connecting Local to Remote

**Title:** Connecting your local repository to GitHub

**Diagram:**
```
[Your Computer]              [GitHub]
  local repo    <--push-->   remote repo
                <--pull--
```

**Commands:**
```bash
git remote add origin git@github.com:USERNAME/REPO.git
git remote -v
```

**Key points:**
- `origin` is just a name — by convention it refers to GitHub
- The SSH URL (`git@github.com:...`) uses your SSH key for authentication
- The HTTPS URL (`https://github.com/...`) requires username + token

---

## Slide: git push

**Title:** `git push` — Share your commits with GitHub

**Diagram:**
```
[local commits] ----push----> [GitHub]
```

```bash
# First time — set upstream and push
git push -u origin main

# After that, just:
git push
```

**Key points:**
- Only pushes commits — not uncommitted changes
- `-u` sets the default upstream so future `git push` needs no arguments
- If someone else pushed since your last pull, you must `git pull` first

---

## Slide: git pull

**Title:** `git pull` — Get the latest changes from GitHub

**Diagram:**
```
[GitHub] ----fetch + merge----> [local repo]
```

```bash
git pull
```

**Under the hood — two steps:**
```bash
git fetch    # download new commits from GitHub
git merge    # merge them into your current branch
```

**Key points:**
- Run `git pull` at the start of every work session
- If you and a collaborator edited the same file, a merge conflict may occur

---

## Slide: git clone

**Title:** `git clone` — Copy a repository to your machine

**Diagram:**
```
[GitHub repo] ----clone----> [new folder on your machine]
```

```bash
git clone git@github.com:DQBM-SIB/intro_git_github.git

# Clone into a specific folder name
git clone git@github.com:DQBM-SIB/intro_git_github.git my-folder
```

**Key points:**
- Creates a complete copy including full history
- Automatically sets up `origin` pointing back to GitHub
- Use clone when starting fresh; use `git pull` when you already have a local copy

---

## Slide: The Full Remote Workflow

**Title:** Putting it all together

```
1. git clone <url>          # get the repo (first time only)
   -- or --
   git pull                 # get latest changes (ongoing)

2. git checkout -b feature  # create a branch

3. # make your changes...

4. git add --all
   git commit -m "message"

5. git push origin feature  # share your branch

6. Open Pull Request on GitHub

7. After merge:
   git checkout main
   git pull                 # bring in the merged changes
```

---

## Slide: Issues on GitHub

**Title:** GitHub Issues — Track tasks and bugs

**What issues are for:**
- Bug reports: "The script crashes on line 42"
- Feature requests: "Add support for paired-end reads"
- Tasks: "Write documentation for the pipeline"
- Discussion: "Should we use Python or R for this?"

**How to use them:**
1. Go to your repo → **Issues** → **New issue**
2. Write a clear title and description
3. Assign it to yourself or a collaborator
4. Add labels (bug, enhancement, documentation…)
5. Link to a project board

**Reference issues in commits:**
```bash
git commit -m "fixed alignment bug, closes #12"
```
This automatically closes issue #12 when the commit is merged.

---

## Slide: GitHub Projects

**Title:** GitHub Projects — Kanban board for your repo

**What it is:**
A visual board to track progress across issues and pull requests.

**Columns (typical setup):**
```
| To Do          | In Progress    | Done           |
|----------------|----------------|----------------|
| Issue #1       | Issue #3       | Issue #2       |
| Issue #4       |                |                |
```

**How to set up:**
1. Go to repo → **Projects** → **New project**
2. Choose **Board** template
3. Add your issues to the board
4. Drag cards between columns as work progresses

---

## Slide: Pull Requests

**Title:** Pull Requests — Propose and review changes

**What a PR is:**
A request to merge changes from one branch into another.
It opens a discussion where collaborators can review, comment, and approve.

**PR workflow:**
```
1. Push your branch:     git push origin my-feature
2. On GitHub:            Compare & pull request
3. Write description:    What does this change? Why?
4. Request review:       Assign a reviewer
5. Address comments:     Push more commits to the same branch
6. Merge:               Click "Merge pull request"
```

**Good PR title examples:**
- `Add quality control step to RNA-seq pipeline`
- `Fix typo in methods section`
- `Update README with installation instructions`

**Bad PR title:**
- `changes` / `update` / `fix`

---

## Slide: Fork vs Clone

**Title:** Fork vs Clone — What's the difference?

| | Fork | Clone |
|--|------|-------|
| **Where** | GitHub (server-side copy) | Your machine (local copy) |
| **When** | Contributing to someone else's repo | Getting a repo to work locally |
| **Result** | Your own GitHub copy | Local folder linked to remote |
| **Push to** | Your fork | The original (if you have permission) |

**Typical fork workflow:**
```
Fork on GitHub → Clone your fork → Branch → 
Edit → Push to fork → Pull Request to original
```
