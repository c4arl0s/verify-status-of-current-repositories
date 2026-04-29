# statusfy

Script to check all first-level directories in your current path and report:
- directories that are not Git repositories
- repositories with untracked files
- repositories with pending changes

## Install

From the repository root:

```bash
chmod +x install.sh
./install.sh
```

## Usage

Navigate to the parent directory that contains your repositories and run:

```bash
statusfy
```

Output example:

```console
./BackgroundContent repository is untracked
./Chapter11StateMachines repository has changes
./24Callbacks-ObjectiveC repository has changes
./7PointersAndParameters repository has changes
./CreateBinariesInXcode repository has changes
./VIM repository has changes
./8ConflictingConstraints repository has changes
./MemoryLeak repository has changes
./9UsingSQLite_CoreDataWithSwift repository has changes
./5ViewControllers repository has changes
./neptuno-nodeJS repository has changes
./ViewControllerLifeCycle repository has changes
./iOS_Animations_Lotties repository has changes
./8MoreDataTypes repository is untracked
```
