function test = checkmmo_sub1;

floatwrite([1:10], 'testfile.fdt'); 
test = mmo('testfile.fdt' , [1 10], true, false, true);
test(4) = 5;
