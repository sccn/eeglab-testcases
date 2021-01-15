% Testcases for EEGLab
% Copyright (C) 2006 Andreas Romeyke & Ronny Lindner
% Max-Planck-Institute for Human Cognitive and Brain Sciences Leipzig, Germany
% romeyke@cbs.mpg.de, art1@it-netservice.de
%
% based on EEGLab-toolbox
% http://www.sccn.ucsd.edu/eeglab/
% Copyright (C) 1996 Scott Makeig et al, SCCN/INC/UCSD, scott@sccn.ucsd.edu
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

function pass_general()

        % load EEGLab Plugins
%         dipfitPath = tc_getPluginDir('dipfit');
%         if strcmp(dipfitPath, '')
%             return;
%         end;
%         if isempty(findstr(path, dipfitPath))
%             addpath(dipfitPath);
%         end;

        EEG = eeg_emptyset;

        EEG.nbchan = 2; % channels
        EEG.pnts = 10;   % data
        EEG.trials = 1; % epochs
        EEG.srate = 3;
        EEG.xmin = 0;
        EEG.xmax = 3;

        %            <----    data   ---->
        EEG.data = [ [ 1 1 1 1 1 1 2 2 2 3 ]; ... % <-- channels
                     [ 2 1 1 2 1 1 2 1 1 2 ] ];   % <--
EEG.urevent = [];
%          %### events ###%
%          EEG.event(1).type = 'square';
%          EEG.event(1).position = 2;
%          EEG.event(1).latency = 2;
%          EEG.event(1).urevent = 1;
%  
%          EEG.event(2).type = 'square';
%          EEG.event(2).position = 2;
%          EEG.event(2).latency = 4;
%          EEG.event(2).urevent = 2;
%  
%          EEG.event(3).type = 'rt';
%          EEG.event(3).position = [];
%          EEG.event(3).latency = 5;
%          EEG.event(3).urevent = 3;
%  
%          EEG.event(4).type = 'square';
%          EEG.event(4).position = 2;
%          EEG.event(4).latency = 7;
%          EEG.event(4).urevent = 4;
%  
%          EEG.event(5).type = 'rt';
%          EEG.event(5).position = [];
%          EEG.event(5).latency = 8;
%          EEG.event(5).urevent = 5;
%  
%          %### urevents ###%
%          EEG.urevent(1).type = 'square';
%          EEG.urevent(1).position = 2;
%          EEG.urevent(1).latency = 2;
%  
%          EEG.urevent(2).type = 'square';
%          EEG.urevent(2).position = 2;
%          EEG.urevent(2).latency = 4;
%  
%          EEG.urevent(3).type = 'rt';
%          EEG.urevent(3).position = [];
%          EEG.urevent(3).latency = 5;
%  
%          EEG.urevent(4).type = 'square';
%          EEG.urevent(4).position = 2;
%          EEG.urevent(4).latency = 7;
%  
%          EEG.urevent(5).type = 'rt';
%          EEG.urevent(5).position = [];
%          EEG.urevent(5).latency = 8;

% 0 1 2 3 4 5 6 7 8 9
%   x     x     x
% |-|-  |-|-  |-|-

        cEEG = eeg_emptyset;

        cEEG.nbchan = 2; % channels
        cEEG.pnts = 3;   % data
        cEEG.trials = 3; % epochs
        cEEG.srate = 3;
        cEEG.xmin = 0;
        cEEG.xmax = 2;
        %                channels, data, epochs
        cEEG.data = zeros(   2,       2,    3);

        % channel 1          <-- epochs -->
        cEEG.data(1,:,:) = [ [ -0.5 -0.5 0.5 ]; ... % <--
                             [ -0.5 -0.5 0.5 ] ];   % <-- data
        % channel 2          <-- epochs -->
        cEEG.data(2,:,:) = [ [  0.5  0.5  0.5 ]; ... % <--
                             [ -0.5 -0.5 -0.5 ] ];   % <-- data

        %### events ###%
        cEEG.event(1).type = 'square';
        cEEG.event(1).position = 2;
        cEEG.event(1).latency = 2;
        cEEG.event(1).urevent = 1;

        cEEG.event(2).type = 'square';
        cEEG.event(2).position = 2;
        cEEG.event(2).latency = 4;
        cEEG.event(2).urevent = 2;

        cEEG.event(3).type = 'rt';
        cEEG.event(3).position = [];
        cEEG.event(3).latency = 5;
        cEEG.event(3).urevent = 3;

        cEEG.event(4).type = 'square';
        cEEG.event(4).position = 2;
        cEEG.event(4).latency = 7;
        cEEG.event(4).urevent = 4;

        cEEG.event(5).type = 'rt';
        cEEG.event(5).position = [];
        cEEG.event(5).latency = 8;
        cEEG.event(5).urevent = 5;


        %### urevents ###%
        cEEG.urevent(1).type = 'square';
        cEEG.urevent(1).position = 2;
        cEEG.urevent(1).latency = 2;

        cEEG.urevent(2).type = 'square';
        cEEG.urevent(2).position = 2;
        cEEG.urevent(2).latency = 4;

        cEEG.urevent(3).type = 'rt';
        cEEG.urevent(3).position = [];
        cEEG.urevent(3).latency = 5;

        cEEG.urevent(4).type = 'square';
        cEEG.urevent(4).position = 2;
        cEEG.urevent(4).latency = 7;

        cEEG.urevent(5).type = 'rt';
        cEEG.urevent(5).position = [];
        cEEG.urevent(5).latency = 8;





        rEEG = eeg_regepochs(EEG);

