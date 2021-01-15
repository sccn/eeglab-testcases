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

function pass_general()

		file = 'test.bdf';
		cheader = [255 sprintf('BIOSEMILocal subject identification                                                    Local recording identification                                                 \n%s',...
				  '12.03.0715.35.274608    24BIT                                       30      2       17  ')];
		cdata.MX.ReRef = 1;
		
		cdata.Head.FILE.OPEN = 1;
		cdata.Head.FILE.Ext = 'bdf';
		cdata.Head.FILE.Name = 'test';
		cdata.Head.FILE.Path = pwd;
		cdata.Head.FILE.POS = 4608;

		cdata.Head.FileName = pwd;
		cdata.Head.VERSION = [255 'BIOSEMI'];
		cdata.Head.PID = 'Local subject identification';
		cdata.Head.RID = 'Local recording identification';
		cdata.Head.T0 = [7 3 12 15 35 27];
		cdata.Head.HeadLen = 4608;
		cdata.Head.NRec = 30;
		cdata.Head.Dur = 2;
		cdata.Head.NS = 17;
		
		cdata.Head.Label = ['A1              '];
		for i = 2:16, cdata.Head.Label = char(cdata.Head.Label, ['A' num2str(i) '             ']); end;
		cdata.Head.Label = char(cdata.Head.Label, 'Status          ');

		cdata.Head.Transducer = ['Active Electrode, pin type                                                      '];
		for i = 2:16,
			cdata.Head.Transducer = char(cdata.Head.Transducer, 'Active Electrode, pin type                                                      ');
		end;
		cdata.Head.Transducer = char(cdata.Head.Transducer, 'Triggers and Status                                                             ');

		cdata.Head.PhysDim = ['uV      '];
		for i = 2:16, cdata.Head.PhysDim = char(cdata.Head.PhysDim, 'uV      '); end; cdata.Head.PhysDim = char(cdata.Head.PhysDim, 'Boolean ');

		cdata.Head.PhysMin = [];
		for i = 1:16, cdata.Head.PhysMin = [cdata.Head.PhysMin; -262144]; end; cdata.Head.PhysMin = [cdata.Head.PhysMin; -8388608];

		cdata.Head.PhysMax = [];
		for i = 1:16, cdata.Head.PhysMax = [cdata.Head.PhysMax; 262144]; end; cdata.Head.PhysMax = [cdata.Head.PhysMax; 8388607];

		cdata.Head.DigMin = [];
		for i = 1:17, cdata.Head.DigMin = [cdata.Head.DigMin; -8388608]; end;

		cdata.Head.DigMax = [];
		for i = 1:17, cdata.Head.DigMax = [cdata.Head.DigMax; 8388607]; end;

		cdata.Head.PreFilt = ['HP: DC; LP: 113 Hz                                                              '];
		for i = 2:16,
			cdata.Head.PreFilt = char(cdata.Head.PreFilt, 'HP: DC; LP: 113 Hz                                                              ');
		end;
		cdata.Head.PreFilt = char(cdata.Head.PreFilt, 'No filtering                                                                    ');
		
		cdata.Head.SPR = [];
		for i = 1:17, cdata.Head.SPR = [cdata.Head.SPR; 256]; end;

		cdata.Head.Cal = [];
		for i = 1:16, cdata.Head.Cal = [cdata.Head.Cal; (262144+262144)/(8388607+8388608)]; end; cdata.Head.Cal = [cdata.Head.Cal; 1];

		cdata.Head.Off = [];
		for i = 1:16, cdata.Head.Off = [cdata.Head.Off; -262144 + cdata.Head.Cal(i)*8388608]; end;
		cdata.Head.Off = [cdata.Head.Off; 0];

		cdata.Head.Calib = [cdata.Head.Off';diag(cdata.Head.Cal)];

		cdata.Head.SampleRate = [];
		for i = 1:17, cdata.Head.SampleRate = [cdata.Head.SampleRate; 128]; end;

		cdata.Head.Chan_Select = [];
		for i = 1:17, cdata.Head.Chan_Select = [cdata.Head.Chan_Select; 1]; end;

		cdata.Head.ChanTyp = ['N'];
		for i = 2:17, cdata.Head.ChanTyp = [cdata.Head.ChanTyp, 'N']; end;
		
		cdata.Head.AS.spb = 256*17;
		cdata.Head.AS.IDX2 = 1:(256*17);

		[rdata rheader] = openbdf(file);
		cdata.Head.FILE.FID = rdata.Head.FILE.FID;

