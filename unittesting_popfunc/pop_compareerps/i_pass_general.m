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

% function passed = i_pass_general()
%     passed = tc_notpassed;
%     try
%     	addpath('../../../plugins/dipfit2.0'); % needed internally
% 
% 		alleeg1 = pop_loadset('test.set','');
% 		alleeg2 = pop_loadset('test_2.set','');
% 		alleeg = [alleeg1 alleeg2];
% 		com = pop_compareerps(alleeg);
% 		tc_confirm('Default parameters');
% 		passed = tc_passed;
%     catch
%     end;
% end