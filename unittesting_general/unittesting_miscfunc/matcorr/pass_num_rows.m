% Testcases for EEGLab
% Copyright (C) 2006 Andreas Romeyke & Ronny Lindner
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

function pass_num_rows()

	x = [ [ 1 2 3 ]; ...
	      [ 7 8 9 ]; ...
	      [ 4 5 6 ]; ...
	      [ 11 12 13 ] ];

	y = [ [ 4 5 6 ]; ...
	      [ 1 2 3 ]; ...
	      [ 7 8 9 ]];
	
	[rcorr, rindx, rindy, rcorrs] = matcorr(x, y);

% 	if ~near(x(rindx,:), y(rindy,:)) ...
% 	|| ~near(size(rindx), size(unique(rindx))) ... % no repeated lines
% 	|| ~near(size(rindy), size(unique(rindy))) ...
% 	|| ~all(rcorr <= 1)
% 	    error('EEGLAB:unittesting', 'Error in matcorr(): incorrect result.');
% 	end;

