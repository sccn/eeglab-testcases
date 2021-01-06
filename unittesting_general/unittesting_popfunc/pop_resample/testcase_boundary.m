function testcase_boundary
% Author: Arnaud Delorme

EEG = eeg_emptyset;
EEG.pnts = 10000;
EEG.data = zeros( 1, 10000 );
EEG.srate = 500;
EEG = eeg_checkset( EEG );

% Case 1: Cut from middle of file
disp( 'Case 1: Cut from middle of file' )
EEG.event = [];
EEG.event(1).type = 'boundary';
EEG.event(1).latency = 0.5;
EEG.event(2).type = 'boundary';
EEG.event(2).latency = 500.5;

freqs = [ 200 250 300 350 450 550 600 650 700 ];

for iFreq = 1:length(freqs)
    TMP = pop_resample( EEG, freqs(iFreq) );

    if TMP.event(1).latency ~= 0.5 || TMP.event(2).latency ~= freqs(iFreq)+0.5
        error('Boundary event latency error')
    end
end

