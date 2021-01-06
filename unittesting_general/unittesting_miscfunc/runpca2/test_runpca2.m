% test_runpca2
% case 1 2 3 -- See bug 850

function test_runpca2
%% case 1
data = [2 5 3 6 7 2 6 8 1 2;
    6 1 10 234 3 5 464 3 2 5;
    1 1 1 1 3 5 1 1 4 5;
    4 23456 2 3 1 1 34 2 3 5;
    20 30 10 10 34 10 30 20 30 10];
[pc,eigvec,sv] = runpca2(data);
[pc,eigvec,sv] = runpca2(data,3);

if size(pc,1) > 3
   error('EEGLAB:unittesting', 'Error in runpca2(): I do not need that much principle components');
end;
if size(pc,1) < 3
    error('EEGLAB:unittesting', 'Error in runpca2(): No enough principle components');
end;
[pc,eigvec,sv] = runpca(data, 3, 1);

%% case 2
data = rand(32, 100);
[pc,eigvec,sv] = runpca2(data);
[pc,eigvec,sv] = runpca2(data, 26);
if size(pc,1) > 26
    error('EEGLAB:unittesting', 'Error in runpca2(): I do not need that much principle components');
end;
if size(pc,1) < 26
    error('EEGLAB:unittesting', 'Error in runpca2(): No enough principle components');
end;
[pc,eigvec,sv] = runpca(data, 26, 1);

%% case 2
readcontsamplefile;
[pc,eigvec,sv] = runpca2(EEG.data);
[pc,eigvec,sv] = runpca2(EEG.data, 26);
if size(pc,1) > 26
    error('EEGLAB:unittesting', 'Error in runpca2(): I do not need that much principle components');
end;
if size(pc,1) < 26
    error('EEGLAB:unittesting', 'Error in runpca2(): No enough principle components');
end;
[pc,eigvec,sv] = runpca2(EEG.data, 26, 1);