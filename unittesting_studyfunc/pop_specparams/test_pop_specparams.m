function test_pop_specparams
% Author: Ramon Martinez-Cancino UCSD/ SCCN,2018
%         Arnaud Delorme         UCSD/ SCCN,2018

% Read the sample study
readsamplestudy;

% Test for changing parameters
paramList =  {'topofreq',             10;...
              'topofreq',             [8 12];...
              'freqrange',            [2 60];...
              'ylim',                 [0 20];...
              'plotgroups',           'together';...
              'plotgroups',           'apart';...
              'plotconditions',       'together';...
              'plotconditions',       'apart';...
              'subtractsubjectmean',  'on';...
              'subtractsubjectmean',  'off';...
              'averagechan',          'on';...
              'averagechan',          'off'}; % if new parameter/test-case, add here.
          
errorflag = zeros(1,size(paramList,1));

for iParam =1:size(paramList,1)
    STUDY = pop_specparams(STUDY,paramList{iParam,:});
    
    if ~isequal(STUDY.etc.specparams.(paramList{iParam,1}),paramList{iParam,2})
        errorflag(iParam) = 1;
        display(['test_pop_specparams: Testing parameter ''' paramList{iParam,1} ''' ... failed']);    
    else
        display(['test_pop_specparams: Testing parameter ''' paramList{iParam,1} ''' ... passed']);
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
error(['pop_specparams issue wile setting parameter(s) '''  errtext ''' ']); 
end
end