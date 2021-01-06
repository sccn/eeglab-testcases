% test_textgui
% 05/19/2010/ roy

function test_textgui
textgui( {'Test Function Covary', 'Test Function Eucl'}, {'test_covary', 'test_eucl'});
close;

textgui( {'Test Function Covary', 'Test Function Eucl'}, {'test_covary', 'test_eucl'},...
    'title', 'Test', 'fontweight', {'light', 'bold'}, 'fontsize', {14, 16}, 'fontname', {'Courier', 'Courier'}, 'lineperpage', 10);
close;