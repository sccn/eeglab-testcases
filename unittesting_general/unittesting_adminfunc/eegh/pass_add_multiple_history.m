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

function pass_add_multiple_history()

clear global ALLCOM;
clear global LASTCOM;
global ALLCOM;
global LASTCOM;

EEG(1) = eeg_emptyset;
EEG(1).data = [1];
EEG(2) = eeg_emptyset;
EEG(2).data = [2];
% if EEG.history is unset, test failed -> extra testcase!
EEG(1).history = [];
EEG(2).history = [];

ALLCOM = {'command2' 'command1'};
rEEG = eegh('command3', EEG);

if ~near(ALLCOM, {'command3' 'command2' 'command1'}) ...
        || ~near(rEEG(1).history, [ 10 '% multiple datasets command: command3']) ... % 10 == [RETURN]
        || ~near(rEEG(2).history, [ 10 '% multiple datasets command: command3']) ... % 10 == [RETURN]
        || ~near(rEEG(1).data, [1]) ...
        || ~near(rEEG(2).data, [2])
    error('EEGLAB:unittesting', 'Error in eegh() --- History is not correctly added');
end;

