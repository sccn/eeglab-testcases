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

% Crash

function pass_one_epoch()

%         EEG = eeg_emptyset;
%         EEG.nbchan = 2; % channels
%         EEG.pnts = 3;   % data
%         EEG.trials = 1; % epochs
%         EEG.srate = 1;
%         EEG.xmin = 0;
%         EEG.xmax = 2;
% 
%         %                channels, data, epochs
%         EEG.data = zeros(    2,      3,    1);
% 
%         % channel 1  <--   epochs   -->
%         EEG.data(1,:,:) = [ [  2 ]; ... % <--
%                             [  7 ]; ... % <-- data
%                             [ 12 ] ];   % <--
%         % channel 2  <--   epochs   -->
%         EEG.data(2,:,:) = [ [  4 ]; ... % <--
%                             [  5 ]; ... % <-- data
%                             [  6 ] ];   % <--
% 
%         elecs = [ 1 2 ];
%         negthresh = 2;
%         posthresh = 13;
%         timerange = [1 3];
%         starttime = 1;
%         endtime = 3;
% 
%         cIin = [ 1 ];
%         cIout = zeros(1,0);
%         %                channels, data, epochs
%         cnewsignal = zeros(    2,      3,    1);
% 
%         % channel 1  <--   epochs   -->
%         cnewsignal(1,:,:) = [ [  2 ]; ... % <--
%                               [  7 ]; ... % <-- data
%                               [ 12 ] ];   % <--
%         % channel 2  <--   epochs   -->
%         cnewsignal(2,:,:) = [ [  4 ]; ... % <--
%                               [  5 ]; ... % <-- data
%                               [  6 ] ];   % <--
%         celec = zeros(2,0);
% 
%         [rIin, rIout, rnewsignal, relec] = eegthresh( EEG.data, EEG.pnts, elecs, negthresh, posthresh, timerange, starttime, endtime);
% 
%         if ~near(cIin, rIin) || ~near(cIout, rIout) ...
%         || ~near(cnewsignal, rnewsignal) ...
%         || ~near(celec, relec)
%             error('EEGLAB:unitesting', 'Error in eegthresh(): incorrect result.');
%         end;
