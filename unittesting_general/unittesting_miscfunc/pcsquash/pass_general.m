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

function pass_general()

		data = [[ 1 2 3  4 5];...
				[-2 0 2 -1 6]];
		v1 = 0.5*sqrt(2-sqrt(2)); % temporal variable
		v2 = 0.5*sqrt(2+sqrt(2)); % temporal variable
		ceigvec = [[v1 -v2]; ...
				   [v2  v1]];
		ceigval = [5+3*sqrt(2)  5-3*sqrt(2)];
		ccompressed = [[-2*v1-3*v2  -v1-v2  v2   v1-2*v2   2*v1+5*v2]; ...
					   [ 2*v2-3*v1   v2-v1  v1  -v2-2*v1  -2*v2+5*v1]];
		cmean = [3 1];
		[reigvec reigval rcompressed rmean] = pcsquash(data);
		if ~near(ceigvec, reigvec) ...		% check if corresponding values are equal
				|| ~near(ceigval, reigval) ...
				|| ~near(ccompressed, rcompressed) ...
				|| ~near(cmean, rmean)
			error('EEGLAB:unittesting', 'Error in pcsquash().');
		end;
