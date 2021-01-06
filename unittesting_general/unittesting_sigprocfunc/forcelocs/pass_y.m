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

function pass_y()

        chanlocs(1).labels = 'a';
        chanlocs(1).theta = -135;
        chanlocs(1).radius = 0.25;
        chanlocs(1).X = -0.5;      % cos(45/180*pi) * cos(135/180*pi)
        chanlocs(1).Y = 0.5;       % cos(45/180*pi) * sin(135/180*pi)
        chanlocs(1).Z = sqrt(2)/2; % sin(45/180*pi);
        chanlocs(1).sph_theta = 135;
        chanlocs(1).sph_phi = 45;
        chanlocs(1).sph_radius = 1;
        chanlocs(1).type = 'EEG';

        chanlocs(2).labels = 'b';
        chanlocs(2).theta = 0;
        chanlocs(2).radius = 0.5;
        chanlocs(2).X = 1;
        chanlocs(2).Y = 0;
        chanlocs(2).Z = 0;
        chanlocs(2).sph_theta = 0;
        chanlocs(2).sph_phi = 0;
        chanlocs(2).sph_radius = 1;
        chanlocs(2).type = 'EEG';

        chanlocs(3).labels = 'c';
        chanlocs(3).theta = 90;
        chanlocs(3).radius = 0.5;
        chanlocs(3).X = 0;
        chanlocs(3).Y = -1;
        chanlocs(3).Z = 0;
        chanlocs(3).sph_theta = -90;
        chanlocs(3).sph_phi = 0;
        chanlocs(3).sph_radius = 1;
        chanlocs(3).type = 'EEG';

        chanlocs(4).labels = 'd';
        chanlocs(4).theta = 45;
        chanlocs(4).radius = 0.5;
        chanlocs(4).X = sqrt(2)/2;
        chanlocs(4).Y = -sqrt(2)/2;
        chanlocs(4).Z = 0;
        chanlocs(4).sph_theta = -45;
        chanlocs(4).sph_phi = 0;
        chanlocs(4).sph_radius = 1;
        chanlocs(4).type = 'EEG';



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

% a.y = 0.5: (top view)         (front view)
%        [X]                         [Z]      
%         b                             
%         |    d                  a   |
%         |                           |
% [Y] ----+---- c [-Y]      [Y]   - - b - d c [-Y]
%         |                           |
%     a   |                           |
%                                                    
%       [-X]                        [-Z]

% a.y = 1: (top view)             (front view)      
%                                   1.0           
%                                 |<---|          
%          [X]                  [Z]        [-Y]   
%           b                                c     
%           |  d                   `.      d'     
%           |                        `.  .'       
% [Z,Y] ----+---c   [-Z,-Y]       a    b        
%           |                        ,'  `.     
%     a     |                      ,'      `.   
%                                              
%         [-X]                  [Y]        [-Z] 

% for a description see pass_x.m

        cnewlocs(1).labels = 'a';
        cnewlocs(1).theta = -120
        cnewlocs(1).radius = 0.5;
        cnewlocs(1).X = -0.5;
        cnewlocs(1).Y = sqrt(12)/4;
        cnewlocs(1).Z = 0;
        cnewlocs(1).sph_theta = 120;
        cnewlocs(1).sph_phi = 0;
        cnewlocs(1).sph_radius = 1;
        cnewlocs(1).type = 'EEG';
        cnewlocs(1).sph_theta_besa = -90;
        cnewlocs(1).sph_phi_besa = 30;

        cnewlocs(2).labels = 'b';
        cnewlocs(2).theta = 0;
        cnewlocs(2).radius = 0.5;
        cnewlocs(2).X = 1;
        cnewlocs(2).Y = 0;
        cnewlocs(2).Z = 0;
        cnewlocs(2).sph_theta = 0;
        cnewlocs(2).sph_phi = 0;
        cnewlocs(2).sph_radius = 1;
        cnewlocs(2).type = 'EEG';
        cnewlocs(2).sph_theta_besa = 90;
        cnewlocs(2).sph_phi_besa = 90;

        cnewlocs(3).labels = 'c';
        cnewlocs(3).theta = 90;
        cnewlocs(3).radius = 0.5 - (acos(sqrt(1/3))*180/pi)/180; % 0.1959
        cnewlocs(3).X = 0;
        cnewlocs(3).Y = -sqrt(1/3); % -0.5774
        cnewlocs(3).Z = sqrt(2/3); % 0.8165
        cnewlocs(3).sph_theta = -90;
        cnewlocs(3).sph_phi = acos(sqrt(1/3))*180/pi; % 54.7356
        cnewlocs(3).sph_radius = 1;
        cnewlocs(3).type = 'EEG';
        cnewlocs(3).sph_theta_besa = acos(sqrt(2/3))*180/pi; % 35.2644
        cnewlocs(3).sph_phi_besa = 0;

        cnewlocs(4).labels = 'd';
        cnewlocs(4).theta = 30;
        cnewlocs(4).radius = 0.5 - (acos(sqrt(2/3))*180/pi)/180; % 0.3041
        cnewlocs(4).X = sqrt(2)/2;
        cnewlocs(4).Y = -sqrt(2/3)/2; % -0.4082
        cnewlocs(4).Z = sqrt(1/3); % 0.5774
        cnewlocs(4).sph_theta = -30;
        cnewlocs(4).sph_phi = acos(sqrt(2/3))*180/pi; % 35.2644
        cnewlocs(4).sph_radius = 1;
        cnewlocs(4).type = 'EEG';
        cnewlocs(4).sph_theta_besa = acos(sqrt(1/3))*180/pi; % 54.7356
        cnewlocs(4).sph_phi_besa = 60;


        loc1 = {1, 'y', 'a'};

        rnewlocs = forcelocs(chanlocs, loc1);

        if ~near(cnewlocs, rnewlocs)
            error('EEGLAB:unittesting', 'Error in forcelocs(): incorrect result.');
        end;
