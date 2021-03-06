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

function passed = pass_clear()

		chanlocs1 = {'a','b','c'};
		chanlocs2 = {'a','b','x'};

		cstr1 = {' 1 -   a' ' 2 -   b' ' 3 -   c'};
		cstr2 = {' 1 -   a' ' 2 -   b' ' 3 -   x'};
		clist1 = [];
		clist2 = [];

		[newchanstr1 newchanstr2 chanlist1 chanlist2] = pop_chancoresp('clear',chanlocs1,chanlocs2);
		if ~near(cstr1, newchanstr1) ...
				|| ~near(cstr2, newchanstr2) ...
				|| ~near(clist1, chanlist1) ...
				|| ~near(clist2, chanlist2)
			error('EEGLAB:unittesting', 'Error in pop_chancoresp(): incorrect ouput');
		end;
