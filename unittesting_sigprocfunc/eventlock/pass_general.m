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

% Crash

function pass_general()
% 
%         %        <--         frames * epochs         -->
%         %          |------| |------| |------| |------|
%         data = [ [  1  2  3  4  5  6  7  8  9 10 11 12 ]; ... % <-- channels
%                  [ 13 14 15 16 17 18 19 20 21 22 23 24 ] ];   % <--
% 
%         frames = 0; % find correct value
%         eventframes =     [ 1 2 3 4 ];
%         % shift left:       0 1 2 2 (epoch length == 3, shift by 3 not possible)
%         medval = 2;
%         % shift left by 1: -1 0 1 1
% 
%         % changed to right shift
%         cshiftframes = [ 1 0 -1 -1 ];
% 
%         %              <--              frames * epochs               -->
%         %              |---------|  |---------|  |---------|  |---------|
%         cdataout = [ [ NaN   1   2    4   5   6    8   9 NaN   11  12 NaN ]; ... % <-- channels
%                      [ NaN  13  14   16  17  18   20  21 NaN   23  24 NaN ] ];   % <--
%         %              
%         cmedval = 2;
% 
%         [rdataout,rmedval,rshiftframes] = eventlock(data, frames, eventframes, medval);
% 
%         if ~near(cdataout, rdataout) ...
%         || ~near(cmedval, rmedval) ...
%         || ~near(cshiftframes, rshiftframes)
%             error('EEGLAB:unittesting', 'Error in eventlock()');
%         end;

