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

inALLEEG(1) = EEG1;
inALLEEG(2) = EEG2;

[rEEG rALLEEG rCURRENTSET] = eeg_retrieve(inALLEEG, [2 1]);

for i = 1:length(rEEG)
    rnbchan{i} = rEEG(i).nbchan;
    rpnts{i}   = rEEG(i).pnts;
    rtrials{i} = rEEG(i).trials;
    rsrate{i} = rEEG(i).srate;
    rxmin{i} = rEEG(i).xmin;
    rxmax{i} = rEEG(i).xmax;
    rdata{i} = rEEG(i).data;
end;
if ~near(rnbchan, {EEG2.nbchan, EEG1.nbchan}) ...
        || ~near(rtrials, {EEG2.trials, EEG1.trials}) ...
        || ~near(rpnts,   {EEG2.pnts,   EEG1.pnts}) ...
        || ~near(rsrate,  {EEG2.srate,  EEG1.srate}) ...
        || ~near(rxmin,   {EEG2.xmin,   EEG1.xmin}) ...
        || ~near(rxmax,   {EEG2.xmax,   EEG1.xmax}) ...
        || ~near(rdata,   {EEG2.data,   EEG1.data})
    error('EEGLAB:unittesting', 'Error in eeg_retrieve --- Incorrect retrieve.');
end;

