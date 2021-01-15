% test_rejkurt
% 05/20/2010 roy
% case 1..4, 6 pass
% case 5 -- bug 852
% bug 852 fixed

function test_rejkurt
readepochsamplefile;

[kurtosis rej] = rejkurt(EEG.data);

[kurtosis rej] = rejkurt(EEG.data, 2);

[kurtosis rej] = rejkurt(EEG.data, 1.5, ones(32,80));

[kurtosis rej] = rejkurt(EEG.data, 0.5, [], 1);

[kurtosis rej] = rejkurt(EEG.data, 0.5, [], 2);

data = rand(32, 80, 384);
[kurtosis rej] = rejkurt(data, 0.5, [], 2);