% check making copies
% -------------------
%clear global; clear; clear classes;
floatwrite([1:10], 'testfile.fdt'); 
test = mmo('testfile.fdt' , [1 10], true, false, true);
testcheck = mmo('testfile2.fdt', [1 10], true, false, true);
a.test3 = test;

% ---------------------
%tmp = evalc('a.test3(5) = 5;');
tmp = evalc('a.test3(5) = 5;');
if tmp(1) == 'u'
    error('test 1, should be a copy');
end;
disp('Pass 1');

% ---------------------
clear test;
tmp = evalc('a.test3(6) = 5;');
if tmp(1) ~= 'u'
    error('test 1, should not be a copy');
end;
disp('Pass 2');

% ---------------------
clear test;
test2 = a.test3;
tmp = evalc('a.test3(7) = 5;');
if tmp(1) == 'u'
    error('test 1, should be a copy');
end;
disp('Pass 3');

% ---------------------
clear test a test2;
test = mmo('testfile.fdt' , [1 10], true, false, true);
tmp = evalc('a =checkmmo_sub1(test);');
if tmp(1) == 'u'
    error('test 1, should be a copy');
end;
disp('Pass 4');

% ---------------------
tmp = evalc('a =checkmmo_sub2(test);');
if tmp(1) == 'u'
    error('test 1, should be a copy');
end;
disp('Pass 5');

% ---------------------
tmp = evalc('test(2) = 3.2;');
if tmp(1) ~= 'u'
    error('test 1, should not be a copy');
end;
disp('Pass 6');

%% ---------------------
tmp = evalc('a = checkmmo_sub5;');
if tmp(1) ~= 'u'
    error('test 1, should not be a copy');
end;
disp('Pass 7');
clear test testcheck test2 a tmp;
