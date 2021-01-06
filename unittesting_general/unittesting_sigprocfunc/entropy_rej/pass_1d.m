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

function pass_1d()

        data = [ 1 1 2 ];
        threshold = 3;
        entropy = [];
        normalize = 0;
        discret = 1000;

        %         .----
        %          `.
        %           `.
        %  S =  -   ,'   p(i) * ln( p(i) )
        %          ,   
        %         '----
        %           i
        %
        %  p = [ 2/3  2/3  1/3 ]
        %  (shouldn't it be p = [ 2/3  1/3 ] , so that sum(p) == 1??)

        centropy = -sum( [2/3  2/3  1/3] .* log([2/3  2/3  1/3]) );
        crej = 0;

        [rentropy rrej] = entropy_rej( data, threshold, entropy, normalize, discret);

        if ~near(centropy, rentropy) || ~near(crej, rrej)
            error('EEGLAB:unittesting', 'Error in entropy_rej(): incorrect result.');
        end;

