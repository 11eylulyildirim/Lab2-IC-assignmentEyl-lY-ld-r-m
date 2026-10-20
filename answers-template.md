# Lab 2: Answers

Name: Eylül Yıldırım
Student ID: 20241701017

> For each question write **the command you used** and **its output**.
> Use code blocks like this:
>
> ```
> $ pwd
> /home/student/lab2/techcorp
> ```

## Part A: Navigation and inspection

**A1.**

```
pwd
output: /home/codespace/lab2/techcorp
```

**A2.**

$ mkdir -p projects/2026/{alpha,beta,gamma}

$ ls projects/2026
output: alpha  beta  gamma

**A3.**

$ touch projects/2026/alpha/README.md

$ ls -l projects/2026/alpha/README.md
output: -rw-r--r-- 1 codespace codespace 0 Oct 20 08:54 projects/2026/alpha/README.md

**A4.**

cp -r hr/policies projects/2026/beta/

find projects/2026/beta/policies -type f
output: projects/2026/beta/policies/remote.txt
projects/2026/beta/policies/leave.txt

**A5.**

mv projects/2026/gamma projects/2026/delta

ls projects/2026
output: alpha  beta  delta

**A6.**

ln -s ../engineering/docs/api.md shared/api_link

ls -l shared/api_link
output: lrwxrwxrwx 1 codespace codespace 26 Oct 20 08:56 shared/api_link -> ../engineering/docs/api.md

**A7.**

cat shared/api_link

output: api reference

## Part B: Creating and organising

**B1.**

id

uid=1000(codespace) gid=1000(codespace) groups=1000(codespace),986(pipx),987(python),988(oryx),989(golang),990(docker),991(sdkman),992(ruby),993(php),994(conda),995(nvm),996(hugo),1001(ssh)

**B2.**

sudo groupadd engineering
sudo groupadd finance

output: groupadd: group 'engineering' already exists
groupadd: group 'finance' already exists

 getent group engineering finance
 output: engineering:x:1002:alice
finance:x:1003:bob,alice

**B3.**

sudo useradd -m alice
sudo useradd -m bob

output: useradd: user 'alice' already exists
useradd: user 'bob' already exists

ls -ld /home/alice /home/bob
output: drwxr-x--- 2 alice alice 4096 Oct 20 08:46 /home/alice
drwxr-x--- 2 bob   bob   4096 Oct 20 08:46 /home/bob

**B4.**

sudo usermod -aG engineering alice
sudo usermod -aG finance bob
sudo usermod -aG finance alice

```

**B5.**

id alice
id bob

output: uid=1001(alice) gid=1004(alice) groups=1004(alice),1002(engineering),1003(finance)
uid=1002(bob) gid=1005(bob) groups=1005(bob),1003(finance)

**B6.**

```

```

## Part C — Users and groups

**C1.**

./engineering/src/build.sh
output: bash: ./engineering/src/build.sh: Permission denied

ls -l engineering/src/build.sh
output: -rw-r--r-- 1 codespace codespace 26 Oct 20 08:52 engineering/src/build.sh

chmod u+x engineering/src/build.sh
./engineering/src/build.sh
output: building
**C2.**

find . -type f -perm -0002
output: ./hr/records/anna.txt
./finance/invoices/inv_103.csv
find: ‘./engineering/locked/flag.txt’: Permission denied
./engineering/src/mod_7.c

**C3.**

find . -type f -perm -0002 -exec chmod o-w {} +
output: find: ‘./engineering/locked/flag.txt’: Permission denied

find . -type f -perm -0002
find: ‘./engineering/locked/flag.txt’: Permission denied
**C4.**

touch shared/team.txt
sudo chgrp engineering shared/team.txt
ls -l shared/team.txt
output: -rw-r--r-- 1 codespace engineering 0 Oct 20 09:06 shared/team.txt
