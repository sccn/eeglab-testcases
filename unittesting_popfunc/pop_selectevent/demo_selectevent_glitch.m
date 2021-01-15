function [ TMP ] = demo_selectevent_glitch
% Demo to show unexpected behavior of pop_selectevent in combination with
% overlapping epochs

EEG = eeg_emptyset;

EEG.srate = 500;
EEG.nbchan = 1;
EEG.data = zeros(1,2000);

% One event type 1
EEG.event(1).type = '1';
EEG.event(1).latency = 201;

% One event type 2
EEG.event(2).type = '2';
EEG.event(2).latency = 501;

% Fill missing fields
EEG = eeg_checkset(EEG);

% Create two epochs, first with TLE type 1, second with TLE type 2
EEG = pop_epoch(EEG, {'1', '2'}, [-0.2 1], 'epochinfo', 'yes');
% Three events remain due to overlapping epochs

% Select type 2 epochs
TMP = pop_selectevent(EEG, 'type', '2', 'deleteepochs', 'on', 'latency', '-10<=10');
if length(TMP.event) ~= 1, error('Event error 1'); end;

TMP = pop_selectevent(EEG, 'type', '2', 'deleteepochs', 'on');
if length(TMP.event) ~= 3, error('Event error 2'); end;

TMP = pop_selectevent(EEG, 'type', '2', 'deleteepochs', 'on', 'deleteevents', 'on');
if length(TMP.event) ~= 2, error('Event error 3'); end;

TMP = pop_selectevent(EEG, 'type', '1', 'deleteepochs', 'on', 'deleteevents', 'on');
if length(TMP.event) ~= 1, error('Event error 4'); end;

