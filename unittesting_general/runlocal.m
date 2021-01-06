% using runtest in the common folder
% ----------------------------------
tmpp = fileparts(pwd);
addpath(fullfile(tmpp, 'unittesting_common'));
runtest;
