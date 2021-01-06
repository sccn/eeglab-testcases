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

function pass_add_field_file_indices()


		eeg = pop_loadset('test_no_events.set','');
		test = 'addfieldindices.txt';		% to be added
		testvar = [0 -5.33 14.7 10];
		indices = [2 3 6 10];

		[neweeg com] = pop_editeventfield(eeg,'test',test,'indices',indices);
		for i = 1:length(indices)
			if ~isfield(neweeg.event(indices(i)),'test') || ~isequal(neweeg.event(indices(i)).test,testvar(i))
				error('EEGLAB:unittesting', 'Error in pop_editeventfield(): incorrect ouput.');
			end;
		end;

