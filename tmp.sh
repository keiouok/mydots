git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch .bashrc" \
  --prune-empty --tag-name-filter cat -- --all
