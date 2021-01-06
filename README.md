# Create repository
mkdir eeglab-testcases-git-repo
cd eeglab-testcases-git-repo
git init --bare

# Set as remote
cd ../eeglab-testcases.git
git remote add origin /data/common/matlab/eeglab-testcases/eeglab-testcases-git-repo
git push origin master
