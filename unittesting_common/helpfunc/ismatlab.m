function res = ismatlab

res = exist('OCTAVE_VERSION', 'builtin') == 0;
