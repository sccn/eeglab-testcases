function a = checkmmo_sub8(b);
    if nargin < 1, return; end;
    a = checkmmo_sub7(b);
    tmp = evalc('a(6) = 5;');
    if tmp(1) ~= 'u'
        error('test 1, should not be a copy');
    end;
    disp('Pass 2');