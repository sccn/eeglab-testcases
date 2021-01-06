% test_seemovie
% 05/19/2010 roy
% case 1..4 pass

function test_seemovie
% eeglab_p = fileparts(which('eeglab.m'));
% fileloc32 = fullfile(eeglab_p, 'sample_data', 'eeglab_chan32.locs');
% data = rand(32,100);
% 
% [Movie,Colormap] = eegmovie(data, 20, fileloc32);
% seemovie(Movie, 1, Colormap);
% close;
% 
% [Movie,Colormap] = eegmovie(data, 20, fileloc32, 'My movie', [1:2:100]);
% seemovie(Movie, 2, Colormap);
% close;
% 
% [Movie,Colormap] = eegmovie(data, 20, fileloc32, 'My movie', [1:50], [0.2 0.8], 0.2);
% seemovie(Movie, 1, Colormap);
% close;
% 
% readepochsamplefile;
% [Movie,Colormap] = eegmovie(EEG.data(:,:,1), 128, fileloc32, 'My movie', [1:10:300]);
% seemovie(Movie, 2, Colormap);
% close;