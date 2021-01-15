function testcase_eegrej
% Testcase to demonstrate incorrect event handling in eegrej and/or
% eeg_insertboundary
% Author: Andreas Widmann, widmann@uni-leipzig.de, 2017

EEG = eeg_emptyset;
EEG.pnts = 10000;
EEG.data = zeros( 1, 10000 );
EEG.srate = 500;
EEG = eeg_checkset( EEG );

% Case 1: Cut from middle of file
disp( 'Case 1: Cut from middle of file' )
EEG.event = [];
EEG.event(1).type = 'mrk1';
EEG.event(1).latency = 999;
EEG.event(2).type = 'mrk2';
EEG.event(2).latency = 1000;
EEG.event(3).type = 'mrk3';
EEG.event(3).latency = 2000;
EEG.event(4).type = 'mrk4';
EEG.event(4).latency = 2001;

TMP = eeg_eegrej( EEG, [ 1000 2000 ] );

if length(TMP.event) ~= 3 || ~isempty(strmatch('mrk2', { TMP.event.type })) || ~isempty(strmatch('mrk3', { TMP.event.type }))
    error('Event removal error');
end
if TMP.event(1).latency ~= 999 || TMP.event(end).latency ~= 1000
    error('Event latency error');
end    
if TMP.event(2).latency ~= 999.5 % boundary events
    error('Event boundary latency error');
end    
% Old behavior: mrk2 and mrk3 are retained (with incorrect latencies) but should both be removed!

% Case 2: Cut from beginning of file
disp( 'Case 2: Cut from beginning of file' )
EEG.event = [];
EEG.event(1).type = 'mrk1';
EEG.event(1).latency = 1;
EEG.event(2).type = 'mrk2';
EEG.event(2).latency = 1000;
EEG.event(3).type = 'mrk3';
EEG.event(3).latency = 1001;

TMP = eeg_eegrej( EEG, [ 1 1000 ] );

if length(TMP.event) ~= 2 || ~isempty(strmatch('mrk1', { TMP.event.type })) || ~isempty(strmatch('mrk2', { TMP.event.type }))
    error('Event removal error');
end
if TMP.event(1).latency ~= 0.5 % boundary event
    error('Event boundary latency error');
end    
if TMP.event(2).latency ~= 1 % mrk3
    error('Event latency error');
end

% Old behavior: mrk1 is retained (with incorrect latency) but should be removed!
% mrk2 is removed but only "accidentially" as recomputed event latency is <
% 1.

% Case 3: Cut from end of file
disp( 'Case 3: Cut from end of file' )
EEG.event = [];
EEG.event(1).type = 'mrk1';
EEG.event(1).latency = 8999;
EEG.event(2).type = 'mrk2';
EEG.event(2).latency = 9000;
EEG.event(3).type = 'mrk3';
EEG.event(3).latency = 10000;

TMP = eeg_eegrej( EEG, [ 9000 10000 ] );

% Old behavior: mrk3 is retained (with incorrect latency) but should be removed!
% mrk2 is removed but only "accidentially" as recomputed event latency is >
% EEG.pnts. Discrepancy warning.
if length(TMP.event) ~= 1 || ~isempty(strmatch('mrk2', { TMP.event.type })) || ~isempty(strmatch('mrk3', { TMP.event.type }))
    error('Event removal error');
end

