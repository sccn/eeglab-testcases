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


% bug 857
function passed = pass_two()
%     passed = tc_notpassed;
%     try
%         % load EEGLab Plugins
%         dipfitPath = tc_getPluginDir('dipfit');
%         if strcmp(dipfitPath, '')
%             return;
%         end;
%         if isempty(findstr(path, dipfitPath))
%             addpath(dipfitPath);
%         end;
% 
%         EEG(1) = tc_emptyset;
%         EEG(1).nbchan = 3; % channels
%         EEG(1).pnts = 5;   % data
%         EEG(1).trials = 1; % epochs
%         EEG(1).srate = 1;
%         EEG(1).xmin = 0;
%         EEG(1).xmax = 3;
%         %                channels, data
%         EEG(1).data = zeros(    3,      5);
% 
%         %            <--    data    -->
%         EEG(1).data = [ [  1  2  3  4  5 ]; ... % <--
%                       [  6  7  8  9 10 ]; ... % <-- channels
%                       [ 11 12 13 14 15 ] ];   % <--
%         % ###############
%         EEG(2) = tc_emptyset;
%         EEG(2).nbchan = 3; % channels
%         EEG(2).pnts = 6;   % data
%         EEG(2).trials = 1; % epochs
%         EEG(2).srate = 1;
%         EEG(2).xmin = 0;
%         EEG(2).xmax = 3;
%         %                channels, data
%         EEG(2).data = zeros(    3,      6);
% 
%         %            <--    data    -->
%         EEG(2).data = [ [ 1 4 7 10 13 16 ]; ... % <--
%                       [ 2 5 8 11 14 17 ]; ... % <-- channels
%                       [ 3 6 9 12 15 18 ] ];   % <--
%         % ###############
%         regions = [ [ 2 3 ] ];
%         cdata1 = [ [  1  4  5 ]; ...
%                    [  6  9 10 ]; ...
%                    [ 11 14 15 ] ];
% 
%         cdata2 = [ [ 1 10 13 16 ]; ...
%                    [ 2 11 14 17 ]; ...
%                    [ 3 12 15 18 ] ];
% 
%         cevent.type = 'boundary';
%         cevent.duration = 2;
%         cevent.latency = 1.5;
% 
%         eeglab_exec('eeg_eegrej', EEG, 'params', {regions});
% 
%         if near(cdata1, EEG(1).data) ...
%         && near(cevent, EEG(1).event) ...
%         && near(cdata2, EEG(2).data) ...
%         && near(cevent, EEG(2).event)
%             passed = tc_passed;
%         end;
%     catch % not passed on error
%     end;
% end
