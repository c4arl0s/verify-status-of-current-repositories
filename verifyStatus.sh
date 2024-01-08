# find .      execute find in current directory
# -name "*"   all files by name
# -type       
# f           file
# d           directory
# |           pipe
# sort -n -r  
# -maxdepth 1	maximum depth equals 1 (current directory)

find . -name "*" -type d -maxdepth 1 | while read directory_name; do
  git --git-dir=${directory_name}/.git --work-tree=${directory_name} status >/dev/null 2>&1
  if [ $? -ne 0 ]; then
    echo "${directory_name} is not a git repository"
    continue
  fi

  repository_status=$(git --git-dir=${directory_name}/.git --work-tree=${directory_name} status | grep "\buntracked\|no\b" | tail -1)
    
  if [[ "${repository_status}" == *"untracked"* ]]; then
    echo "${directory_name} repository is untracked"
  elif [[ "${repository_status}" == *"no"* ]]; then 
    echo "${directory_name} repository has changes"
  fi
done
