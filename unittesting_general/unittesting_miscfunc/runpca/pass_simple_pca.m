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

function pass_simple_pca()

        % TODO: check expected results with MATLAB's princomp() or
        % pcacov(), but seems to be right
        data=[0 1 2 3 4 5 6 7; 0 1 2 3 4 5 6 7]; % f(x)=x, the PCA should derotate this into x-dimension
        ex_data=[0 -1.4142 -2.8284 -4.2426 -5.6569 -7.0711 -8.4853 -9.8995; 0 0 0 0 0 0 0 0]; % expected eigen vectors
        ex_pc = [-0.7071 -0.7071; -0.7071 0.7071]; % expected principal components
        ex_s = [16.7332 0; 0 0]; % expected eigen values
		correct=[ex_data'; ex_pc; ex_s']';
		[pc, eigvec, s]=runpca(data');
        result =[eigvec', pc , s];


