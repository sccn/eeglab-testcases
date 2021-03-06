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

function pass_center_file()

% cartesian: (top view)
%
%          +x
%           |
%          /|\
%       ,o  |  o.
%      /    |    \
% -y --|----+----|-- +y
%      \    |    /
%       `.__|__.'
%           |
%          -x

% polar: (top view)
%
% -45     0     45
%         |
%         |
% -90 ----+---- 90
%         |
%         |
% -135  +-180  135

        map = [ [ 1 ];[ 1 ];[ 1 ]; ...
                [ 1 ];[ 2 ];[ 1 ]; ...
                [ 1 ];[ 1 ];[ 1 ] ];

        filename = 'test.locs';
        draw = 1;

        [gradX, gradY] = gradmap(map, filename, draw);

        if ~near(length(gradX), 9) ...    % 3*3 values
        || ~near(length(gradY), 9) ...    % 
        || ~all( gradX([1,2,3]) < 0 ) ... % points down
        || ~near(gradX([4,5,6]) , zeros(3,1) ) ... % 
        || ~all( gradX([7,8,9]) > 0 ) ... % points up
        || ~all( gradY([1,4,7]) > 0 ) ... % points right
        || ~near(gradY([2,5,8]) , zeros(3,1) ) ... % 
        || ~all( gradY([3,6,9]) < 0 )     % points left
            error('EEGLAB:unittesting', 'Error in gradmap()');
        end;
close;
