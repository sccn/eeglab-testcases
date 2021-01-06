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

function pass_multiple()
EEG1 = eeg_emptyset;
EEG1.nbchan = 1; % channels
EEG1.trials = 1; % epochs
EEG1.pnts = 1;
EEG1.srate = 1;
EEG1.xmin = 0;
EEG1.xmax = 0;
EEG1.data = [1];

EEG2 = eeg_emptyset;
EEG2.nbchan = 1; % channels
EEG2.trials = 1; % epochs
EEG2.pnts = 1;
EEG2.srate = 1;
EEG2.xmin = 0;
EEG2.xmax = 0;
EEG2.data = [2];

EEG3 = eeg_emptyset;
EEG3.nbchan = 1; % channels
EEG3.trials = 1; % epochs
EEG3.pnts = 1;
EEG3.srate = 1;
EEG3.xmin = 0;
EEG3.xmax = 0;
EEG3.data = [3];

EEG4 = eeg_emptyset;
EEG4.nbchan = 1; % channels
EEG4.trials = 1; % epochs
EEG4.pnts = 1;
EEG4.srate = 1;
EEG4.xmin = 0;
EEG4.xmax = 0;
EEG4.data = [4];

inALLEEG(1) = EEG1;
inALLEEG(3) = EEG2; % !!

[rALLEEG rEEG rCURRENTSET] = eeg_store(inALLEEG, [EEG3 EEG4]);

%                         old        new        old        new
if ~near( {rALLEEG.data}, {EEG1.data, EEG3.data, EEG2.data, EEG4.data} )
    error('EEGLAB:unittesting', 'Error in eeg_store --- The new EEG set is not correctly assigned in ALLEEG');
end;

