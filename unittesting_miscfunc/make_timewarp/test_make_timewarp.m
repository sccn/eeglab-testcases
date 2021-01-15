% test_make_timewarp
% 05/18/2010 roy
% case 1..4 pass

function test_make_timewarp
readepochsamplefile;
timeWarp = make_timewarp(EEG, {'square', 'rt'});
disp('Pass 1');
timeWarp = make_timewarp(EEG, {'square', 'rt'},'baselineLatency', 0,'maxSTDForAbsolute', 3,'maxSTDForRelative', 2);
disp('Pass 2');
timeWarp = make_timewarp(EEG, {'square', 'rt'},'baselineLatency', 0,'maxSTDForAbsolute', 0.6,'maxSTDForRelative', 0.4);
disp('Pass 3');
timeWarp = make_timewarp(EEG, {'square', 'rt'},'baselineLatency', 0, 'eventConditions', {'latency < 20000', 'latency >1000'},'maxSTDForAbsolute', 3,'maxSTDForRelative', 2);
disp('Pass 4');
