# VerifyStatusRepositoriesScript

This script was created to remember me if a repository has changes or files are untracked

Console output:

```console
$ ./verifyStatus.sh                                          
fatal: not a git repository: './.git'
./7PointersAndParameters has changes
./5PointersAndStringsUAUCPointers has changes
./ProductViewControllerForSteriflowApp has changes
./17AccessControl has changes
./CustomAddButton is untracked
./ChronoList has changes
./VerifyStatusRepositoriesScript has changes
./NumericalAnalysisWithCProgrammingLanguage has changes
./5OptimizingProgramPerformance has changes
./LearningSwift has changes
```

# Code

```bash
find . -name "*" -type d -maxdepth 1 | while read directoryName
do
    validateStatusString=`git --git-dir=$directoryName/.git --work-tree=$directoryName status | grep "\buntracked\|no\b" | tail -1`
    if [[  $validateStatusString == *"untracked"* ]]
    then
        echo "$directoryName is untracked"
    elif [[  $validateStatusString == *"no"* ]]
    then 
        echo "$directoryName has changes"
    fi
done
```
