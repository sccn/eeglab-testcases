function checkouteeglab(vers);
%system('\rm -r -f ../eeglabtmp/*');
%system('\rm -f /home/ramon/eeg_options.m'); %system('\rm -f /home/arno/eeg_options.m');

% system('checkoutbash');
if 0 % the following code fails on Matlab 2017 and crontab
	if exist('../eeglabtmp')
		rmdir('../eeglabtmp', 's');
	end
	if exist('/home/arno/eeg_options.m')
   	 	delete('/home/arno/eeg_options.m');
	end
	currentdir = pwd;

	if ~exist('../eeglabtmp')
    		mkdir('../eeglabtmp');
	end;

	if nargin < 1
    		cd /data/common/matlab/eeglab;
    		system('git archive develop | tar -x -C /data/common/matlab/eeglab-testcases/eeglabtmp');
    		cd(currentdir);
	% 	system('svn export https://sccn.ucsd.edu/svn/software/eeglab ../eeglabtmp');
	elseif vers == 13
    		cd /data/common/matlab/eeglab;
    		system('git archive eeglab13 | tar -x -C /data/common/matlab/eeglab-testcases/eeglabtmp');
    		cd(currentdir);
	elseif vers == 12
        	system('svn export --force https://sccn.ucsd.edu/svn/software/branches/eeglab12 ../eeglabtmp');
	elseif vers == 11
        	system('svn export --force https://sccn.ucsd.edu/svn/software/branches/eeglab11 ../eeglabtmp');
	elseif vers == 10
        	system('svn export --force https://sccn.ucsd.edu/svn/software/branches/eeglab10 ../eeglabtmp');
	elseif vers == 9
        	system('svn export --force https://sccn.ucsd.edu/svn/software/branches/eeglab9 ../eeglabtmp');
	end;
end

tmpp = path;
indcolom = [0 find(tmpp == ':') length(tmpp)+1];
for ind = 1:length(indcolom)-1
    currentpath = tmpp(indcolom(ind)+1:indcolom(ind+1)-1);
    if ~isempty(findstr('eeglab', currentpath))
        disp([ 'Removing path ' currentpath ]);
        rmpath(currentpath);
    end;
end;
try, delete('~/eeg_options.m'); catch, end
try, delete('/data/common/matlab/eeglab-testcases/trunk/unittesting_studyfunc/teststudy/eeg_options.m'); catch, end;
try, delete('/data/common/matlab/eeglab-testcases/trunk/unittesting_studyfunc/eeg_options.m'); catch, end;

addpath(fullfile(pwd, 'unittesting_common'));
tmp = pwd;
cd(fullfile('..', 'eeglabtmp'));
eeglab;
cd(tmp);

try plugin_askinstall('neuroscanio', [], true); catch, disp(lasterror); end;
try plugin_askinstall('bva-io', [], true); catch, disp(lasterror); end;
try plugin_askinstall('Biosig', [], true); catch, disp(lasterror); end;
try plugin_askinstall('Fileio', [], true); catch, disp(lasterror); end;
try plugin_askinstall('erpssimport', [], true); catch, disp(lasterror); end;
try plugin_askinstall('Fieldtrip-lite', [], true); catch, disp(lasterror); end;
try plugin_askinstall('corrmap', [], true); catch, disp(lasterror); end;
try plugin_askinstall('bdfimport', [], true); catch, disp(lasterror); end;
try plugin_askinstall('erpssimport', [], true); catch, disp(lasterror); end;
