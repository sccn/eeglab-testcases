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

% when extracting long epochs from this dataset the usual 0 becomes
% -1.0000e-09 at some point.
% In the bug report the time range is [-1 8] and the epoch 385, but I speeded
% it up a bit to keep the dataset small

% bug 455

function pass_bugzilla_455()

        EEG = pop_loadset('filename', 'bugzilla_455.set');
        OUTEEG = pop_epoch(EEG, [], [-1 32]);

        if OUTEEG.epoch(97).eventlatency{1} ~= 0
            error('EEGLAB:unittesting', 'Error in pop_epoch(): incorrect ouput.');
        end;
