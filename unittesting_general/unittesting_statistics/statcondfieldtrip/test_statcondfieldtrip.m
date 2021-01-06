% compares statcond and statcondfieldtrip
%
% This function test 2 things. 
%
% * First, it checks that for vector inputs the EEGLAB functions return 
%   the same output as other reference functions from the Matlab statistical 
%   toolbox or from other packages tested against the SPSS software for 
%   repeated measure ANOVA (rm_anova2 function).
%
% * Second, it checks that array inputs with different number of dimensions
%   (from 1 to 3) the EEGLAB function return the same output.

function test_statcondfieldtrip;

if ~license('checkout', 'statistics_toolbox') || ~exist('kmean')
	return;
end;

method = 'analytic';

% testing paired t-test
% ---------------------
a = { rand(1,10) rand(1,10)+0.5 };
[t1 df1 pvals1] = statcond(a, 'mode', 'param', 'verbose', 'off', 'paired', 'on');
[t2 df2 pvals2] = statcondfieldtrip(a, 'mode', 'param', 'verbose', 'off', 'paired', 'on', 'method', method);
assertsame([t1 t2], [df1 df2], [pvals1 pvals2]); 
disp('--------------------');

% testing unpaired t-test
% -----------------------
[t1 df1 pvals1] = statcond(a, 'mode', 'param', 'verbose', 'off', 'paired', 'off', 'variance', 'homogenous');
[t2 df2 pvals2] = statcondfieldtrip(a, 'mode', 'param', 'verbose', 'off', 'paired', 'off', 'variance', 'homogenous', 'method', method);
assertsame([t1 t2], [df1 df2], [pvals1 pvals2]);
disp('--------------------');

% testing 1-way unpaired ANOVA
% ----------------------------
a = { rand(1,10) rand(1,10) rand(1,10)+0.2; rand(1,10) rand(1,10)+0.2 rand(1,10) };
[F1 df1 pvals1] = statcond(a(1,:), 'mode', 'param', 'verbose', 'off', 'paired', 'off');
[F2 df2 pvals2] = statcondfieldtrip(a(1,:), 'mode', 'param', 'verbose', 'off', 'paired', 'off', 'method', method);
fprintf('Statistics 1-way unpaired statcond        F-value %2.2f df1=%d df2=%d p=%0.4f\n', F1, df1(1), df1(2), pvals1); 
fprintf('Statistics 1-way unpaired rm_avova2 func. F-value %2.2f df1=%d df2=%d p=%0.4f\n', F2, df2(1), df2(2), pvals2); 
assertsame([F1 F2], [df1(1) df2(1)], [df1(2) df2(2)], [pvals1 pvals2]); 
disp('--------------------');

