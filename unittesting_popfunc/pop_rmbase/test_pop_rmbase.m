function test_pop_rmbase

readepochsamplefile;
error_flag = zeros(1,4);

%% 1
[EEGout, com1] = pop_rmbase( EEG, [-1000 0]);
error_flag( 1) = ~strcmp(com1,'EEG = pop_rmbase( EEG, [-1000 0] ,[],[]);');
error_flag2(1) = ~strcmp(com1,'EEG = pop_rmbase( EEG, [-1000 0] ,[]);');
if ~isequal(EEG.data(1,:,2) - mean(double(EEG.data(1,1:129,2))), EEGout.data(1,:,2))
    error('Baseline issue');
end

%% 2
[EEGout, com2] = pop_rmbase( EEG,[],1:50 );
error_flag( 2) = ~strcmp(com2,'EEG = pop_rmbase( EEG, [],[1:50] ,[]);');
error_flag2(2) = ~strcmp(com2,'EEG = pop_rmbase( EEG, [],[1:50] );');
if ~isequal(EEG.data(1,:,2) - mean(double(EEG.data(1,1:50,2))), EEGout.data(1,:,2))
    error('Baseline issue');
end

%% 3
[EEGout, com3] = pop_rmbase( EEG,[],[]);
error_flag( 3) = ~strcmp(com3,'EEG = pop_rmbase( EEG, [],[],[]);');
error_flag2(3) = ~strcmp(com3,'EEG = pop_rmbase( EEG, [],[]);');
if ~isequal(EEG.data(1,:,2) - mean(double(EEG.data(1,:,2))), EEGout.data(1,:,2))
    error('Baseline issue');
end

%% 4
[EEGout, com4] = pop_rmbase( EEG,[-1000 0],1:51);
error_flag( 4) = ~strcmp(com4,'EEG = pop_rmbase( EEG, [-1000 0] ,[],[]);');
error_flag2(4) = ~strcmp(com4,'EEG = pop_rmbase( EEG, [-1000 0] ,[]);');
if ~isequal(EEG.data(1,:,2) - mean(double(EEG.data(1,1:129,2))), EEGout.data(1,:,2))
    error('Baseline issue');
end

if any(error_flag) && any(error_flag2)
    error('test_pop_rmbase: Error in /unittesting_general/unittesting_popfunc/pop_rmbase. Output com error.')
end