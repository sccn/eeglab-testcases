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

% Return NaN
function pass_normalize_3d()

% 	signal = zeros(3, 4, 2);
% 	signal(:,:,1) = [ [1 1 3 4]; ...
% 			  [1 2 1 4]; ...
% 			  [1 2 3 4] ];
% 	signal(:,:,2) = [ [1 2 3 4]; ...
% 			  [1 2 1 4]; ...
% 			  [2 2 3 4] ];
% 	threshold = 0;
% 	jp = [];
% 	normalize = 1;
% 
% 	cjp = [ [-sqrt(2)/2,  sqrt(2)/2]; ...
% 	        [0, 0]; ...
% 		[ sqrt(2)/2, -sqrt(2)/2]];
% 	crej = [ [0, 0]; ...
% 	         [0, 0]; ...
% 	         [0, 0] ];
% 
% 	[rjp, rrej] = jointprob(signal, threshold, jp, normalize);
% 	
% 	if ~near(cjp, rjp) ...
% 	|| ~near(crej, rrej)
% 	    error('EEGLAB:unittesting', 'Error in jointprob(): incorrect result.');
% 	end;