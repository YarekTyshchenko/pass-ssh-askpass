#!/usr/bin/env bash
# Get password from pass

set -euo pipefail

keyfile=$(echo "$1" | /usr/bin/env sed -n 's/Enter passphrase for \(.*\):\s*$/\1/p');
echo "Extracted key filename $keyfile" >&2
[[ -z "${keyfile}" ]] && exit 1

comment=$(/usr/bin/env ssh-keygen -l -f "$keyfile" | /usr/bin/env awk '{print $3}')
echo "Comment from keyfile $keyfile is $comment" >&2
[[ -z "${comment}" ]] && exit 1

passphrase=$(/usr/bin/env pass show "ssh/$comment")
[[ -z "${passphrase}" ]] && exit 1
echo "got passphrase for comment $comment: XXX" >&2

echo "$passphrase"
