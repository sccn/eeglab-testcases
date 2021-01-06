% test_uniqe_cell_string

function test_uniqe_cell_string

a.name = 'haha';
a.func = 'lazy';
b = 'We ';
c = [1 2;3 4;5 6];
d = 235.3443;
e = 'are ';
f = 'strings.';
g = {' Not', 'including me!'};
DATA = {a, b, c, d, e, f, g};

result = unique_cell_string(DATA);

if ~near(size(result), [1 3]) || ~strcmp(result{1}, b) || ~strcmp(result{2}, e) || ~strcmp(result{3}, f) 
    error('EEGLAB:unittesting', 'Error in uniqe_cell_string(): Incorrectly uniqe string from cell');
end;