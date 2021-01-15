folder = dir(sprintf('~/nemar/unittestresults/%s/*.txt', datestr(now, 'YY_mm_dd')));

if ~isempty(folder)
	for iFile = 1:length(folder)
        if folder(iFile).bytes > 150
            system([ 'mail -n -s "' folder(iFile).name ' generated errors" arno@ucsd.edu < ' fullfile(folder(iFile).folder, folder(iFile).name) ]);
        end
	end
else
    % system([ 'echo "Do not forget to change revision number in Content.m" | mail -n -s " no errors - ready to compile" arno@ucsd.edu' ]);
end
