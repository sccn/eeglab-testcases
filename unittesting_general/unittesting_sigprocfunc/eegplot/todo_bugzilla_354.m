% Testcases for EEGLab
% Copyright (C) 2007 Andreas Romeyke & Maxim Duester
% Max-Planck-Institute for Human Cognitive and Brain Sciences Leipzig, Germany
% romeyke@cbs.mpg.de, art1@andreas-romeyke.de
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

% Reject data by abnormal spectra and plotting afterwards failed

% bug 354

function passed = todo_bugzilla_354()
% 
%     	EEG.nbchan = 3;
%     	EEG.pnts = 2;
%     	EEG.trials = 2;
%     	EEG.data = [1 2 3 0 -2 8 5 4 3 1 2 9];
%     	EEG.icaweights = [];
%     	EEG.icasphere = [];
% 		EEG.icawinv = [];
%     	EEG.setname = '';
%     	EEG.srate = 1;
%     	EEG.xmin = 0;
%     	EEG.xmax = 1;
%     	EEG.chanlocs = [];
% 		EEG.filename = [];
% 		EEG.filepath = [];
% 		
% 		[EEG command] = pop_biosig;
%     	if ~isempty(command) ...		% 'Cancel' was pressed
% 				&& ~near(cdata, EEG.data) % otherwise
% 			error('EEGLAB:unittesting.', 'Error in eegplot(): bugzilla_354.');
% 		end;
