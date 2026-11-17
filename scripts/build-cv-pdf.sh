#!/bin/zsh
# Regenerates the one-page CV PDFs (PL and EN) from cv.html with headless Chrome.
# Usage: ./scripts/build-cv-pdf.sh
set -e
cd "$(dirname "$0")/.."
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
mkdir -p assets/cv
for LANG_CODE in pl en; do
  OUT="assets/cv/CV_Marcin_Jedrzejak_${LANG_CODE:u}.pdf"
  "$CHROME" --headless=new --disable-gpu --no-pdf-header-footer \
    --virtual-time-budget=8000 --print-to-pdf="$OUT" \
    "file://$PWD/cv.html?lang=$LANG_CODE" 2>/dev/null
  echo "Wrote $OUT"
done
