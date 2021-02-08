# [WARNING] This program is very danger. 
# Please set filename manially, this program is very danger.
# You can delete the file historically.
file='.bashrc'
echo 'Removing...'
git filter-branch --force --index-filter \
  "git rm --cached --ignore-unmatch $file" \
  --prune-empty --tag-name-filter cat -- --all
