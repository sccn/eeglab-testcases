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

function passed = pass_multiple()

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

        rej = [ [ 3.0000 6.0000 ...        % selected part in data
                  0.8345 1.0000 0.9560 ... % color of marked part (here turquoise)
                  0.0000 0.0000 ]; ...
                [ 6.0000 9.0000 ...        % selected part in data
                  0.8345 1.0000 0.9560 ... % color of marked part (here turquoise)
                  0.0000 0.0000 ] ];

        % reject middle epoch
        ctrialrej = [ 0 1 1 ];
        celecrej = [ [ 0 0 0 ]; ...
                     [ 0 0 0 ] ];

        [rtrialrej, relecrej] = eegplot2trial(rej, EEG.pnts, EEG.trials);

        if ~near(rtrialrej, ctrialrej) ...
        || ~near(relecrej, celecrej)
            error('EEGLAB:unitesting', 'Error in eegplot2trial.');
        end;
