# verify-repo-status

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

The installer creates a symbolic link:

```text
/usr/local/bin/verify-repo-status -> <repo>/verify-repo-status.sh
```

Because `/usr/local/bin` usually requires admin permissions, the script uses `sudo`.

## Usage

Go to the parent directory that contains your repositories and run:

```bash
verify-repo-status
```

Example output:

```console
./SupportProjects is not a git repository
./ValidateData repository has changes
./2Agile-methodologies-for-mobile-development repository is untracked
```
