% test_pop_comments
% 03/31/2010 roy
% case 1...6
% copy the old test case written by arno (case 7)
function test_pop_comments

%% Case 1 & 2
oldcomments = '';
newcomments = 'test pass!';
title = 'Testing!';
newcomments = pop_comments(oldcomments, title, newcomments, 0);

newcomments = pop_comments(oldcomments, title, newcomments, 1);

%% Case 3 & 4
oldcomments = 'another ';
newcomments = 'test pass!';
title = 'Testing!';
newcomments = pop_comments(oldcomments, title, newcomments, 0);

newcomments = pop_comments(oldcomments, title, newcomments, 1);

%% Case 5 & 6
oldcomments = 'another ';
newcomments = {'test pass!', 'pass again!'};
title = 'Testing!';
newcomments = pop_comments(oldcomments, title, newcomments, 0);

newcomments = pop_comments(oldcomments, title, newcomments, 1);

%% Case 7
readcontsamplefile;
EEG.comments = pop_comments(EEG.comments, '', strvcat( 'un exemple', ' ', 'de nouveau dataset'), 1);

EEG.comments = pop_comments(EEG.comments, '', strvcat( 'un exemple', ' ', 'de nouveau dataset'), 0);