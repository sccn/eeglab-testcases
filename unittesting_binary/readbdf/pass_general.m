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

function  pass_general()

    	bdf = openbdf('test.bdf');		% record length here = 256, records number = 17
    	records = [1 2 4];	% 3 sample records

		[dat, sig] = readbdf(bdf,records);
		if ~isfield(dat,'Record') || ~isequal(size(dat.Record), [17 256*3]) ...
				|| ~isfield(dat,'Valid')|| ~isequal(size(dat.Valid), [1 256*3]) ...
				|| ~isfield(dat,'Idx') || ~isequal(dat.Idx, records) ...
				|| ~isequal(size(sig), [256 17])
			error('EEGLLAB:unittesting', 'Error in readbdf(): incorrect result.');
        end
