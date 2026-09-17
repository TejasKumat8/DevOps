# Git and GitHub Concepts & Experiments

Hands-on lab experiments executed in a scratch repository demonstrating fundamental Git index management and commit isolation mechanisms.

---

## Experiment 1 — `git commit -m` vs `git commit -a -m`

The distinction between these flags relies entirely on how Git handles the **Staging Area (Index)**.

- `git commit -m "msg"`: Commits only files currently staged in the index via `git add`. Modifications made to tracked files that have not been explicitly staged will be ignored.
- `git commit -a -m "msg"`: Automatically stages all *tracked* files that have been modified or deleted before executing the commit, bypassing the explicit `git add` step.
- *Crucial Rule*: Neither command stages *untracked* (newly created) files. New files always require an initial explicit `git add`.

### Interactive Session Terminal Log

```text
$ git init -q -b main .
$ echo "task 1: setup repository" > tasks.txt
$ git add tasks.txt
$ git commit -q -m "initial commit with tasks list" && git log --oneline
5f6bfdb initial commit with tasks list

$ echo "task 2: verify -a flag behavior" >> tasks.txt
$ git status -s
 M tasks.txt

$ git commit -m "attempt commit without -a"
On branch main
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   tasks.txt

no changes added to commit (use "git add" and/or "git commit -a")

$ git commit -a -m "commit with -a successfully stages tracked modification"
[main 62b474a] commit with -a successfully stages tracked modification
 1 file changed, 1 insertion(+)

$ echo "untracked file content" > notes.txt
$ git status -s
?? notes.txt

$ git commit -a -m "attempt -a on untracked file"
On branch main
Untracked files:
  (use "git add <file>..." to include in what will be committed)
	notes.txt

nothing added to commit but untracked files present (use "git add" to track)

$ git log --oneline
62b474a commit with -a successfully stages tracked modification
5f6bfdb initial commit with tasks list
```

### Key Takeaways

1. Executing `git commit -m` without prior `git add` resulted in no changes being committed because modified changes resided strictly in the working tree.
2. The `-a` flag staged and committed modified tracked files in a single unified step.
3. The `-a` flag explicitly ignores untracked files (`notes.txt`). New files must be explicitly tracked using `git add`.

---

## Experiment 2 — `git cherry-pick`

`git cherry-pick` applies the changes introduced by an existing commit from another branch onto the current working branch, generating a brand-new commit hash while preserving the commit diff and message.

This utility is essential when a development branch contains multiple commits but only a specific bug fix or feature commit is required on `main`.

### Session Setup: Creating a `hotfix` Branch with 3 Commits

```text
$ echo "config v1" > config.txt && git add config.txt && git commit -q -m "Add config base"
$ git switch -c hotfix
Switched to a new branch 'hotfix'

$ echo "logging active" > logging.txt && git add logging.txt && git commit -q -m "hotfix: add logging support"
$ echo "config v1 + port fix" > config.txt && git commit -q -a -m "hotfix: update server port configuration"
$ echo "temporary file" > debug.txt && git add debug.txt && git commit -q -m "hotfix: add debug artifact"

$ git log --oneline
951a91c hotfix: add debug artifact
6480118 hotfix: update server port configuration
e69654f hotfix: add logging support
6e0fc16 Add config base
62b474a commit with -a successfully stages tracked modification
5f6bfdb initial commit with tasks list
```

*Objective*: Apply *only* commit `6480118` (the port configuration fix) into `main`, excluding the logging and debug commits.

### Applying Targeted Commit to `main`

```text
$ git switch main
Switched to branch 'main'

$ git cherry-pick 6480118
[main 5dbc089] hotfix: update server port configuration
 Date: Thu Sep 3 21:46:20 2026 +0530
 1 file changed, 1 insertion(+), 1 deletion(-)

$ git log --oneline
5dbc089 hotfix: update server port configuration
6e0fc16 Add config base
62b474a commit with -a successfully stages tracked modification
5f6bfdb initial commit with tasks list

$ ls
config.txt
notes.txt
tasks.txt

$ cat config.txt
config v1 + port fix
```

### Key Takeaways

- Branch `main` now incorporates the port fix from commit `6480118` without introducing `logging.txt` or `debug.txt`.
- The cherry-picked commit received a new commit SHA (`5dbc089`) because its parent commit differed from the original branch history, even though the diff and message remained identical.
- In case of merge conflicts during cherry-picking, Git pauses execution, allowing resolution before completing via `git cherry-pick --continue` (or aborting via `git cherry-pick --abort`).
- Handy variants include: `git cherry-pick A..B` (cherry-pick range of commits), `-n` (apply changes to working directory without committing), and `-x` (append original commit reference hash to commit message).
---

**Tejas Kumat** · Roll No. 24BCS10299
