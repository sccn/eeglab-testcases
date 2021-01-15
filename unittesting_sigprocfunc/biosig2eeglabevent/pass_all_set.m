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

function passed = pass_all_set()

        %data.Teeg = 'test1';
        data.TYP = ['a', 'b', 'a', 'a', 'b'];
        data.POS = [1.0, 2.1, 6.294, 10.2, 42.943];
        data.DUR = [0.03, 1.02, 3, 0.45, 1.9];
        data.CHN = ['5', '2', '9', '5', '1'];

        correct = [];
%        correct = 'test1';
        correct(1).type = 'a';
        correct(2).type = 'b';
        correct(3).type = 'a';
        correct(4).type = 'a';
        correct(5).type = 'b';
        correct(1).latency = 1.0;
        correct(2).latency = 2.1;
        correct(3).latency = 6.294;
        correct(4).latency = 10.2;
        correct(5).latency = 42.943;
        correct(1).duration = 0.03;
        correct(2).duration = 1.02;
        correct(3).duration = 3;
        correct(4).duration = 0.45;
        correct(5).duration = 1.9;
        correct(1).chanindex = '5';
        correct(2).chanindex = '2';
        correct(3).chanindex = '9';
        correct(4).chanindex = '5';
        correct(5).chanindex = '1';

        result = biosig2eeglabevent(data);

        if ~isequal(result, correct)
            error('EEGLAB:unittesting','Error in biosig2eeg(): incorrect result.');
        end;
