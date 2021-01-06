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

    	file = 'test.elp';
		labels = {'Nz' 'LPA' 'RPA' 'REF' 'FP1' 'FPZ' 'FP2'};
		types = {'FID' 'FID' 'FID' 'EEG' 'EEG' 'EEG' 'EEG'};
		X = [0.1011 -0.0135  0.0135 -0.0092 0.1091  0.1176  0.1179];
		Y = [0.0000  0.0731 -0.0731 -0.0779 0.0102 -0.0184 -0.0470];
		Z = [0.0000  0.0000  0.0000 -0.0036 0.0583  0.0595  0.0565];

		[eloc names x y z] = readelp(file);
		if ~isequal({eloc.labels},names) ...
				|| ~isequal([eloc.X],x) ...
				|| ~isequal([eloc.Y],y) ...
				|| ~isequal([eloc.Z],z) ...
				|| ~isequal(names,labels) ...
				|| ~isequal(x,X) ...
				|| ~isequal(y,Y) ...
				|| ~isequal(z,Z) ...
				|| ~isequal({eloc.type},types)
			error('EEGLAB:unittesting', 'Error in readelp(): incorrect result.');
		end;
