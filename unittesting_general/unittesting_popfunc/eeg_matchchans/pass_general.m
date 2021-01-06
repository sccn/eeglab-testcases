% % Testcases for EEGLab
% % Copyright (C) 2006 Andreas Romeyke & Ronny Lindner
% % Max-Planck-Institute for Human Cognitive and Brain Sciences Leipzig, Germany
% % romeyke@cbs.mpg.de, art1@it-netservice.de
% %
% % based on EEGLab-toolbox
% % http://www.sccn.ucsd.edu/eeglab/
% % Copyright (C) 1996 Scott Makeig et al, SCCN/INC/UCSD, scott@sccn.ucsd.edu
% %
% % This program is free software; you can redistribute it and/or modify
% % it under the terms of the GNU General Public License as published by
% % the Free Software Foundation; either version 2 of the License, or
% % (at your option) any later version.
% %
% % This program is distributed in the hope that it will be useful,
% % but WITHOUT ANY WARRANTY; without even the implied warranty of
% % MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% % GNU General Public License for more details.
% %
% % You should have received a copy of the GNU General Public License
% % along with this program; if not, write to the Free Software
% % Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
% 
% % Bug 864 --- add another channel
% 
% 
% % flat from above
% % 
% %          +x
% %           |
% %          /|\
% %       ,o  |  o.
% %      /    |    \
% % +y --|----+----|-- -y
% %      \    |    /
% %       `.__|__.'
% %           |
% %          -x
% % 
% % -45     0     45
% %         |
% %         |
% % -90 ----+---- 90
% %         |
% %         |
% % -135  +-180  135
% 
% function passed = pass_general()
% 
%         % first chanlocs
%         chanlocs1(1).labels = '1_1';
%         chanlocs1(1).theta = -90;
%         chanlocs1(1).radius = 0.5;
%         chanlocs1(1).X = 0;
%         chanlocs1(1).Y = 1;
%         chanlocs1(1).Z = 0;
%         chanlocs1(1).sph_theta = 90;
%         chanlocs1(1).sph_phi = 0;
%         chanlocs1(1).sph_radius = 1;
%         chanlocs1(1).type = 'EEG';
%         %chanlocs1(1).urchan = 1;
% 
%         chanlocs1(2).labels = '1_2';
%         chanlocs1(2).theta = 90;
%         chanlocs1(2).radius = 0.5;
%         chanlocs1(2).X = 0;
%         chanlocs1(2).Y = -1;
%         chanlocs1(2).Z = 0;
%         chanlocs1(2).sph_theta = -90;
%         chanlocs1(2).sph_phi = 0;
%         chanlocs1(2).sph_radius = 1;
%         chanlocs1(2).type = 'EEG';
%         %chanlocs1(2).urchan = 1;
% 
% 
%         %%% second chanlocs %%%
%         chanlocs2(1).labels = '2_1';
%         chanlocs2(1).theta = -135;
%         chanlocs2(1).radius = 0.5;
%         chanlocs2(1).X = -sqrt(2)/2;
%         chanlocs2(1).Y = sqrt(2)/2;
%         chanlocs2(1).Z = 0;
%         chanlocs2(1).sph_theta = 135;
%         chanlocs2(1).sph_phi = 0;
%         chanlocs2(1).sph_radius = 1;
%         chanlocs2(1).type = 'EEG';
%         %chanlocs2(1).urchan = 1;
% 
%         chanlocs2(2).labels = '2_2';
%         chanlocs2(2).theta = 0;
%         chanlocs2(2).radius = 0.5;
%         chanlocs2(2).X = 1;
%         chanlocs2(2).Y = 0;
%         chanlocs2(2).Z = 0;
%         chanlocs2(2).sph_theta = 0;
%         chanlocs2(2).sph_phi = 0;
%         chanlocs2(2).sph_radius = 1;
%         chanlocs2(2).type = 'EEG';
%         %chanlocs2(2).urchan = 1;
% 
%         chanlocs2(3).labels = '2_3';
%         chanlocs2(3).theta = 90;
%         chanlocs2(3).radius = 0.5;
%         chanlocs2(3).X = 0;
%         chanlocs2(3).Y = -1;
%         chanlocs2(3).Z = 0;
%         chanlocs2(3).sph_theta = -90;
%         chanlocs2(3).sph_phi = 0;
%         chanlocs2(3).sph_radius = 1;
%         chanlocs2(3).type = 'EEG';
%         %chanlocs2(3).urchan = 1;
% 
% 
% % distance:
% %
% % -90 _____________
% %            ' 45 /
% %  (0,1)      `,./
% %               /
% %              /  (-sqrt(2)/2, sqrt(2)/2)
% %            -135
% %
% % c^2 = a^2 + b^2 - 2*a*b*cos(gamma)
% % c = sqrt( 1^2 + 1^2 - 2*1*1*cos(45�) )
% % c = sqrt( 2 - 2*(sqrt(2)/2) )
% % c = sqrt( 2 - sqrt(2) ) = 0.7654
% %
%         cselchans = [ [1]; [3] ];
%         cdistances = [ [sqrt( 2 - sqrt(2) )]; [0] ];
% 
%         cselocs(1).labels = '2_1';
%         cselocs(1).theta = -135;
%         cselocs(1).radius = 0.5;
%         cselocs(1).X = -sqrt(2)/2;
%         cselocs(1).Y = sqrt(2)/2;
%         cselocs(1).Z = 0;
%         cselocs(1).sph_theta = 135;
%         cselocs(1).sph_phi = 0;
%         cselocs(1).sph_radius = 1;
%         cselocs(1).type = 'EEG';
%         cselocs(1).bigchan = [];
%         cselocs(1).bigdist = sqrt( 2 - sqrt(2) );
% 
%         cselocs(2).labels = '2_3';
%         cselocs(2).theta = 90;
%         cselocs(2).radius = 0.5;
%         cselocs(2).X = 0;
%         cselocs(2).Y = -1;
%         cselocs(2).Z = 0;
%         cselocs(2).sph_theta = -90;
%         cselocs(2).sph_phi = 0;
%         cselocs(2).sph_radius = 1;
%         cselocs(2).type = 'EEG';
%         cselocs(2).bigchan = [3];
%         cselocs(2).bigdist = 0;
% 
%         [rselchans, rdistances, rselocs] = eeg_matchchans(chanlocs2, chanlocs1);
% 
%         if ~near(cdistances, rdistances) ...
%                 || ~near(cselchans, rselchans) ...
%                 || ~near(cselocs, rselocs)
%             
%             error('EEGLAB:unittesting', 'Error in eeg_matchchans(): incorrect output');
%         end;
% 
