%graphics_toolkit fltk % Octave 
addpath(fullfile(pwd, '..', '..', 'eeglab'));
eeglab;
addpath(fullfile(pwd, 'unittesting_general'));
addpath(fullfile(pwd, 'unittesting_studyfunc'));
addpath(fullfile(pwd, 'unittesting_common'));
addpath(fullfile(pwd, 'unittesting_common', 'helpfunc'));
cd unittesting_studyfunc
addpath(pwd);
