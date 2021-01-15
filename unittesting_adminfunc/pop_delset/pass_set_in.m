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

function passed = pass_set_in()

% addpath('../../../plugins/dipfit2.0'); % needed internally
try, if ~ismatlab, return; end; catch, end;

alleeg1 = pop_loadset('test.set','');
alleeg2 = pop_loadset('test_2.set','');
alleeg = [alleeg1 alleeg2];
set_in = 1;
[allset com] = pop_delset(alleeg,set_in);

% check if all fields empty
flag = true;
f = fieldnames(allset);
for i = 1:length(f)
    if ~isempty(allset(set_in).(f{i}))
        flag = false;
        break;
    end;
end;

if ~flag
    error('EEGLAB:unittesting', 'Error in popdelset(): Some data set is not clearly deleted.');
end;
