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

function pass_std_timeunit()

        %               <---> | <-----> <------>
        lat_array =   [ 2 2.3 6 10 10.4 14 14.25 ];
        epoch_array = [ 1   1 2 3     3 4      4 ];
        srate = 1;
        timelimits = [ -1 2 ];
        % timeunit = 1; % sec -> sec

        cnewlat = [ 0 0.3 0 0 0.4 0 0.25 ]; %starts with 1 not with 0 --> x+1

        [rnewlat] = eeg_point2lat( lat_array, epoch_array, srate, timelimits);
        
        if ~near(cnewlat, rnewlat)
            error('EEGLAB:unittesting', 'Error in eeg_point2lat(): incorrect output');
        end;
