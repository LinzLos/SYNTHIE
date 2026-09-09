#!/bin/sh
# SYNTHIE .xml/.txt parity guard (ported from FLOWIE's, issue #1).
#
# The script ships as two hand-maintained files that must stay identical,
# except that the .txt opens with a short usage preamble before its "<?xml"
# line. This check fails if they differ anywhere else. (Before v1.5 the .txt
# was a byte-for-byte copy of the .xml with no preamble, so the "paste it into
# a chat" path handed non-agent users raw tags with no guidance.)
#
# Usage, from the repo root:
#   scripts/check_parity.sh                    # checks the pair in manifest.json
#   scripts/check_parity.sh FILE.xml FILE.txt  # checks an explicit pair
#
# Run it before cutting a release; wire into a pre-commit hook or CI if desired.

set -eu

cd "$(dirname "$0")/.."

if [ $# -eq 2 ]; then
  xml=$1
  txt=$2
else
  xml=$(sed -n 's/^ *"xml": *"\(.*\)".*/\1/p' manifest.json)
  txt=$(sed -n 's/^ *"txt": *"\(.*\)".*/\1/p' manifest.json)
fi

[ -f "$xml" ] || { echo "parity FAIL: missing $xml (check manifest.json)"; exit 1; }
[ -f "$txt" ] || { echo "parity FAIL: missing $txt (check manifest.json)"; exit 1; }
grep -q '^<?xml' "$txt" || { echo "parity FAIL: no <?xml line in $txt — preamble must be followed by the full XML body"; exit 1; }

# Well-formedness: a release must be parseable XML. The diff below only proves
# the two files match — it would happily pass a matched pair that no parser can
# read (a stray double quote inside a step label is the easy way to do this).
if command -v xmllint >/dev/null 2>&1; then
  if ! xmllint --noout "$xml" 2>/tmp/parity_xmllint.$$; then
    echo "parity FAIL: $xml is not well-formed XML:"
    sed -n '1,10p' /tmp/parity_xmllint.$$
    rm -f /tmp/parity_xmllint.$$
    exit 1
  fi
  rm -f /tmp/parity_xmllint.$$
  echo "xml OK: $xml is well-formed"
else
  echo "parity WARN: xmllint not found — skipping the well-formedness check"
fi

# The .txt body is everything from its "<?xml" line onward.
if awk '/^<\?xml/{f=1} f' "$txt" | diff -u - "$xml"; then
  echo "parity OK: $xml matches the $txt body"
else
  echo "parity FAIL: $xml and $txt have drifted (diff above; '-' is the .txt body)."
  echo "Versions ship in sync — apply every script edit to BOTH files;"
  echo "only the .txt usage preamble may differ."
  exit 1
fi
