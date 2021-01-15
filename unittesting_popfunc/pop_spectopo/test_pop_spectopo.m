function test_pop_spectopo

readcontsamplefile;
figure; pop_spectopo(EEG, 1, [0 238288.3983], 'EEG' , 'percent', 15, 'freq', [], 'freqrange',[2 25],'electrodes','off'); close;
figure; pop_spectopo(EEG, 1, [0 238288.3983], 'EEG' , 'percent', 15, 'freq', [], 'freqrange',[2 25],'electrodes','off', 'wintype', 'blackmanharris'); close;
figure; pop_spectopo(EEG, 1, [0 238288.3983], 'EEG' , 'percent', 15, 'freq', [], 'freqrange',[2 25],'electrodes','off', 'wintype', 'blackmanharris', 'blckhn',3); close;
readepochsamplefile;
ncomps = size(EEG.icaweights,1);
figure; pop_spectopo(EEG, 1, [0 238288.3983], 'EEG' , 'percent', 50, 'freq', [ 8 10 12], 'freqrange',[2 25],'electrodes','off'); close;
figure; pop_spectopo(EEG, 0, [-1000 1999.7949], 'EEG' , 'freq', [10], 'plotchan', 0, 'icacomps', [1:ncomps], 'nicamaps', 5, 'freqrange',[2 25],'electrodes','off'); close;
figure; pop_spectopo(EEG, 0, [-1000 1999.7949], 'EEG' , 'freq', [10], 'plotchan', 27, 'icacomps', [1:ncomps], 'nicamaps', 6, 'icamode', 'sub', 'freqrange',[2 30],'electrodes','off'); close;
figure; pop_spectopo(EEG, 1, [0 238288.3983], 'EEG' , 'percent', 50, 'freq', [ 8 10 12], 'freqrange',[2 25],'electrodes','off', 'wintype', 'blackmanharris'); close;
figure; pop_spectopo(EEG, 0, [-1000 1999.7949], 'EEG' , 'freq', [10], 'plotchan', 0, 'icacomps', [1:ncomps], 'nicamaps', 5, 'freqrange',[2 25],'electrodes','off', 'wintype', 'blackmanharris'); close;
figure; pop_spectopo(EEG, 0, [-1000 1999.7949], 'EEG' , 'freq', [10], 'plotchan', 27, 'icacomps', [1:ncomps], 'nicamaps', 6, 'icamode', 'sub', 'freqrange',[2 30],'electrodes','off', 'wintype', 'blackmanharris'); close;