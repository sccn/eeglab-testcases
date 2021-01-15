function test_latency;

% bug report on importevent: When latencies in timepoints i.e. sample
% indices/frames are imported, they get shifted by +1. In MATLAB array
% indices start at 1, not 0. So the recording of the sample '0s' would be
% at index 1. The addition happens in line 336, last else-clause in
% subfunction recomputelatencies. It is stated in a comment on line 333
% that this was needed 'because first sample point has latency 0'. This
% could be aimed at recordings in time units. By this point conversion from
% seconds to latencies in points would have already happened as of line
% 254.
%
% Ulrich Reinacher, 23.04.2012, ulrich.reinacher.1@psychologie.hu-berlin.de

%% create EEG
evalin('base', 'global eegdata; eegdata = rand(2,50);');
pseudoSamplingRate = 1; % keeps it simple in seconds
setname = 'importevent_bug';
EEG = pop_importdata('dataformat','array','nbchan',0,'data','eegdata','setname',setname,'srate',pseudoSamplingRate,'pnts',0,'xmin',0);

%% create events in [s]
% events should be on the first and last point of the recorded experiments
disp('Import events in seconds.')
myEventValues = {0 'Experiment begins';49 'Experiment ends'}
myEventFields = {'latency' 'type'};
timeunit = 1; % seconds

event1 = importevent('myEventValues',[],1,  'fields', {'latency', 'type'}, 'timeunit', timeunit  )
%% create events in sample indices
% events should be on the first and last point of the recorded experiments
disp('Import events in frames.')
myEventValues = {1 'Experiment begins';EEG.pnts 'Experiment ends'}
myEventFields = {'latency' 'type'};
timeunit = NaN; % points, frames, samples, what have you

event2 = importevent('myEventValues',[],1,  'fields', {'latency', 'type'}, 'timeunit', timeunit  )
%% display
disp('Resulting latencies [frames] for same events')
disp([[event1.latency]' [event2.latency]'])
if ~all([[event1.latency]' == [event2.latency]'])
	error('Wrong latencies, pass 1');
end;
if event1(1).latency ~= 1 || event1(2).latency ~= 50
        error('Wrong latencies, pass 2');
end;
return
