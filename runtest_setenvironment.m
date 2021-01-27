%graphics_toolkit fltk % Octave 
addpath('/home/arno/eeglab'); % SCCN
addpath('/data/matlab/eeglab'); % Arno laptop
addpath('Z:\data\matlab\eeglab'); % Arno VM

tmpp = fileparts(which('runtest.m'));
addpath(fullfile(tmpp, 'unittesting_common'));
addpath(fullfile(tmpp, 'unittesting_common', 'helpfunc'));
addpath(tmpp);
