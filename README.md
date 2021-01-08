```
1. Install git annex (easiest is conda I guess)
https://git-annex.branchable.com/install/

2. Clone an Openneuro repo
git clone https://github.com/OpenNeuroDatasets/ds002718.git
cd ds002718
git annex init
init  (merging origin/git-annex into git-annex...)
(recording state in git...)
(scanning for unlocked files...)

  Remote origin not usable by git-annex; setting annex-ignore
(Auto enabling special remote s3-PUBLIC...)
ok
(recording state in git...)
git annex get
(works for me)

3. Clone our repository
git clone https://github.com/sccn/eeglab-testcases.git
cd eeglab-testcases
git annex init
init  (scanning for unlocked files...)

  Remote origin not usable by git-annex; setting annex-ignore
ok
(recording state in git...)
git annex get
(does not work for me)
git remote rm origin
git remote add origin ssh://arno@jumping.ucsd.edu/data/common/matlab/eeglab-testcases/eeglab-testcases
git pull
git annex get

I can see that there is an additional remote for the OpenNeuro data

git remote -v
origin	https://github.com/OpenNeuroDatasets/ds002718.git (fetch)
origin	https://github.com/OpenNeuroDatasets/ds002718.git (push)
s3-PUBLIC
```
