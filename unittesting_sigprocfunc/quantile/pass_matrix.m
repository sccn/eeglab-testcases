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

function pass_matrix()

    	data = [[-1 0 -4 -2]; ...
    			[ 1 2  5  8]; ...
    			[ 3 7  6 10]];
    	pc = [0 0.25 0.5 0.75 1];
    	
    	% modified data =
    	% [[-1 0 -4 -2]; ...
		%  [-1 0 -4 -2]; ...
		%  [ 1 2  5  8]; ...
		%  [ 3 7  6 10]; ...
		%  [ 3 7  6 10]]
    	% pt = [0 1/6 3/6 5/6 1] => for e.g. first column
    	% 0->-1, 1/6->-1, 3/6->1, 5/6->3, 1->3

		cq = [[-1   0    -4    -2   ]; ...
			  [-0.5 0.5  -1.75  0.5 ]; ...
			  [ 1   2     5     8   ]; ...
			  [ 2.5 5.75  5.75  9.5 ]; ...
			  [ 3   7     6    10   ]];

		q = quantile(data,pc);
		if ~near(q,cq) && ~near(q,cq)
			error('EEGLAB:unittesting', 'Error in quantile(): incorrect result.');
		end;