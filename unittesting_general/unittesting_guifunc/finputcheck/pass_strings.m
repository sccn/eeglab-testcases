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

function pass_strings()

varg = { 'key1', 3, ...
    'the2test', 'foo', ...
    'p3rcent', 0.4937, ...
    'forth', {'a', 2, '11b', 'D'} };
correct.key1 = 3;
correct.the2test = 'bar';
correct.p3rcent = 0.4937;
correct.forth = {'a', 2, '11b', 'D'};

result = finputcheck(varg, ... % documentation shows cell array for "required strings"
    { 'the2test', 'string',  {'foo', 'bar'}, ['baz']; ...
    'key1',     'integer', [1 5],          [2]; ...
    'p3rcent',  'real',    [0 1],          [1/sqrt(2)]; ...
    'forth',    'cell',    [],             [] });

if near(correct, result)
    error('EEGLAB:unittesting', 'Error in finputcheck --- Incorrect check.');
end;
