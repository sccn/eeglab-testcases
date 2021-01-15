% check the local copies
% ----------------------

%clear global; clear; clear classes;
tmp = [1:10]'; 
floatwrite(tmp, 'testfile.fdt');
floatwrite(tmp, 'testfile2.fdt');
test = mmo('testfile.fdt' , [1 10], true, false, true);
testcheck = mmo('testfile2.fdt', [1 10]);

%% ---------------------
le = checkcopies(test);
if le~=1
    error('copies should be 1');
else
    disp('Pass 1');
end;

%% ---------------------
test2 = test;
le = checkcopies(test);
if le~=2
    error('copies should be 2');
else
    disp('Pass 2');
end;

%% ---------------------
clear test2;
test3 = test;
le = checkcopies(test);
if le~=2
    error('copies should be 2');
else
    disp('Pass 3');
end;

%% ---------------------
clear test3;
a.mmo = test;
le = checkcopies(test);
if le~=2
    error('copies should be 2');
else
    disp('Pass 4');
end;

%% ---------------------
clear a;
test2 = test;
a.mmo2 = { test test2 };
le = checkcopies(test);
if le == 1
    error('copies should be 2');
else
    disp('Pass 5');
end;

%% ---------------------
clear a test2;
le = checkcopies(test);
if le~=1
    error('copies should be 1');
else
    disp('Pass 6');
end;

%% ---------------------
clear test2 a;
le = checkmmo_sub1(test);
if le~=2
    error('copies should be 2');
else
    disp('Pass 7');
end;

%% ---------------------
le = checkmmo_sub2(test);
if le~=2
    error('copies should be 2');
else
    disp('Pass 8');
end;

%% ---------------------
checkmmo_sub3
if le~=2
    error('copies should be 2');
else
    disp('Pass 9');
end;

%% ---------------------
checkmmo_sub4
if le~=2
    error('copies should be 2');
else
    disp('Pass 10');
end;

%% ---------------------
test2 = test;
checkmmo_sub3
if le~=2
    error('copies should be 2');
else
    disp('Pass 11');
end;

%% ---------------------
checkmmo_sub4
if le~=2
    error('copies should be 2');
else
    disp('Pass 12');
end;
clear test test2 testcheck;
