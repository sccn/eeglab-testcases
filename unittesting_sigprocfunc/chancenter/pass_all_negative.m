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

function pass_all_negative()
        x = [-1  2 -1  2 ];
        y = [ 1  1 -2 -2 ];
        z = [ 0 -1  0  1 ];
        cc = [ 3 -2 0.5 ];

        cx = [-4 -1 -4 -1 ];
        cy = [ 3  3  0  0 ];
        cz = [-0.5 -1.5 -0.5  0.5 ];
    
        [rx ry rz rc] = chancenter(x, y, z, cc);

        if ~near(cx, rx) || ~near(cy, ry) || ~near(cz, rz) || ~near(cc, rc)
            error('EEGLAB:unittesting', 'Error in chancenter(): incorrect result.');
        end;
