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

function pass_inf()

data = [ [ 1 +Inf 3 8 5 ];...
    [ +Inf 2 7 5 1 ];...
    [ 7 1 4 9 +Inf ];...
    [ 7 +Inf 3 -Inf 9 ];...
    [ 2 -Inf 9 +Inf 4 ];...
    [ +Inf -Inf +Inf -Inf +Inf ] ];

correct = [ [ +Inf 2  1 ];...
    [ +Inf 1  1 ];...
    [ +Inf 5  1 ];...
    [ +Inf 4 -1 ];...
    [ +Inf 4  1 ];...
    [ +Inf 5  1 ] ];

[amps, frames, signs] = abspeak(data);
result = [amps, frames, signs];

if ~near(correct, result)
    error('EEGLAB:unittesting', 'Error in abspeak(): wrong output.')
end;

