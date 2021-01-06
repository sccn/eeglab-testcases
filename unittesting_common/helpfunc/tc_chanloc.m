% Testcases for EEGLab
% Copyright (C) 2007 Andreas Romeyke & Maxim Duester
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
% 
% this function returns a channel location structure
% which attributes are set from the parameters given
%(at least x,y,z, optionally labels, theta & radius)

function chanlocobj = chanloc(x,y,z, labels, theta, radius)
	if nargin<3
		help tc_chanloc;
		return
	end;

	chanlocobj.X = x;
	chanlocobj.Y = y;
	chanlocobj.Z = z;
	chanlocobj.theta = 0;
	chanlocobj.radius = 0;
	chanlocobj.labels = '';

	if nargin >= 4
		chanlocobj.labels = labels;
	end;
	if nargin >= 5
		chanlocobj.theta = theta;
	end;
	if nargin == 6
		chanlocobj.radius = radius;
	end;
	return;