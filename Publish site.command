#!/bin/bash
# Publishes the one-page site to https://jnsingh01.github.io
cd "$(dirname "$0")" || exit 1

printf '\n  Publishing your site to GitHub Pages\n\n'

if [ ! -d .git ]; then
  git init -q
  git branch -M main
  git remote add origin https://github.com/jnsingh01/jnsingh01.github.io.git
fi

git add -A
if git diff --cached --quiet && git rev-parse HEAD >/dev/null 2>&1; then
  echo "  Nothing changed since the last publish."
else
  git commit -q -m "Publish site" && echo "  Committed."
fi

echo "  Pushing..."
if git push -u origin main; then
  printf '\n  Done. Live at https://jnsingh01.github.io within a minute or two.\n\n'
else
  printf '\n  Push failed — read the message above and tell Claude what it said.\n\n'
fi

printf '  Press any key to close.\n'
read -n 1 -s
