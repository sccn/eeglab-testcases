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

function pass_overlap()

        EEG = eeg_emptyset;
        EEG.nbchan = 3; % channels
        EEG.pnts = 6;   % data
        EEG.trials = 1; % epochs
        EEG.srate = 1;
        EEG.xmin = 0;
        EEG.xmax = 3;
        %                channels, data
        EEG.data = zeros(    3,      6);

        %            <--    data    -->
        EEG.data = [ [  1  2  3  4  5  6 ]; ... % <--
                     [  7  8  9 10 11 12 ]; ... % <-- channels
                     [ 13 14 15 16 17 18 ] ];   % <--
        % region 1:       <------>
        % region 2:          <------>
        regions = [ [2 4]; ... % overlaps!
                    [3 5] ];
        timelength = EEG.pnts / EEG.srate;

        coutdata = [ [  1  6 ]; ...
                     [  7 12 ]; ...
                     [ 13 18 ] ];
        cnewt = 2; % in seconds
        cnewevents = [];
        cboundevents = [ [ 1.5 ] ];

        [routdata, rnewt, rnewevents, rboundevents] = eegrej(EEG.data, regions, timelength, []);

        if ~near(coutdata, routdata) ...
        || ~near(cnewt, rnewt) ...
        || ~near(cboundevents, rboundevents)
            error('EEGLAB:unittesting', 'Error in eegrej');
        end;
