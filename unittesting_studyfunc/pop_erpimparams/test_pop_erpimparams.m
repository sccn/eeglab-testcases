function test_pop_erpimparams
% Author: Ramon Martinez-Cancino UCSD/ SCCN,2018
%         Arnaud Delorme         UCSD/ SCCN,2018

% Read the sample study
readsamplestudy;

paramList = {'topotime',    100;...
             'topotime',    [50 100];...
             'timerange',   [0 200];...
             'timerange',   [-100 200];...
             'colorlimits', [0 200]}; % if new parameter/test-case, add here.
          
errorflag = zeros(1,size(paramList,1));

for iParam =1:size(paramList,1)
    STUDY = pop_erpimparams(STUDY,paramList{iParam,:});
    
    if ~isequal(STUDY.etc.erpimparams.(paramList{iParam,1}),paramList{iParam,2})
        errorflag(iParam) = 1;
        display(['test_pop_erpimparams: Testing parameter ''' paramList{iParam,1} ''' ... failed']);    
    else
        display(['test_pop_erpimparams: Testing parameter ''' paramList{iParam,1} ''' ... passed']);
    end
end

% Creating error message
if any(errorflag)
    errtext = [];
    uniquefails = unique(paramList(find(errorflag)));
    for ierr = 1:length(uniquefails)
        errtext = [errtext uniquefails{ierr}];
         if ierr ~= length(uniquefails)
             errtext = [errtext ', '];
         end      
    end
error(['pop_erpimparams issue wile setting parameter(s) '''  errtext ''' ']); 
end
end


