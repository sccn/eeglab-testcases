% test_rmsave
% 05/19/2010 roy
% case 1 2 3 pass

function test_rmsave
%% case 1
data = [2 5 3 6 7 2 6 8 1 2;...
    6 1 10 234 3 5 464 3 2 5;
    1 1 1 1 3 5 1 1 4 5;
    4 23456 2 3 1 1 34 2 3 5;
    20 30 10 10 34 10 30 20 30 10];

result = rmsave(data, 10);
if ~near(size(result), [5 1])
    error('EEGLAB:unittesting', 'Error in rmsave(): Size of the rms average vector is not correct.');

end;

%% case 2
result = rmsave(data, 5);
if ~near(size(result), [5 2])
    error('EEGLAB:unittesting', 'Error in rmsave(): Size of the rms average vector is not correct.');
end;

%% case 3
data = rand(32, 100);
result = rmsave(data, 25);
if ~near(size(result), [32 4])
    error('EEGLAB:unittesting', 'Error in rmsave(): Size of the rms average vector is not correct.');
end;