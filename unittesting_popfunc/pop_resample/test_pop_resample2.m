function test_pop_resample2
% test_pop_resample2 
% Ramon Martinez Cancino
% Arnaud Delorme
% Test consistency of field EEG.event.duration

% Epochs
readepochsamplefile;

% Creating duration in time units (seconds)
durationvect = ones(1,length(EEG.event))/10;
durationvect(strcmp({EEG.event.type},'rt')) = 2*durationvect(strcmp({EEG.event.type},'rt'));
EEG = pop_editeventfield( EEG,'duration',durationvect);

EEGOUT = pop_resample(EEG, 10);
flagerror(1) = isequal([EEGOUT.event.duration]/EEGOUT.srate,durationvect);

EEGOUT = pop_resample(EEG, 1000);
flagerror(2) = isequal([EEGOUT.event.duration]/EEGOUT.srate,durationvect);

% Cont Data
readcontsamplefile;

% Creating duration in time units (seconds)
durationvect = 100*ones(1,length(EEG.event));
durationvect(strcmp({EEG.event.type},'rt')) = 2*durationvect(strcmp({EEG.event.type},'rt'));

EEG = pop_editeventfield( EEG,'duration',durationvect);

EEGOUT = pop_resample(EEG, 10);
flagerror(3) = isequal([EEGOUT.event.duration]/EEGOUT.srate,durationvect);

EEGOUT = pop_resample(EEG, 1000);
flagerror(4) = isequal([EEGOUT.event.duration]/EEGOUT.srate,durationvect);

if sum(flagerror)~= length(flagerror)
    error('Error in test_pop_resample2')
end