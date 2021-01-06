function test_pop_adjustevents2;

readcontsamplefile;

errflag = 0;
rtindx = find(~cellfun(@isempty,strfind({EEG.event.type},'rt')));% Retreive index of 'rt' events

% Retreive original latencies
original_latencies = [EEG.event.latency];


% Add time to events in ms (20ms)
try
    [EEGout com] = pop_adjustevents(EEG,'addms', 20);
    
    eqflag = isequal([EEGout.event.latency] - 20/1000*EEG.srate,original_latencies);
    if ~eqflag, errflag =1; end
catch
    errflag =1;
end
%----

% Add time to 'rt' events in ms (20ms)
try
[EEGout com] = pop_adjustevents(EEG,'addms', 20,'eventtypes',{'rt'});

eqflag = isequal([EEGout.event((rtindx)).latency] - 20/1000*EEG.srate,original_latencies((rtindx)));
    if ~eqflag, errflag =1; end
catch
    errflag =1;
end
%----

% Add samples to events (30 samples)
try
[EEGout com] = pop_adjustevents(EEG,'addsamples', 30);

eqflag = isequal([EEGout.event.latency] - 30,original_latencies);
    if ~eqflag, errflag =1; end
catch
    errflag =1;
end
%----

% Add samples to 'rt' events (30 samples)
try
[EEGout com] = pop_adjustevents(EEG,'addsamples', 30,'eventtypes',{'rt'});

eqflag = isequal([EEGout.event(rtindx).latency] - 30,original_latencies(rtindx));
    if ~eqflag, errflag =1; end
catch
    errflag =1;
end
%----

if errflag, error('pop_adjustevents error in testing with continous data'); end