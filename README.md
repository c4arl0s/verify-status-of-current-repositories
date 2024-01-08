# VerifyStatusRepositoriesScript

This script was created to remember me if a repository has changes or files are untracked

Console output:

```console
$ ./verifyStatus.sh                                          
./prn repository is untracked
./SupportProjects is not a git repository
./ValidateData repository has changes
./language-validator repository has changes
./2Agile-methodologies-for-mobile-development repository is untracked
./Images repository has changes
./ChronoList repository has changes
./4ThePowerOfAlgorithmsInObjectiveC repository has changes
./vid2gif is not a git repository
./IntermediateTableViews repository has changes
./Locymaps repository is untracked
./if repository is untracked
./SavingData repository has changes
./trad3 repository has changes
./Algorithms repository has changes
./7Localization repository is untracked
```

# Code

```bash
#!/bin/bash

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
```
