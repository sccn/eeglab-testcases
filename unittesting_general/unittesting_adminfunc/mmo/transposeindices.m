% transpose indices if using a transposed array for the data on disk

function ss = transposeindices(obj, ss)

    if nargin < 2
        return;
    end;

    if length(obj.dimensions) ~= 2 && length(obj.dimensions) ~= 3 && ...
        length(ss(1).subs) ~= 2 && length(ss(1).subs) ~= 3
            error('Cannot transpose a 3-D array when using 2-D indexing');
    end;
    if length(obj.dimensions) == 2
        if length(ss(1).subs) == 3 && isequal(ss(1).subs{3}, 1), ss(1).subs(3) = []; end;
        ss(1).subs = { ss(1).subs{2} ss(1).subs{1} };
    elseif length(obj.dimensions) == 3
        if length(ss(1).subs) == 2,
            if ~isequal(ss(1).subs{2}, ':')
                error('Cannot transpose a 3-D array when using 2-D indexing');
            else
                ss(1).subs = { ss(1).subs{2} ':' ss(1).subs{1} };
            end;
        elseif length(ss(1).subs) == 3
            ss(1).subs = { ss(1).subs{2:3} ss(1).subs{1} };
        end;
    end;
