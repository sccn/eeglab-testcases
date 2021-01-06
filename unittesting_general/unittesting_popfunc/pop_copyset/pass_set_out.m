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

function passed = pass_out()

		alleeg1 = pop_loadset('test.set','');
		alleeg2 = pop_loadset('test_2.set','');
		alleeg = [alleeg1 alleeg2];
		set_in = 2;
		set_out = 1;
		[newalleeg eeg current com] = pop_copyset(alleeg,set_in,set_out);

		% workaround to pass 'near' function
		for i = 1:length(newalleeg)
			newalleeg(i).history = '';
			newalleeg(i).saved = '';
		end;
		eeg.history = '';
		eeg.saved = '';
		
		if ~near(newalleeg(set_in),newalleeg(set_out)) ...
				|| ~near(newalleeg(current),eeg) ...
				|| ~( current == set_out)
			error('EEGLAB:unittesting', 'Error in pop_copyset(): incorrect output.');
		end;
