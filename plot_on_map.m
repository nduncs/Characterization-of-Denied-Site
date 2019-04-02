function plot_on_map(px,py,width,height,test_actual)
figure;
plot_google_map('apiKey','AIzaSyAZYF_yg0uCDDndyMWS_no0V0AYTiX8frs');
plot_google_map('Resize',1,'maptype','terrain');
% plot(test_two_contour(2,:),test_two_contour(1,:),'.r','MarkerSize',5) 
hold on
plot(test_actual(2),test_actual(1),'.b','MarkerSize',20)
location_two =  rectangle('Position', [px, py, width, height],...
    'EdgeColor','r','lineWidth',2);
legend('red = bayesloc', 'blue = actual');
end
% plot_google_map('Resize',1,'Refresh',0,'Mapscale',1,'FigureResizeUpdate',1,'maptype','terrain');