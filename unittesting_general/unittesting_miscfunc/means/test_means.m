% test_means
% 05/19/2010 roy
% case 1..4 pass

function test_means
%% case 1 matrix
X = rand(32,100);
[M,stderr,V,grpids] = means(X);
if ~near(size(M), [1 100])
    error('EEGLAB:unittesting', 'Error in means():compute the mean along the wrong dimension.');
end;

%% case 2 column vector
X = rand(32,1);
[M,stderr,V,grpids] = means(X);
if ~near(size(M), [1 1])
    error('EEGLAB:unittesting', 'Error in means():compute the mean along the wrong dimension.');
end;

%% case 3 row vector
X = rand(1,100);
[M,stderr,V,grpids] = means(X);
if ~near(size(M), [1 100])
    error('EEGLAB:unittesting', 'Error in means():compute the mean along the wrong dimension.');
end;

%% case 4 'grps'?
X = rand(32,100);
grps = [1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4];
[M,stderr,V,grpids] = means(X, grps);
if ~near(size(M), [4 100])
    error('EEGLAB:unittesting', 'Error in means():compute the mean along the wrong dimension.');
end;
