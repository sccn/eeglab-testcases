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

function passed = pass_many_args()
    passed = tc_notpassed;
    try
        data = [ [ 21 24 25 28 31 37 ]; ... % <--
                 [ 22 25 26 29 32 38 ]; ... % <-- data
                 [ 23 26 27 30 33 39 ]; ... % <--
                 [ 24 27 28 31 34 40 ] ];   % <--
        sortvar = [];
        times = [];
        title = 'testcase';
        avewidth = 1;
        decimate = 1;

        coutdata = data;
        coutvar = [ 1 2 3 4 5 6 ];
        couttrials = [ 1 2 3 4 5 6 ];
        climits = [ 1 4 36 39.9 NaN NaN NaN NaN NaN NaN ];
        caxhndls = [ 0 0 0 NaN NaN ];
        cerp = [27+2/3 28+2/3 29+2/3 30+2/3];
        camps = [];
        ccohers = [];
        ccohsig = [];
        campsig = [];
        coutamps = [];
        cphsangls = [];
        cphsamp = [];
        csortidx = [ 1 2 3 4 5 6 ];
        cerpsig = [];

        [routdata,routvar,routtrials,rlimits,raxhndls,rerp, ...
          ramps,rcohers,rcohsig,rampsig,routamps,rphsangls,rphsamp,rsortidx,rerpsig] ...
                   = erpimage(data, sortvar, times, title, avewidth, decimate, 'erp', 'cbar', 'noxlabel');

        if near(coutdata, routdata) ...
        && near(coutvar, routvar) ...
        && near(couttrials, routtrials) ...
        && near(climits, rlimits) ...
        && near(caxhndls(4:end), raxhndls(4:end)) ...
        && strcmpi( get(raxhndls(1), 'Type'), 'axes') ...
        && near(cerp, rerp) ...
        && near(camps, ramps) ...
        && near(ccohers, rcohers) ...
        && near(ccohsig, rcohsig) ...
        && near(campsig, rampsig) ...
        && near(coutamps, routamps) ...
        && near(cphsangls, rphsangls) ...
        && near(cphsamp, rphsamp) ...
        && near(csortidx, rsortidx) ...
        && near(cerpsig, rerpsig)
            passed = tc_passed;
        end;
    catch % not passed on error
    end;
end
