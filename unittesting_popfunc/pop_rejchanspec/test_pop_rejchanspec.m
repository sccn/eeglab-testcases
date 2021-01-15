% test_pop_rejchanspec
% 04/28/2010 roy
% case 1...6 pass

function test_pop_rejchanspec
readepochsamplefile;
pop_rejchanspec(EEG, 'elec', [1:32], 'freqlims', [35 64], 'stdthresh', [5], 'averef', 'off', 'plothist', 'off');
if ismatlab
    pop_rejchanspec(EEG, 'elec', [1:32], 'freqlims', [35 64], 'stdthresh', [5], 'averef', 'on', 'plothist', 'on');
    close;
end;
pop_rejchanspec(EEG, 'elec', [2 4 5], 'freqlims', [35 64], 'stdthresh', [5], 'averef', 'off', 'plothist', 'off');
pop_rejchanspec(EEG, 'elec', [1:32], 'freqlims', [2 100], 'stdthresh', [5], 'averef', 'off', 'plothist', 'off');
pop_rejchanspec(EEG, 'elec', [1:32], 'freqlims', [35 64], 'absthresh', [1 5], 'averef', 'off', 'plothist', 'off');
pop_rejchanspec(EEG, 'elec', [1:32], 'freqlims', [35 64], 'stdthresh', [5 1 2], 'averef', 'off', 'plothist', 'off');