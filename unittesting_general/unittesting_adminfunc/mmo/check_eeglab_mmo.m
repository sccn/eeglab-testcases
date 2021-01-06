function check_eeglab_mmo;

%try
    
    %% check continuous time rejection
    % --------------------------------
    pop_editoptions('option_memmapdata', 1);
    readcontsamplefile;
    EEG.event = [];
    EEG2 = eeg_eegrej(EEG, [1 10000]);
    data1 = EEG2.data(:,:,:);
    pop_editoptions('option_memmapdata', 0);
    readcontsamplefile;
    EEG3 = eeg_eegrej(EEG, [1 10000]);
    data2 = EEG3.data;
    if ~isa(EEG2.data, 'mmo')
        error('object should be an MMO error');
    end;
    if ~isequal(data1, data2)
        error('MMO error');
    end;
    
    %% check epoching
    % --------------
    pop_editoptions('option_memmapdata', 1);
    readcontsamplefile;
    EEG2 = pop_epoch( EEG, {  'square'  }, [-1  2], 'newname', 'Continuous EEG Data epochs', 'epochinfo', 'yes');
    data1 = EEG2.data(:,:,:);
    pop_editoptions('option_memmapdata', 0);
    readcontsamplefile;
    EEG3 = pop_epoch( EEG, {  'square'  }, [-1  2], 'newname', 'Continuous EEG Data epochs', 'epochinfo', 'yes');
    data2 = EEG3.data;
    if ~isa(EEG2.data, 'mmo')
        error('object should be an MMO error');
    end;
    if ~isequal(data1, data2)
        error('MMO error');
    end;
    
    %% check epoching + boundary
    % --------------------------
    pop_editoptions('option_memmapdata', 1);
    readcontsamplefile;
    EEG  = eeg_eegrej(EEG, [4000 10000]);
    EEG2 = pop_epoch( EEG, {  'square'  }, [-1  2], 'newname', 'Continuous EEG Data epochs', 'epochinfo', 'yes');
    data1 = EEG2.data(:,:,:);
    pop_editoptions('option_memmapdata', 0);
    readcontsamplefile;
    EEG  = eeg_eegrej(EEG, [4000 10000]);
    EEG3 = pop_epoch( EEG, {  'square'  }, [-1  2], 'newname', 'Continuous EEG Data epochs', 'epochinfo', 'yes');
    data2 = EEG3.data;
    if ~isa(EEG2.data, 'mmo')
        error('object should be an MMO error');
    end;
    if ~isequal(data1, data2)
        error('MMO error');
    end;
    
    %% check baseline removal
    % -----------------------
    pop_editoptions('option_memmapdata', 1);
    readcontsamplefile;
    EEG2 = pop_rmbase(EEG, [], [1:10]);
    data1 = EEG2.data(:,:,:);
    pop_editoptions('option_memmapdata', 0);
    readcontsamplefile;
    EEG3 = pop_rmbase(EEG, [], [1:10]);
    data2 = EEG3.data;
    if ~isa(EEG2.data, 'mmo')
        error('object should be an MMO error');
    end;
    if ~isequal(data1, data2)
        error('MMO error');
    end;
    
    %% check baseline removal + boundary
    % ----------------------------------
    pop_editoptions('option_memmapdata', 1);
    readcontsamplefile;
    EEG  = eeg_eegrej(EEG, [4000 10000]);
    EEG2 = pop_rmbase(EEG, [], [1:10]);
    data1 = EEG2.data(:,:,:);
    pop_editoptions('option_memmapdata', 0);
    readcontsamplefile;
    EEG  = eeg_eegrej(EEG, [4000 10000]);
    EEG3 = pop_rmbase(EEG, [], [1:10]);
    data2 = EEG3.data;
    if ~isa(EEG2.data, 'mmo')
        error('object should be an MMO error');
    end;
    if ~isequal(data1, data2)
        error('MMO error');
    end;
    
    %% check filtering
    % ----------------
    pop_editoptions('option_memmapdata', 1);
    readcontsamplefile;
    EEG2 = pop_firws(EEG, 'ftype', 'highpass', 'fcutoff', 3, 'wtype', 'blackman', 'forder', 118);
    data1 = EEG2.data(:,:,:);
    pop_editoptions('option_memmapdata', 0);
    readcontsamplefile;
    EEG3 = pop_firws(EEG, 'ftype', 'highpass', 'fcutoff', 3, 'wtype', 'blackman', 'forder', 118);
    data2 = EEG3.data;
    if ~isa(EEG2.data, 'mmo')
        error('object should be an MMO error');
    end;
    if ~isequal(data1, data2)
        error('MMO error');
    end;
    
    %% check filtering + boundary
    % ---------------------------
    pop_editoptions('option_memmapdata', 1);
    readcontsamplefile;
    EEG  = eeg_eegrej(EEG, [4000 10000]);
    EEG2 = pop_firws(EEG, 'ftype', 'highpass', 'fcutoff', 3, 'wtype', 'blackman', 'forder', 118);
    data1 = EEG2.data(:,:,:);
    pop_editoptions('option_memmapdata', 0);
    readcontsamplefile;
    EEG  = eeg_eegrej(EEG, [4000 10000]);
    EEG3 = pop_firws(EEG, 'ftype', 'highpass', 'fcutoff', 3, 'wtype', 'blackman', 'forder', 118);
    data2 = EEG3.data;
    if ~isa(EEG2.data, 'mmo')
        error('object should be an MMO error');
    end;
    if ~isequal(data1, data2)
        error('MMO error');
    end;
    
    %% check re-referencing
    % ---------------------
    pop_editoptions('option_memmapdata', 1);
    readcontsamplefile;
    EEG2 = pop_reref( EEG, []);
    data1 = EEG2.data(:,:,:);
    pop_editoptions('option_memmapdata', 0);
    readcontsamplefile;
    EEG3 = pop_reref( EEG, []);
    data2 = EEG3.data;
    if ~isa(EEG2.data, 'mmo')
        error('object should be an MMO error');
    end;
    if ~isequal(data1, data2)
        error('MMO error');
    end;
    
    %% check selecting
    % ----------------
    pop_editoptions('option_memmapdata', 1);
    readcontsamplefile;
    EEG2 = pop_select( EEG, 'channel', [1:10], 'point', [1:20]);
    data1 = EEG2.data(:,:,:);
    pop_editoptions('option_memmapdata', 0);
    readcontsamplefile;
    EEG3 = pop_select( EEG, 'channel', [1:10], 'point', [1:20]);
    data2 = EEG3.data;
    if ~isa(EEG2.data, 'mmo')
        error('object should be an MMO error');
    end;
    if ~isequal(data1, data2)
        error('MMO error');
    end;
    
    %% check resampling
    % ----------------
    pop_editoptions('option_memmapdata', 1);
    readcontsamplefile;
    EEG2 = pop_resample(EEG, 64);
    data1 = EEG2.data(:,:,:);
    pop_editoptions('option_memmapdata', 0);
    readcontsamplefile;
    EEG3 = pop_resample(EEG, 64);
    data2 = EEG3.data;
    if ~isa(EEG2.data, 'mmo')
        error('object should be an MMO error');
    end;
    if ~isequal(data1, data2)
        error('MMO error');
    end;
    
    %% check resampling + boundary
    % ----------------------------
    pop_editoptions('option_memmapdata', 1);
    readcontsamplefile;
    EEG  = eeg_eegrej(EEG, [4000 10000]);
    EEG2 = pop_resample(EEG, 64);
    data1 = EEG2.data(:,:,:);
    pop_editoptions('option_memmapdata', 0);
    readcontsamplefile;
    EEG  = eeg_eegrej(EEG, [4000 10000]);
    EEG3 = pop_resample(EEG, 64);
    data2 = EEG3.data;
    if ~isa(EEG2.data, 'mmo')
        error('object should be an MMO error');
    end;
    if ~isequal(data1, data2)
        error('MMO error');
    end;
    
    % -----------------------------------
    % ------- DATA EPOCHS ---------------
    % -----------------------------------
    
    %% check baseline removal
    % -----------------------
    pop_editoptions('option_memmapdata', 1);
    readepochsamplefile;
    EEG2 = pop_rmbase(EEG, [], [1:10]);
    data1 = EEG2.data(:,:,:);
    pop_editoptions('option_memmapdata', 0);
    readepochsamplefile;
    EEG3 = pop_rmbase(EEG, [], [1:10]);
    data2 = EEG3.data;
    if ~isa(EEG2.data, 'mmo')
        error('object should be an MMO error');
    end;
    if ~isequal(data1, data2)
        error('MMO error');
    end;
    
    %% check filtering
    % ----------------
    pop_editoptions('option_memmapdata', 1);
    readepochsamplefile;
    EEG2 = pop_firws(EEG, 'ftype', 'highpass', 'fcutoff', 3, 'wtype', 'blackman', 'forder', 118);
    data1 = EEG2.data(:,:,:);
    pop_editoptions('option_memmapdata', 0);
    readepochsamplefile;
    EEG3 = pop_firws(EEG, 'ftype', 'highpass', 'fcutoff', 3, 'wtype', 'blackman', 'forder', 118);
    data2 = EEG3.data;
    if ~isa(EEG2.data, 'mmo')
        error('object should be an MMO error');
    end;
    if ~isequal(data1, data2)
        error('MMO error');
    end;
    
    %% check re-referencing
    % ---------------------
    pop_editoptions('option_memmapdata', 1);
    readepochsamplefile;
    EEG2 = pop_reref( EEG, []);
    data1 = EEG2.data(:,:,:);
    pop_editoptions('option_memmapdata', 0);
    readepochsamplefile;
    EEG3 = pop_reref( EEG, []);
    data2 = EEG3.data;
    if ~isa(EEG2.data, 'mmo')
        error('object should be an MMO error');
    end;
    if ~isequal(data1, data2)
        error('MMO error');
    end;
    
    %% check selecting
    % ----------------
    pop_editoptions('option_memmapdata', 1);
    readepochsamplefile;
    EEG2 = pop_select( EEG, 'channel', [1:10], 'point', [1:20], 'trial', [1:10]);
    data1 = EEG2.data(:,:,:);
    pop_editoptions('option_memmapdata', 0);
    readepochsamplefile;
    EEG3 = pop_select( EEG, 'channel', [1:10], 'point', [1:20], 'trial', [1:10]);
    data2 = EEG3.data;
    if ~isa(EEG2.data, 'mmo')
        error('object should be an MMO error');
    end;
    if ~isequal(data1, data2)
        error('MMO error');
    end;
    
    %% check resampling
    % ----------------
    pop_editoptions('option_memmapdata', 1);
    readepochsamplefile;
    EEG2 = pop_resample(EEG, 64);
    data1 = EEG2.data(:,:,:);
    pop_editoptions('option_memmapdata', 0);
    readepochsamplefile;
    EEG3 = pop_resample(EEG, 64);
    data2 = EEG3.data;
    if ~isa(EEG2.data, 'mmo')
        error('object should be an MMO error');
    end;
    if ~isequal(data1, data2)
        error('MMO error');
    end;
    
%catch
%    pop_editoptions('option_memmapdata', 0);
%    error(lasterr);
%end;
 
