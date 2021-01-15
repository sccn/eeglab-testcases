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

function passed = pass_epochs()

        EEG = eeg_emptyset;
        EEG.nbchan = 3; % channels
        EEG.pnts = 20;   % data
        EEG.trials = 1; % epochs
        EEG.srate = 1;
        EEG.xmin = 0;
        EEG.xmax = 2;

        %              <------------------------ data --------------------------->
        EEG.data = [ [  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 ]; ... % <--
                     [ 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 ]; ...   % <-- channels
                     [ 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 ] ];   % <-- channels

        % this line failed in 6b
        EEG = pop_reref(EEG, [1 2], 'method', 'standard');


