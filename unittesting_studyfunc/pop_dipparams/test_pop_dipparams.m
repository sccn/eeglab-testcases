function test_pop_dipparams
% Author: Ramon Martinez-Cancino UCSD/ SCCN,2018
%         Arnaud Delorme         UCSD/ SCCN,2018

% Read the sample study
readsamplestudy;

% Test for changing parameters
paramList =  {'axistight', 'on';...
              'axistight', 'off';...
              'projimg',   'on';...
              'projimg',   'off';...
              'projlines', 'on';...
              'projlines', 'off';...
              'density',   'on';...
              'density',   'off';...
              'centrline', 'on'
              'centrline', 'off'}; % if new parameter/test-case, add here.
          
errorflag = zeros(1,size(paramList,1));

for iParam =1:size(paramList,1)
    STUDY = pop_dipparams(STUDY,paramList{iParam,:});
    
    if ~isequal(STUDY.etc.dipparams.(paramList{iParam,1}),paramList{iParam,2})
        errorflag(iParam) = 1;
        display(['test_pop_dipparams: Testing parameter ''' paramList{iParam,1} ''' ... failed']);    
    else
        display(['test_pop_dipparams: Testing parameter ''' paramList{iParam,1} ''' ... passed']);
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
error(['pop_dipparams issue wile setting parameter(s) '''  errtext ''' ']); 
end
end