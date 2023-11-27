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
# find .      execute find in current directory
# -name "*"   all files by name
# -type       
# f           file
# d           directory
# |           pipe
# sort -n -r  
# -maxdepth 1	maximum depth equals 1 (current directory)

find . -name "*" -type d -maxdepth 1 | while read DIRECTORYNAME
do
    if ! git --git-dir=$DIRECTORYNAME/.git --work-tree=$DIRECTORYNAME status >/dev/null 2>&1; then
       echo "$DIRECTORYNAME is not a git repository"
       continue
    fi

    STATUS=`git --git-dir=$DIRECTORYNAME/.git --work-tree=$DIRECTORYNAME status | grep "\buntracked\|no\b" | tail -1`
    
    if [[ $STATUS == *"untracked"* ]]; then
        echo "$DIRECTORYNAME repository is untracked"
    elif [[ $STATUS == *"no"* ]]; then 
        echo "$DIRECTORYNAME repository has changes"
    fi
done
```
