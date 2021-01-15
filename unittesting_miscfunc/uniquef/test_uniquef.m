% test_uniquef
% 05/20/2010 roy

function test_uniquef
grp = [3 2 1 2 1 2 2 2 1];

[value,freq,index] = uniquef(grp,0);
if ~near(value, [3;2;1]) || ~near(freq, [1;5;3]) || ~near(index, [1;2;3])
    error('EEGLAB:unittesting', 'Error in uniquef(): incorrect result.');
end;

[value,freq,index] = uniquef(grp,1);
if ~near(value, [1;2;3]) || ~near(freq, [3;5;1]) || ~near(index, [3;2;1])
    error('EEGLAB:unittesting', 'Error in uniquef(): incorrect result.');
end;