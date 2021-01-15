function check_number_trials

% Define number of trials
ntrials = 40;

% Create dummy EEG set
EEG = eeg_emptyset;
EEG.srate = 500;
EEG.data = rand(1,ntrials*EEG.srate,1);
EEG.epoch = 0;
EEG.trials = 1;
EEG.nbchan = 1;
EEG.pnts = ntrials*EEG.srate;
EEG = eeg_checkset(EEG);

% Here we will generate 40 trials of 1 sec duration (500 points)
EEG1 = eeg_regepochs(EEG,'eventtype', 'temp', 'extractepochs', 'on', 'recurrence', 1, 'limits', [0 1]);

% Here we will generate 40 trials of 0.3s duration (150 points). Notice here below that 0.5 and 0.8s is relative
% to the dummy event(temp) so trials will not contain the dummy event
EEG2 = eeg_regepochs(EEG,'eventtype', 'temp', 'extractepochs', 'on', 'recurrence', 1, 'limits', [0.5 0.8]);

% Disp
disp(['Original trials:' num2str(ntrials)]);
disp(['Case 1 trials:' num2str(EEG1.trials)]);
disp(['Case 2 trials:' num2str(EEG2.trials)]);

if EEG1.trials ~= ntrials || EEG2.trials ~= ntrials
        error('Wrong number of epochs');
end

