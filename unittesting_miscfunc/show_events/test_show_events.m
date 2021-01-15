% test_show_events
% 05/19/2010 roy
% case 1 2

function test_show_events
readepochsamplefile;
im = show_events(EEG);
close;

timeWarp = make_timewarp(EEG, {'square', 'rt'},'baselineLatency', 0,'maxSTDForAbsolute', 0.6,'maxSTDForRelative', 0.4);
im = show_events(EEG, 'eventThicknessCoef', 0.5, 'eventNames', timeWarp.eventSequence, 'timeWarp', timeWarp);
close;