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

function pass_mean()

	x = [ [ 5 3 1 ]; ...
	      [ 9 4 8 ]; ...
	      [ 3 4 8 ] ];

	y = [ [ 9 4 8 ]; ...
	      [ 5 3 1 ]; ...
	      [ 3 4 8 ] ];
	
	[rcorr, rindx, rindy, rcorrs] = matcorr(x, y, 1); 

	if ~near(x(rindx,:), y(rindy,:)) ...
	|| ~near(size(rindx), size(unique(rindx))) ... % no repeated lines
	|| ~near(size(rindy), size(unique(rindy))) ...
	|| ~near(rcorrs(rindx(1), rindy(1)), 1) ...
	|| ~near(rcorrs(rindx(2), rindy(2)), 1) ...
	|| ~near(rcorrs(rindx(3), rindy(3)), 1) ...
	|| ~all(rcorr <= 1)
	    error('EEGLAB:unittesting', 'Error in matcorr(): incorrect result.');
	end;
