#!/usr/bin/env bash
# Lab 2 — environment generator. Run once: bash setup.sh
set -e
ROOT="$HOME/lab2/techcorp"
rm -rf "$HOME/lab2"
mkdir -p "$ROOT"

mkdir -p "$ROOT"/{engineering/{src,builds,docs},hr/{records,policies},finance/{invoices,reports},shared,archive/2024,archive/2025}

# engineering source files
for i in $(seq 1 14); do echo "// module $i" > "$ROOT/engineering/src/mod_$i.c"; done
for i in $(seq 1 6); do head -c 2000 /dev/urandom > "$ROOT/engineering/builds/build_$i.bin"; done
echo "design notes" > "$ROOT/engineering/docs/design.md"
echo "api reference" > "$ROOT/engineering/docs/api.md"
echo "old design" > "$ROOT/engineering/docs/design.md.bak"

# logs of differing sizes
mkdir -p "$ROOT/var/log"
head -c 500   /dev/urandom > "$ROOT/var/log/app.log"
head -c 3000  /dev/urandom > "$ROOT/var/log/error.log"
head -c 12000 /dev/urandom > "$ROOT/var/log/access.log"
head -c 800   /dev/urandom > "$ROOT/var/log/debug.log"
head -c 40000 /dev/urandom > "$ROOT/var/log/audit.log"

# hr and finance
for n in anna bora cem deniz ela; do echo "record for $n" > "$ROOT/hr/records/$n.txt"; done
echo "leave policy" > "$ROOT/hr/policies/leave.txt"
echo "remote policy" > "$ROOT/hr/policies/remote.txt"
for i in 101 102 103 104 105 106 107; do echo "invoice $i" > "$ROOT/finance/invoices/inv_$i.csv"; done
echo "q1 report" > "$ROOT/finance/reports/q1.csv"
echo "q2 report" > "$ROOT/finance/reports/q2.csv"

# archive with old timestamps
for i in 1 2 3; do echo "archived $i" > "$ROOT/archive/2024/old_$i.txt"; touch -d "2024-03-0$i" "$ROOT/archive/2024/old_$i.txt"; done
for i in 1 2; do echo "archived $i" > "$ROOT/archive/2025/old_$i.txt"; touch -d "2025-06-0$i" "$ROOT/archive/2025/old_$i.txt"; done

# links
ln -s "$ROOT/engineering/docs/design.md" "$ROOT/shared/design_link"
ln    "$ROOT/finance/reports/q1.csv"     "$ROOT/shared/q1_hard"
ln -s "$ROOT/engineering/docs/missing.md" "$ROOT/shared/broken_link"

# deliberately dangerous permissions — students must find and fix these
chmod 777 "$ROOT/hr/records/anna.txt"
chmod 666 "$ROOT/finance/invoices/inv_103.csv"
chmod 777 "$ROOT/engineering/src/mod_7.c"

# a directory students cannot enter until they fix it
mkdir -p "$ROOT/engineering/locked"
echo "secret" > "$ROOT/engineering/locked/flag.txt"
chmod 600 "$ROOT/engineering/locked"

# executables without exec bit
echo '#!/bin/bash' > "$ROOT/engineering/src/build.sh"
echo 'echo building' >> "$ROOT/engineering/src/build.sh"
chmod 644 "$ROOT/engineering/src/build.sh"

# hidden files
echo "SECRET_KEY=abc123" > "$ROOT/.env"
echo "cache" > "$ROOT/engineering/.cache"

echo "Setup complete: $ROOT"
