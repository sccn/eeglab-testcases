% used in interactive testcases for plotXXX functions which return nothing,
% gives possibility to look at/interact with a figure before it's closed
function tc_confirm(text)
	if nargin<1
        text = '';
    else
        text = strvcat(text,' ');
    end;
	questdlg(strvcat(text,'Test passed.','Press OK to continue'),'','OK','OK');
	close;