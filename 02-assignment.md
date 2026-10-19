# Lab 2: Filesystem, Users and Permissions

**Time:** Until the end of the session (Around 60 minutes)

**Submit:** Fill in `answers.md` in this repository, then commit and push before the end of the session.

---

## Setup: do this first

```bash
bash setup.sh
cd ~/lab2/techcorp
```

This creates a small company directory tree. Every question below refers to it.
Do **not** edit `setup.sh`. If you break something badly, re-run it to start fresh.

For each question, write **both the command you used and its output** in `answers.md`.
A correct answer with no command earns no marks — we are marking the method.

---

## Part A: Creating and Organizing

**A1.** Print the absolute path of the `techcorp` directory.

**A2.** Create this structure in one command:
`projects/2026/{alpha,beta,gamma}`

**A3.** Create an empty file `projects/2026/alpha/README.md`, then confirm it exists and is empty.

**A4.** Copy the whole `hr/policies` directory into `projects/2026/beta/`. Verify both files arrived.

**A5.** Rename `projects/2026/gamma` to `projects/2026/delta`.

**A6.** Inside `shared/`, create a symbolic link named api_link that points to `engineering/docs/api.md`.

**A7.** Display the contents of the linked file (via the link created). What do you observe?

--

## Part B: Users and Groups

**B1.** Print your own username, UID, GID and group memberships.

**B2.** Create a group called `engineering` and a group called `finance`.

**B3.** Create two users, `alice` and `bob`, each with a home directory.

**B4.** Add `alice` to `engineering` and `bob` to `finance`. Then add `alice` to `finance` as well — **without removing her from `engineering`**.

**B5.** Show the group memberships of both users to prove B4 worked.

--

## Part C: Permissions

**C1.** `engineering/src/build.sh` is a script but will not run. Show the error, explain the cause, fix it with a **symbolic** chmod (not octal), and demonstrate that it now runs.

**C2.** Three files in the tree are **world-writable**, which is a security problem. Find all three using a single `find` command.

**C3.** After finding the 3 files, remove write permission for other users from all three.

**C4.** Create a file `shared/team.txt`. Change its group ownership to `engineering`
