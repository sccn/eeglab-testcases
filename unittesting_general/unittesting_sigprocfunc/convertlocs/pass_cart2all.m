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

function pass_cart2all()

        chanlocs(1).labels = 'a';
        chanlocs(1).X = -sqrt(2)/2;
        chanlocs(1).Y = sqrt(2)/2;
        chanlocs(1).Z = 0;
        chanlocs(1).type = 'EEG';

        chanlocs(2).labels = 'b';
        chanlocs(2).X = 1;
        chanlocs(2).Y = 0;
        chanlocs(2).Z = 0;
        chanlocs(2).type = 'EEG';

        chanlocs(3).labels = 'c';
        chanlocs(3).X = 0;
        chanlocs(3).Y = -1;
        chanlocs(3).Z = 0;
        chanlocs(3).type = 'EEG';

        chanlocs(4).labels = 'd';
        chanlocs(4).X = sqrt(2)/2;
        chanlocs(4).Y = -sqrt(2)/2;
        chanlocs(4).Z = 0;
        chanlocs(4).type = 'EEG';



        cnewchans(1).labels = 'a';
        cnewchans(1).theta = -135;
        cnewchans(1).radius = 0.5;
        cnewchans(1).X = -sqrt(2)/2;
        cnewchans(1).Y = sqrt(2)/2;
        cnewchans(1).Z = 0;
        cnewchans(1).sph_theta = 135;
        cnewchans(1).sph_phi = 0;
        cnewchans(1).sph_radius = 1;
        cnewchans(1).sph_theta_besa = -90;
        cnewchans(1).sph_phi_besa = 45;
        cnewchans(1).type = 'EEG';

        cnewchans(2).labels = 'b';
        cnewchans(2).theta = 0;
        cnewchans(2).radius = 0.5;
        cnewchans(2).X = 1;
        cnewchans(2).Y = 0;
        cnewchans(2).Z = 0;
        cnewchans(2).sph_theta = 0;
        cnewchans(2).sph_phi = 0;
        cnewchans(2).sph_radius = 1;
        cnewchans(2).sph_theta_besa = 90;
        cnewchans(2).sph_phi_besa = 90;
        cnewchans(2).type = 'EEG';

        cnewchans(3).labels = 'c';
        cnewchans(3).theta = 90;
        cnewchans(3).radius = 0.5;
        cnewchans(3).X = 0;
        cnewchans(3).Y = -1;
        cnewchans(3).Z = 0;
        cnewchans(3).sph_theta = -90;
        cnewchans(3).sph_phi = 0;
        cnewchans(3).sph_radius = 1;
        cnewchans(3).sph_theta_besa = 90;
        cnewchans(3).sph_phi_besa = 0;
        cnewchans(3).type = 'EEG';

        cnewchans(4).labels = 'd';
        cnewchans(4).theta = 45;
        cnewchans(4).radius = 0.5;
        cnewchans(4).X = sqrt(2)/2;
        cnewchans(4).Y = -sqrt(2)/2;
        cnewchans(4).Z = 0;
        cnewchans(4).sph_theta = -45;
        cnewchans(4).sph_phi = 0;
        cnewchans(4).sph_radius = 1;
        cnewchans(4).sph_theta_besa = 90;
        cnewchans(4).sph_phi_besa = 45;
        cnewchans(4).type = 'EEG';



% cartesian: (top view)
%
%          +x
%           |
%          /|\
%       ,o  |  o.
%      /    |    \
% +y --|----+----|-- -y
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


%     (top view)                 (right view)
%        [X]                         [Z]      
%         b                             
%         |    d                      |
%         |                           |
% [Y] ----+---- c [-Y]     [-X]   a - c - d b [X]
%         |                           |
%    a    |                           |
%                                                    
%       [-X]                        [-Z]

        rnewchans = convertlocs(chanlocs, 'cart2all');

        if ~near(cnewchans, rnewchans)
            error('EEGLAB:unitesting', 'Error in convertlocs(): incorrect result.');
        end;