if 0 % not implemented in Fieldtrip
    % testing paired 1-way ANOVA
    % --------------------------
    [F1 df1 pvals1] = statcond(a(1,:), 'mode', 'param', 'verbose', 'off', 'paired', 'on');
    [F2 df2 pvals2] = statcondfieldtrip(a(1,:), 'mode', 'param', 'verbose', 'off', 'paired', 'on', 'method', method);
    fprintf('Statistics 1-way paired statcond        F-value %2.2f df1=%d df2=%d p=%0.4f\n', F1, df1(1), df1(2), pvals1);
    fprintf('Statistics 1-way paired rm_avova2 func. F-value %2.2f df1=%d df2=%d p=%0.4f\n', F2, df2(1), df2(2), pvals2);
    assertsame([F1 F2], [df1(1) df2(1)], [df1(2) df2(2)], [pvals1 pvals2]);
    disp('--------------------');

    % testing 2-way unpaired ANOVA
    % ----------------------------
    [F1 df1 pvals1] = statcond(a,          'mode', 'param', 'verbose', 'off', 'paired', 'off');
    [F2 df2 pvals2] = statcondfieldtrip(a, 'mode', 'param', 'verbose', 'off', 'paired', 'off', 'method', method);
    fprintf('Statistics 2-way unpaired statcond        F-value %2.2f df1=%d df2=%d p=%0.4f\n', F1{3}, df1{3}(1), df1{3}(2), pvals1{3});
    fprintf('Statistics 2-way unpaired rm_avova2 func. F-value %2.2f df1=%d df2=%d p=%0.4f\n', F2{3}, df2{3}(1), df2{3}(2), pvals2{3});
    assertsame([F{3} stats{4,5}], [df{3}(1) stats{4,3}], [df{3}(2) stats{5,3}], [pvals{3} stats{4,6}]);
    disp('--------------------');
    
    % testing paired 2-way ANOVA
    % --------------------------
    [F df pvals surog] = statcond(a, 'mode', 'param', 'verbose', 'off', 'paired', 'on');
    z = zeros(10,1); o = ones(10,1); t = ones(10,1)*2;
    stats = rm_anova2(  [ a{1,1}';a{1,2}';a{1,3}';a{2,1}';a{2,2}';a{2,3}' ], ...
        repmat([1:10]', [6 1]), [o;o;o;z;z;z], [z;o;t;z;o;t], {'a','b'});
    fprintf('Statistics 2-way paired statcond        F-value %2.2f df1=%d df2=%d p=%0.4f\n', F{3}, df{3}(1), df{3}(2), pvals{3});
    fprintf('Statistics 2-way paired rm_avova2 func. F-value %2.2f df1=%d df2=%d p=%0.4f\n', stats{4,5}, stats{4,3}, stats{7,3}, stats{4,6});
    assertsame([F{3} stats{4,5}], [df{3}(1) stats{4,3}], [df{3}(2) stats{7,3}], [pvals{3} stats{4,6}]);
    disp('--------------------');
end;

% testing different dimensions in statcond
% ----------------------------------------
a = { rand(1,10)      rand(1,10)+0.5      rand(1,10)};
b = { rand(10,10)     rand(10,10)+0.5     rand(10,10)};     b{1}(4,:)     = a{1}; b{2}(4,:)     = a{2}; b{3}(4,:)     = a{3};
c = { rand(5,10,10)   rand(5,10,10)+0.5   rand(5,10,10)};   c{1}(2,4,:)   = a{1}; c{2}(2,4,:)   = a{2}; c{3}(2,4,:)   = a{3};
d = { rand(2,5,10,10) rand(2,5,10,10)+0.5 rand(2,5,10,10)}; d{1}(1,2,4,:) = a{1}; d{2}(1,2,4,:) = a{2}; d{3}(1,2,4,:) = a{3};
[t1 df1 pvals1] = statcond(a(1:2), 'mode', 'param', 'verbose', 'off', 'paired', 'on');
[t2 df2 pvals2] = statcond(b(1:2), 'mode', 'param', 'verbose', 'off', 'paired', 'on');
[t3 df3 pvals3] = statcond(c(1:2), 'mode', 'param', 'verbose', 'off', 'paired', 'on');
[t4 df4 pvals4] = statcond(d(1:2), 'mode', 'param', 'verbose', 'off', 'paired', 'on');
[y1 dy1 pvaly1] = statcondfieldtrip(a(1:2), 'mode', 'param', 'verbose', 'off', 'paired', 'on', 'method', method);
[y2 dy2 pvaly2] = statcondfieldtrip(b(1:2), 'mode', 'param', 'verbose', 'off', 'paired', 'on', 'method', method);
[y3 dy3 pvaly3] = statcondfieldtrip(c(1:2), 'mode', 'param', 'verbose', 'off', 'paired', 'on', 'method', method);
%[y4 dy4 pvaly4] = statcondfieldtrip(d(1:2), 'mode', 'param', 'verbose', 'off', 'paired', 'on', 'method', method);
fprintf('Statistics paired statcond t-test dim1 t-value %2.2f df=%d p=%0.4f\n', t1, df1, pvals1);
fprintf('Statistics paired statcond t-test dim2 t-value %2.2f df=%d p=%0.4f\n', t2(4), df2, pvals2(4));
fprintf('Statistics paired statcond t-test dim3 t-value %2.2f df=%d p=%0.4f\n', t3(2,4), df3, pvals3(2,4));
assertsame([t1 t2(4) t3(2,4) y1 y2(4) y3(2,4)], [df1 df2 df3 dy1 dy2 dy3], [pvals1 pvals2(4) pvals3(2,4) pvaly1 pvaly2(4) pvaly3(2,4)]); 
disp('--------------------');
a = { rand(1,10)      rand(1,10)+0.5      rand(1,10)};
b = { rand(10,10)     rand(10,10)+0.5     rand(10,10)};     b{1}(4,:)     = a{1}; b{2}(4,:)     = a{2}; b{3}(4,:)     = a{3};
c = { rand(5,10,10)   rand(5,10,10)+0.5   rand(5,10,10)};   c{1}(2,4,:)   = a{1}; c{2}(2,4,:)   = a{2}; c{3}(2,4,:)   = a{3};
d = { rand(2,5,10,10) rand(2,5,10,10)+0.5 rand(2,5,10,10)}; d{1}(1,2,4,:) = a{1}; d{2}(1,2,4,:) = a{2}; d{3}(1,2,4,:) = a{3};
[t1 df1 pvals1] = statcond(a(1:2), 'mode', 'param', 'verbose', 'off', 'paired', 'off', 'variance', 'homogenous');
[t2 df2 pvals2] = statcond(b(1:2), 'mode', 'param', 'verbose', 'off', 'paired', 'off', 'variance', 'homogenous');
[t3 df3 pvals3] = statcond(c(1:2), 'mode', 'param', 'verbose', 'off', 'paired', 'off', 'variance', 'homogenous');
[t4 df4 pvals4] = statcond(d(1:2), 'mode', 'param', 'verbose', 'off', 'paired', 'off', 'variance', 'homogenous');
[y1 dy1 pvaly1] = statcondfieldtrip(a(1:2), 'mode', 'param', 'verbose', 'off', 'paired', 'off', 'method', method);
[y2 dy2 pvaly2] = statcondfieldtrip(b(1:2), 'mode', 'param', 'verbose', 'off', 'paired', 'off', 'method', method);
[y3 dy3 pvaly3] = statcondfieldtrip(c(1:2), 'mode', 'param', 'verbose', 'off', 'paired', 'off', 'method', method);
%[y4 dy4 pvaly4] = statcondfieldtrip(d(1:2), 'mode', 'param', 'verbose', 'off', 'paired', 'off', 'method', method);
fprintf('Statistics paired statcond t-test dim1 t-value %2.2f df=%d p=%0.4f\n', t1, df1, pvals1);
fprintf('Statistics paired statcond t-test dim2 t-value %2.2f df=%d p=%0.4f\n', t2(4), df2, pvals2(4));
fprintf('Statistics paired statcond t-test dim3 t-value %2.2f df=%d p=%0.4f\n', t3(2,4), df3, pvals3(2,4));
assertsame([t1 t2(4) t3(2,4) y1 y2(4) y3(2,4)], [df1 df2 df3 dy1 dy2 dy3], [pvals1 pvals2(4) pvals3(2,4) pvaly1 pvaly2(4) pvaly3(2,4)]); 
disp('--------------------');
if 0
    [t1 df1 pvals1] = statcond(a, 'mode', 'param', 'verbose', 'off', 'paired', 'on');
    [t2 df2 pvals2] = statcond(b, 'mode', 'param', 'verbose', 'off', 'paired', 'on');
    [t3 df3 pvals3] = statcond(c, 'mode', 'param', 'verbose', 'off', 'paired', 'on');
    [t4 df4 pvals4] = statcond(d, 'mode', 'param', 'verbose', 'off', 'paired', 'on');
    [y1 dy1 pvaly1] = statcondfieldtrip(a, 'mode', 'param', 'verbose', 'off', 'paired', 'on', 'method', method);
    [y2 dy2 pvaly2] = statcondfieldtrip(b, 'mode', 'param', 'verbose', 'off', 'paired', 'on', 'method', method);
    [y3 dy3 pvaly3] = statcondfieldtrip(c, 'mode', 'param', 'verbose', 'off', 'paired', 'on', 'method', method);
    [y4 dy4 pvaly4] = statcondfieldtrip(d, 'mode', 'param', 'verbose', 'off', 'paired', 'on', 'method', method);
    fprintf('Statistics paired statcond anova 1-way dim1 t-value %2.2f df1=%d df2=%d p=%0.4f\n', t1, df1(1), df1(2), pvals1);
    fprintf('Statistics paired statcond anova 1-way dim2 t-value %2.2f df1=%d df2=%d p=%0.4f\n', t2(4), df2(1), df2(2), pvals2(4));
    fprintf('Statistics paired statcond anova 1-way dim3 t-value %2.2f df1=%d df2=%d p=%0.4f\n', t3(2,4), df3(1), df3(2), pvals3(2,4));
    assertsame([t1 t2(4) t3(2,4) y1 y2(4) y3(2,4)], [df1 df2 df3 dy1 dy2 dy3], [pvals1 pvals2(4) pvals3(2,4) pvaly1 pvaly2(4) pvaly3(2,4)]); 
end;
disp('--------------------');
[t1 df1 pvals1] = statcond(a, 'mode', 'param', 'verbose', 'off', 'paired', 'off');
[t2 df2 pvals2] = statcond(b, 'mode', 'param', 'verbose', 'off', 'paired', 'off');
[t3 df3 pvals3] = statcond(c, 'mode', 'param', 'verbose', 'off', 'paired', 'off');
[t4 df4 pvals4] = statcond(d, 'mode', 'param', 'verbose', 'off', 'paired', 'off');
[y1 dy1 pvaly1] = statcondfieldtrip(a, 'mode', 'param', 'verbose', 'off', 'paired', 'off', 'method', method);
[y2 dy2 pvaly2] = statcondfieldtrip(b, 'mode', 'param', 'verbose', 'off', 'paired', 'off', 'method', method);
[y3 dy3 pvaly3] = statcondfieldtrip(c, 'mode', 'param', 'verbose', 'off', 'paired', 'off', 'method', method);
%[y4 dy4 pvaly4] = statcondfieldtrip(d, 'mode', 'param', 'verbose', 'off', 'paired', 'off', 'method', method);
fprintf('Statistics unpaired statcond anova 1-way dim1 t-value %2.2f df1=%d df2=%d p=%0.4f\n', t1, df1(1), df1(2), pvals1);
fprintf('Statistics unpaired statcond anova 1-way dim2 t-value %2.2f df1=%d df2=%d p=%0.4f\n', t2(4), df2(1), df2(2), pvals2(4));
fprintf('Statistics unpaired statcond anova 1-way dim3 t-value %2.2f df1=%d df2=%d p=%0.4f\n', t3(2,4), df3(1), df3(2), pvals3(2,4));
assertsame([t1 t2(4) t3(2,4) y1 y2(4) y3(2,4)], [df1 df2 df3 dy1 dy2 dy3], [pvals1 pvals2(4) pvals3(2,4) pvaly1 pvaly2(4) pvaly3(2,4)]); 
disp('--------------------');

% function to check 
function assertsame(varargin)

for ind = 1:length(varargin)
    if length(varargin{1}) > 2
        for tmpi = 1:length(varargin{1})-1
            assertsame(varargin{1}(tmpi:tmpi+1));
        end;
        return;
    else
        if abs(varargin{ind}(1)-varargin{ind}(2)) > abs(mean(varargin{ind}))*0.01
            error('Test failed');
        end;
    end;
end;
disp('Test pass');

function [meanmat] = meansa(mat)

meanmat = zeros(size(mat{1}));
for index = 1:length(mat)
    meanmat = meanmat+mat{index}/length(mat);
end;

