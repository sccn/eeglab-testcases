function test_setfont
figure; plot(1:10);
xlabel('test')
ylabel('test2')
title('test3')

setfont(gcf, 'fontsize', 12);
setfont(gcf, 'handletype', 'xlabels', 'fontsize', 18);
close;