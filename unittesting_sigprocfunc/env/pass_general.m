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

function pass_general()

        %      <-- channels -->
        data = [ [  2  1  3 ]; ... % <--
                 [  8  2  6 ]; ... % <--
                 [  4  7  3 ]; ... % <-- data
                 [  0  1 -3 ]; ... % <--
                 [ -5  3  1 ] ];   % <--
    
        cenvdata = [ [  8  7  6 ];...
                     [ -5  1 -3 ] ];

        [renvdata] = env(data);

        if ~near(cenvdata, renvdata)
            error('EEGLAB:unittesting', 'Error in env(): incorrect result.');
        end;

