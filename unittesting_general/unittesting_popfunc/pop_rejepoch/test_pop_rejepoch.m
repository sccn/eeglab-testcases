% test_pop_rejepoch
% 04/28/2010 roy
% case 1..3 pass
% case 4 bug 832 reported
% bug 832 fixed
function test_pop_rejepoch
readepochsamplefile;
a = ones(80,1);
ind = [1 3 6 25 46 67 78];
a(ind) = a(ind) - 1;
%% case 1
rej = a;
EEGOUT = pop_rejepoch(EEG, rej, 0);
%% case 2 
rej = logical(a);
EEGOUT = pop_rejepoch(EEG, rej, 0);
%% case 3
rej = logical(zeros(80,1));
EEGOUT = pop_rejepoch(EEG, rej, 0);
% %% case 4
% rej = logical(ones(80,1));
% EEGOUT = pop_rejepoch(EEG, rej, 0);
