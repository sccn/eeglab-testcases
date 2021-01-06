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

function pass_all()

        EEG = eeg_emptyset;
        EEG.nbchan = 2; % channels
        EEG.trials = 6; % epochs

        EEG.reject.rejmanual = [1 0 0 0 0 0];
        EEG.reject.rejthresh = [0 1 0 0 0 0];
        EEG.reject.rejconst  = [0 0 1 0 0 0];
        EEG.reject.rejjp     = [0 0 0 1 0 0];
        EEG.reject.rejkurt   = [0 0 0 0 1 0];
        EEG.reject.rejfreq   = [0 0 0 0 0 1];

        EEG.reject.rejmanualE = [ [1 0 0 0 0 0]; ...
                                  [0 0 0 0 0 1] ];
        EEG.reject.rejthreshE = [ [0 1 0 0 0 0]; ...
                                  [0 0 0 0 1 0] ];
        EEG.reject.rejconstE  = [ [0 0 1 0 0 0]; ...
                                  [0 0 0 1 0 0] ];
        EEG.reject.rejjpE     = [ [0 0 0 1 0 0]; ...
                                  [0 0 1 0 0 0] ];
        EEG.reject.rejkurtE   = [ [0 0 0 0 1 0]; ...
                                  [0 1 0 0 0 0] ];
        EEG.reject.rejfreqE   = [ [0 0 0 0 0 1]; ...
                                  [1 0 0 0 0 0] ];
        %%%%%%%%%
        cEEG = eeg_emptyset;
        cEEG.reject.rejglobal = [1 1 1 1 1 1];
        cEEG.reject.rejglobalE = [ [1 1 1 1 1 1]; ...
                                   [1 1 1 1 1 1] ];
        %%%%%%%%%
        rEEG= eeg_rejsuperpose(EEG, 1, 1, 1, 1, 1, 1, 1, 0);

        if ~near(cEEG.reject.rejglobal,  rEEG.reject.rejglobal) ...
        || ~near(cEEG.reject.rejglobalE, rEEG.reject.rejglobalE)
            error('EEGLAB:unittesting', 'Error in eeg_rejsuperpose(): incorrect output.');
        end;

