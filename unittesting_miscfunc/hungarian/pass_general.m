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

        % original matrix
        % 1 1 1 2
        % 3 2 4 1
        % 4 4 2 4
        % 2 3 3 3
        
        % minimum of rows and columns
        % 1 1 1 2 | 1
        % 3 2 4 1 | 1
        % 4 4 2 4 | 2
        % 2 3 3 3 | 2
        %---------
        % 1 1 1 1
        
        % column minimum subtracted
        % 0 0 0 1 | 0
        % 2 1 3 0 | 0
        % 3 3 1 3 | 1
        % 1 2 2 2 | 1
        %---------
        % 0 0 0 0
        
        % row minimum subtracted
        % 0 0 0 1 | 0
        % 2 1 3 0 | 0
        % 2 2 0 2 | 0
        % 0 1 1 1 | 0
        %---------
        % 0 0 0 0
        
        % ideal values marked
        %  0 x0  0  1 | 0
        %  2  1  3 x0 | 0
        %  2  2 x0  2 | 0
        % x0  1  1  1 | 0
        %-------------
        %  0  0  0  0

        % row numbers:
        %  4  1  3  2
        % total cost: (sum of marked elements)
        %  2 +1 +2 +1 = 6

        A=[ [ 1 1 1 2 ]; ...
            [ 3 2 4 1 ]; ...
            [ 4 4 2 4 ]; ...
            [ 2 3 3 3 ] ];

        cC = [ 4 1 3 2 ];
        cT = 6;
        [rC, rT] = hungarian(A);

        if ~near(cC, rC) ...
        || ~near(cT, rT)
            error('EEGLAB:unittesting', 'Error in hungarian().');
        end;
