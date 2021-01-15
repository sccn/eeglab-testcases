# Install git annex (easiest is conda I guess)

See this doc https://git-annex.branchable.com/install/

# Clone an Openneuro repo
```
git clone https://github.com/OpenNeuroDatasets/ds002718.git
cd ds002718
git annex init
```
Text output below

```init  (merging origin/git-annex into git-annex...)
(recording state in git...)
(scanning for unlocked files...)
Remote origin not usable by git-annex; setting annex-ignore
(Auto enabling special remote s3-PUBLIC...)
ok
(recording state in git...)
```

The use the get command to get the files

```
git annex get
```

Note that this is the list of remote

```
git remote -v
origin	https://github.com/OpenNeuroDatasets/ds002718.git (fetch)
origin	https://github.com/OpenNeuroDatasets/ds002718.git (push)
s3-PUBLIC
```

# Clone our repository

```
git clone https://github.com/sccn/eeglab-testcases.git
cd eeglab-testcases
git annex init
```

Text output below

```
init  (scanning for unlocked files...)

  Remote origin not usable by git-annex; setting annex-ignore
ok
(recording state in git...)
```

Doing a git annex get does not work.
We need to reset the remote. Note that even if the SCCN repo is not a bare git repo, it is possible to use it to pull large files from it (usually one should only pull and push from bare git repositories (like Github repos, which only contain metadata, no actual files)). One may pull from a standard git repo but this is not something commonly done. However, git-annex can only execute pull (and get) from standard git repos (bare git repos are still used for smaller files).

```
git remote rm origin
git remote add origin ssh://arno@jumping.ucsd.edu/data/common/matlab/eeglab-testcases/eeglab-testcases
git pull
git annex get
```

Then we can reset it back to github to be able to make code changes and push them to Github

```
git remote rm origin
git remote add origin https://github.com/sccn/eeglab-testcases
```

In our case, we do not have the special remote for git-annex as OpenNeuro does. Would be great to be able to fix that and not have to switch between remote.


