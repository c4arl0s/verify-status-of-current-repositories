# find .      execute find in current directory
# -name "*"   all files by name
# -type       
# f           file
# d           directory
# |           pipe
# sort -n -r  
# -maxdepth 1	maximum depth equals 1 (current directory)

find . -name "*" -type d -maxdepth 1 | while read directoryName

do
    validateStatusString=`git --git-dir=$directoryName/.git --work-tree=$directoryName status | grep "\buntracked\|no\b" | tail -1`
    if [[  $validateStatusString == *"untracked"* ]]
    then
    		echo "$directoryName repository is untracked"
    elif [[  $validateStatusString == *"no"* ]]
    then 
        echo "$directoryName repository has changes"
    fi
done
