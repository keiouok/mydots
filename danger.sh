# [WARNING] This program is very danger. 
# please set filename manially, this program is very danger!
function remover () {
    echo 'Removing...'
    git filter-branch --force --index-filter \
      "git rm --cached --ignore-unmatch <filename>" \
      --prune-empty --tag-name-filter cat -- --all
}

