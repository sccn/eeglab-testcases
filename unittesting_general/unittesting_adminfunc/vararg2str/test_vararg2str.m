% test_vararg2str
% 05/17/2010 roy
% pass
% ? add result comparision

function test_vararg2str
arg3.a = 'a';
arg3.b = 3;
allargs  = {'arg1', 2, arg3};
str = vararg2str( allargs);

allargs = {'arg1', 2, arg3};
inputnames = {'key1', 'key2', 'key3'};
str = vararg2str(allargs, inputnames);

allargs = {'arg1', 2, arg3};
inputnames = {'key1', '', 'key2'};
str = vararg2str(allargs, inputnames);

allargs = {'arg1', 2, arg3};
inputnames = {'', 'key2', ''};
inputnum = [1 3];
str = vararg2str(allargs, inputnames, inputnum);

allargs = {'arg1', 2, arg3};
inputnames = {'', '', ''};
inputnum = [];
nostrconv = [0,0,0];
str = vararg2str(allargs, inputnames, inputnum, nostrconv);

allargs = {'arg1', 2, arg3};
inputnames = {'', '', ''};
inputnum = [];
nostrconv = [1,1,1];
str = vararg2str(allargs, inputnames, inputnum, nostrconv);

allargs = {'arg1', 2, arg3};
inputnames = {'key1', '', ''};
inputnum = [];
nostrconv = [1,1,1];
str = vararg2str(allargs, inputnames, inputnum, nostrconv);

allargs = {'arg1', 2, arg3};
inputnames = {'key1', '', ''};
inputnum = [];
nostrconv = [0,0,0];
str = vararg2str(allargs, inputnames, inputnum, nostrconv);