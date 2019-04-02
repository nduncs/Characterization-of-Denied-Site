function [x,y,px,py,width,height]=fit_distribution(test_one,test_two,test_three,test_four,test_five,test_six,...
    test_one_actual,test_two_actual,test_three_actual,test_four_actual...
    ,test_five_actual,test_six_actual,num_sig)

%% Test 1 
[pdf_test1_lat,best_test1_lat,x,lat_1] = fitmethis(test_one(:,2),'output','off');
xlabel('Latitude (degrees)');
ylabel('Frequency');
title('Latitude - Actual vs Bayesloc Seismic Data');
hold on 
plot(x,lat_1);
line([test_one_actual(2) test_one_actual(2)],[0 max(lat_1)],'linewidth',2);
xlim([pdf_test1_lat(1).par(1)-5*pdf_test1_lat(1).par(3) pdf_test1_lat(1).par(1)+5*pdf_test1_lat(1).par(3)]);
legend('frequency', 'distribution','lat_1','actual');
[pdf_test1_long,best_test1_long,x1,long_1] = fitmethis(test_one(:,3),'output','off');
xlabel('Longitude (degrees)');
ylabel('Frequency');
title('Longitude - Actual vs Bayesloc Seismic Data');
hold on 
plot(x1,long_1);
line([test_one_actual(3) test_one_actual(3)],[0 max(long_1)],'linewidth',2);
xlim([pdf_test1_long(1).par(1)-5*pdf_test1_long(1).par(3) pdf_test1_long(1).par(1)+5*pdf_test1_long(1).par(3)]);
legend('frequency', 'distribution','long', 'actual');
figure
[X Y] = meshgrid(x,x1);
Z = (transpose(long_1).*lat_1)/(sum(lat_1+long_1));
test_one_contour = contour3(X,Y,Z,100,'showtext','off');
hold on 
x_actual(1:101) = test_one_actual(2);
y_actual(1:101) = test_one_actual(3);
z = 0:max(max(Z))/100:max(max(Z));
plot3(x_actual,y_actual,z,'linewidth',2);
xlim([pdf_test1_lat(1).par(1)-5*pdf_test1_lat(1).par(3) pdf_test1_lat(1).par(1)+5*pdf_test1_lat(1).par(3)]);
ylim([pdf_test1_long(1).par(1)-5*pdf_test1_long(1).par(3) pdf_test1_long(1).par(1)+5*pdf_test1_long(1).par(3)]);
xlabel('Latitude');
ylabel('Longitude');
zlabel('frequency');
legend('PDF','actual');
y_1   = pdf_test1_lat.par;
x_1   = pdf_test1_long.par;
px_1      = x_1(1) - num_sig*x_1(2);
py_1      = y_1(1) - num_sig*y_1(2);
width_1   = num_sig*x_1(2);
height_1  = num_sig*y_1(2);
%% Test 2
[pdf_test2_lat,best_test2_lat,x,lat_2] = fitmethis(test_two(:,2),'output','off');
xlabel('Latitude (degrees)');
ylabel('Frequency');
title('Latitude - Actual vs Bayesloc Seismic Data');
hold on 
plot(x,lat_2);
line([test_two_actual(2) test_two_actual(2)],[0 max(lat_2)],'linewidth',2);
legend('frequency', 'distribution','lat_2','actual');
[pdf_test2_long,best_test2_long,x1,long_2] = fitmethis(test_two(:,3),'output','off');
xlabel('Longitude (degrees)');
ylabel('Frequency');
title('Longitude - Actual vs Bayesloc Seismic Data');
hold on 
plot(x1,long_2);
line([test_two_actual(3) test_two_actual(3)],[0 max(long_2)],'linewidth',2);
legend('frequency', 'distribution','long', 'actual');
figure
[X Y] = meshgrid(x,x1);
Z = (transpose(long_2).*lat_2)/(sum(lat_2+long_2));
test_two_contour = contour3(X,Y,Z,100,'showtext','off');
hold on 
x_actual(1:101) = test_two_actual(2);
y_actual(1:101) = test_two_actual(3);
z = 0:max(max(Z))/100:max(max(Z));
plot3(x_actual,y_actual,z,'linewidth',2);
hold on 
x(1:101) = test_two_actual(2);
y(1:101) = test_two_actual(3);
z = 0:max(max(Z))/100:max(max(Z));
plot3(x,y,z,'linewidth',2);
xlabel('Longitude');
ylabel('Latitude');
zlabel('frequency');
legend('PDF','actual');
y_2   = pdf_test2_lat.par;
x_2   = pdf_test2_long.par;
px_2    = x_2(1) - num_sig*x_2(2);
py_2      = y_2(1) - num_sig*y_2(2);
width_2   = num_sig*x_2(2);
height_2  = num_sig*y_2(2);
%% Test 3
[pdf_test3_lat,best_test3_lat,x,lat_3] = fitmethis(test_three(:,2),'output','off');
xlabel('Latitude (degrees)');
ylabel('Frequency');
title('Latitude - Actual vs Bayesloc Seismic Data');
hold on 
plot(x,lat_3);
line([test_three_actual(2) test_three_actual(2)],[0 max(lat_3)],'linewidth',2);
legend('frequency', 'distribution','lat_3','actual');
[pdf_test3_long,best_test3_long,x1,long_3] = fitmethis(test_three(:,3),'output','off');
xlabel('Longitude (degrees)');
ylabel('Frequency');
title('Longitude - Actual vs Bayesloc Seismic Data');
hold on 
plot(x1,long_3);
line([test_three_actual(3) test_three_actual(3)],[0 max(long_3)],'linewidth',2);
legend('frequency', 'distribution','long', 'actual');
figure
[X, Y] = meshgrid(x,x1);
Z = (transpose(long_3).*lat_3)/(sum(lat_3+long_3));
test_three_contour =contour3(X,Y,Z,100,'showtext','off');
hold on 
x_actual(1:101) = test_three_actual(2);
y_actual(1:101) = test_three_actual(3);
z = 0:max(max(Z))/100:max(max(Z));
plot3(x_actual,y_actual,z,'linewidth',2);
xlabel('Longitude');
ylabel('Latitude');
zlabel('frequency');
legend('PDF','actual');
y_3   = pdf_test3_lat.par;
x_3   = pdf_test3_long.par;
px_3      = x_3(1) - num_sig*x_3(2);
py_3      = y_3(1) - num_sig*y_3(2);
width_3   = num_sig*x_3(2);
height_3  = num_sig*y_3(2);
%% test 4
[pdf_test4_lat,best_test4_lat,x,lat_4] = fitmethis(test_four(:,2),'output','off');
xlabel('Latitude (degrees)');
ylabel('Frequency');
title('Latitude - Actual vs Bayesloc Seismic Data');
hold on 
plot(x,lat_4);
line([test_four_actual(2) test_four_actual(2)],[0 max(lat_4)],'linewidth',2);
legend('frequency', 'distribution','lat_4','actual');
[pdf_test4_long,best_test4_long,x1,long_4] = fitmethis(test_four(:,3),'output','off');
xlabel('Longitude (degrees)');
ylabel('Frequency');
title('Longitude - Actual vs Bayesloc Seismic Data');
hold on 
plot(x1,long_4);
line([test_four_actual(3) test_four_actual(3)],[0 max(long_4)],'linewidth',2);
legend('frequency', 'distribution','long', 'actual');
figure
[X Y] = meshgrid(x,x1);
Z = (transpose(long_4)*lat_4)/(sum(lat_4+long_4));
test_four_contour =contour3(X,Y,Z,100,'showtext','off');
hold on 
x_actual(1:101) = test_four_actual(2);
y_actual(1:101) = test_four_actual(3);
z = 0:max(max(Z))/100:max(max(Z));
plot3(x_actual,y_actual,z,'linewidth',2);
xlabel('Longitude');
ylabel('Latitude');
zlabel('frequency');
legend('PDF','actual');
y_4   = pdf_test4_lat.par;
x_4   = pdf_test4_long.par;
px_4      = x_4(1) - num_sig*x_4(2);
py_4      = y_4(1) - num_sig*y_4(2);
width_4   = num_sig*x_4(2);
height_4  = num_sig*y_4(2);
%% test 5
[pdf_test5_lat,best_test5_lat,x,lat_5] = fitmethis(test_five(:,2),'output','off');
xlabel('Latitude (degrees)');
ylabel('Frequency');
title('Latitude - Actual vs Bayesloc Seismic Data');
hold on 
plot(x,lat_5);
line([test_five_actual(2) test_five_actual(2)],[0 max(lat_5)],'linewidth',2);
legend('frequency', 'distribution','lat_5','actual');
[pdf_test5_long,best_test5_long,x1,long_5] = fitmethis(test_five(:,3),'output','off');
xlabel('Longitude (degrees)');
ylabel('Frequency');
title('Longitude - Actual vs Bayesloc Seismic Data');
hold on 
plot(x1,long_5);
line([test_five_actual(3) test_five_actual(3)],[0 max(long_5)],'linewidth',2);
legend('frequency', 'distribution','long', 'actual');
figure
[X Y] = meshgrid(x,x1);
Z = (transpose(long_5)*lat_5)/(sum(lat_5+long_5));
test_five_contour =contour3(X,Y,Z,100,'showtext','off');
hold on 
x_actual(1:101) = test_five_actual(2);
y_actual(1:101) = test_five_actual(3);
z = 0:max(max(Z))/100:max(max(Z));
plot3(x_actual,y_actual,z,'linewidth',2);
xlabel('Longitude');
ylabel('Latitude');
zlabel('frequency');
legend('PDF','actual');
y_5   = pdf_test5_lat.par;
x_5   = pdf_test5_long.par;
px_5      = x_5(1) - num_sig*x_5(2);
py_5      = y_5(1) - num_sig*y_5(2);
width_5   = num_sig*x_5(2);
height_5  = num_sig*y_5(2);
%% test 6
[pdf_test6_lat,best_test6_lat,x,lat_6] = fitmethis(test_six(:,2),'output','off');
xlabel('Latitude (degrees)');
ylabel('Frequency');
title('Latitude - Actual vs Bayesloc Seismic Data');
hold on 
plot(x,lat_6);
line([test_six_actual(2) test_six_actual(2)],[0 max(lat_6)],'linewidth',2);
legend('frequency', 'distribution','lat_6','actual');
[pdf_test6_long,best_test6_long,x1,long_6] = fitmethis(test_six(:,3),'output','off');
xlabel('Longitude (degrees)');
ylabel('Frequency');
title('Longitude - Actual vs Bayesloc Seismic Data');
hold on 
plot(x1,long_6);
line([test_six_actual(3) test_six_actual(3)],[0 max(long_6)],'linewidth',2);
legend('frequency', 'distribution','long', 'actual');
figure
[X Y] = meshgrid(x,x1);
Z = (transpose(long_6)*lat_6)/(sum(lat_6+long_6));
test_six_contour =contour3(X,Y,Z,100,'showtext','off');
hold on 
x_actual(1:101) = test_six_actual(2);
y_actual(1:101) = test_six_actual(3);
z = 0:max(max(Z))/100:max(max(Z));
plot3(x_actual,y_actual,z,'linewidth',2);
xlabel('Longitude');
ylabel('Latitude');
zlabel('frequency');
legend('PDF','actual');
y_6   = pdf_test6_lat.par;
x_6   = pdf_test6_long.par;
px_6      = x_6(1) - num_sig*x_6(2);
py_6      = y_6(1) - num_sig*y_6(2);
width_6   = num_sig*x_6(2);
height_6  = num_sig*y_6(2);
%% Consolidate Distribution parameters and areas
x = [x_1(1:2);x_2(1:2);x_3(1:2);x_4(1:2);x_5(1:2);x_6(1:2)];
y = [y_1(1:2);y_2(1:2);y_3(1:2);y_4(1:2);y_5(1:2);y_6(1:2)];
px = [px_1;px_2;px_3;px_4;px_5;px_6];
py = [py_1;py_2;py_3;py_4;py_5;py_6];
width = [width_1;width_2;width_3;width_4;width_5;width_6];
height = [height_1;height_2;height_3;height_4;height_5;height_6];
end