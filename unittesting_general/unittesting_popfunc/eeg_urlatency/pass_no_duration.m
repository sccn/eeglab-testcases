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

function pass_no_duration()
        event(1).type = 'boundary';
        %event(1).duration = 2;
        event(1).latency = 1.5;

        event(2).type = 'boundary';
        %event(2).duration = 3;
        event(2).latency = 5.5;

        event(3).type = 'boundary';
        %event(3).duration = 1;
        event(3).latency = 9.5;

        lat = 9;
        clat = NaN;
        rlat = eeg_urlatency(event, lat);

        if ~near(rlat, clat)
            error('EEGLAB:unittesting', 'Error in eeg_urlatnecy(): incorrect output.');
        end;
