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

% Need user control

% function passed = i_pass_clim_xticks()
% 
%         times = 1:4;
%         freqs = 1:4;
%         data  = [ [1:4]; ...
%                   [5:8]; ...
%                   [9:12]; ...
%                   [13:16] ];
%         % <= 8 in matrix is lowest color (blue) and >= 16 is highest color (red)
%         clim = [8 16];
%         xticks = 1:4;
% 
%         figure;
%         imagesclogy(times, freqs, data, clim);
%         figure;
%         imagesclogy(times, freqs, data, clim, xticks);
%         disp(          '#########################################################');
%         answer = input('### Is the upper half of BOTH plots plain blue? (y/n) ### ', 's');
% 
%      if strncmpi(answer, 'n', 1)
%             error('EEGLAB:unittesting', 'Error in imagesclogy()');
% 
%         end;

