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

function passed = pass_empty_timewin()
        EEG = eeg_emptyset;

        EEG.nbchan = 2; % channels
        EEG.pnts = 3;   % data
        EEG.trials = 3; % epochs
        EEG.srate = 1;
        EEG.xmin = 0;
        EEG.xmax = 2;
        %                channels, data, epochs
        EEG.data = zeros(   2,       3,    3);

        % channel 1         <-- epochs -->
        EEG.data(1,:,:) = [ [ 1 1 2 ]; ... % <--
                            [ 1 1 2 ]; ... % <-- data
                            [ 1 1 2 ] ];   % <--
        % channel 2         <-- epochs -->
        EEG.data(2,:,:) = [ [ 2 2 2 ]; ... % <--
                            [ 1 1 1 ]; ... % <-- data
                            [ 1 1 1 ] ];   % <--

        %### events ###%
        EEG.event(1).type = 'square';
        EEG.event(1).position = 2;
        EEG.event(1).latency = 2;
        EEG.event(1).urevent = 1;
        EEG.event(1).epoch = 1;

        EEG.event(2).type = 'square';
        EEG.event(2).position = 2;
        EEG.event(2).latency = 5;
        EEG.event(2).urevent = 2;
        EEG.event(2).epoch = 2;

        EEG.event(3).type = 'rt';
        EEG.event(3).position = [];
        EEG.event(3).latency = 5.3;
        EEG.event(3).urevent = 3;
        EEG.event(3).epoch = 2;

        EEG.event(4).type = 'square';
        EEG.event(4).position = 2;
        EEG.event(4).latency = 8;
        EEG.event(4).urevent = 4;
        EEG.event(4).epoch = 3;

        EEG.event(5).type = 'rt';
        EEG.event(5).position = [];
        EEG.event(5).latency = 8.4;
        EEG.event(5).urevent = 5;
        EEG.event(5).epoch = 3;

        %### epoch ###%
        EEG.epoch(1).event = [1];
        EEG.epoch(1).eventlatency = {[1000]};
        EEG.epoch(1).eventposition = {[2]};
        EEG.epoch(1).eventtype = {'square'};
        EEG.epoch(1).eventurevent = {[1]};

        EEG.epoch(2).event = [2, 3];
        EEG.epoch(2).eventlatency = {[1000], [1300]};
        EEG.epoch(2).eventposition = {[2], []};
        EEG.epoch(2).eventtype = {'square', 'rt'};
        EEG.epoch(2).eventurevent = {[2], [3]};

        EEG.epoch(3).event = [4, 5];
        EEG.epoch(3).eventlatency = {[1000], [1400]};
        EEG.epoch(3).eventposition = {[2], []};
        EEG.epoch(3).eventtype = {'square', 'rt'};
        EEG.epoch(3).eventurevent = {[4], [5]};

        cepochval = [NaN, 3, 5];
        callepochval = {[], [3], [5]};

        [repochval, rallepochval] = eeg_getepochevent( EEG, 'type','rt','fieldname','urevent'); %Ramon ( EEG, 'rt', [], 'urevent');

        if ~near(repochval, cepochval) || ~near([rallepochval{:}], [callepochval{:}])
           error('EEGLAB:unittesting', 'Error in eeg_getepochevent(): incorrect output');
        end;

