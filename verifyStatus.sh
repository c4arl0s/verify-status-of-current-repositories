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
