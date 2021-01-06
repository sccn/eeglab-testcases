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

function pass_newcomments()

    	line1 = 'Line nr. 1';
    	line2 = 'This is line nr.2';
    	line3 = ' ';
    	line4 = 'And this is the final line';
		comments = {line1 line2 line3 line4};

		l1 = 'New line 1';
		l2 = 'And this one is also new                             ';	% returned string will be 53 chars wide
		newcomments = {l1 l2};
		
		title = '';
		cnew = strvcat(l1,l2);
		
		[rnew com] = pop_comments(comments,title,newcomments);
		if ~near(rnew,cnew)
			error('EEGLAB:unittesting', 'Error in pop_comments: incorrect output.');
		end;
