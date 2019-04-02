%% this script will import Bayesloc and Analyze it
% inputs is the script titled "origins.out" from Bayesloc

% Output: 
% distribution uncertainty for lat/long
% 2D distribution with comparison to known values
% area box plotted on a map
% elevation data for area
% profile view of a slice of the area
clear;
%% Import the data and sort it into each test
data = importdata('origins.out');
[test_1,test_2,test_3,test_4,test_5,test_6] = sort_data(data);

%% Actual data of location and depth
test_one_actual     = [19680929 49.811972 78.121944 290];
test_two_actual     = [19690723 49.815639 78.129611 219];
test_three_actual   = [19710425 49.768528 78.033917 296];
test_four_actual    = [19711129 49.743417 78.0785 203];
test_five_actual    = [19720328 49.733056 78.075694 124];
test_six_actual     = [19720816 49.765472 78.0588333 139];
test_actual = [test_one_actual(2:3);test_two_actual(2:3);...
    test_three_actual(2:3);test_four_actual(2:3);test_five_actual(2:3);test_six_actual(2:3);];

%% Fit distribution to each test data location
sigma_number = 5;
[x,y,px,py,width,height]=fit_distribution(test_1,test_2,test_3,test_4,test_5,test_6...
    ,test_one_actual,test_two_actual,test_three_actual,test_four_actual...
    ,test_five_actual,test_six_actual,sigma_number);
px(3) = px(1);
px(4) = px(2);
py(3) = py(1);
py(3) = py(1);
height(3) = height(1);
width(3) = width(1);
width(4) = width(1);
%% Plot the Areas on a map
for i = 1:6
    plot_on_map(px(i),py(i),width(i),height(i),test_actual(i,1:2));
end

%% Get Elevation Data
for i = 1:6
    elevation_map{i,:,:} = elevation_data(px(i),py(i),width(i),height(i));
end
%%  Initial Depth of Location Area
for i = 1:6
    temp_elev = elevation_map{i,1};
    max_Elev(i) = max(max(temp_elev));
    min_Elev(i) = min(min(temp_elev));
    depth_Loc_Area(i) = max_Elev(i)-min_Elev(i);
    elevation_map2{i,:,:} = elevation_map{i,:,:} - min_Elev(i);
    temp_elev = reshape(elevation_map2{i,1},[],1);
    [elev,elev_dist_name, elev_dist_x(i,:),elev_dist_y(i,:)] = fitmethis(temp_elev,...
        'output','off');
    title('Depth of Burst Distribution');
    xlabel('Depth of Burst(m)');
    ylabel('Frequency');
end
clear temp_elev
%% Yield estimates and Minimum Depth of Burst Estimates through Yield
[min_DOB,Ypdf_test1,Ypdf_test3,Ypdf_test4,Ypdf_test5,Ypdf_test6] = yield_est;
%% Update elevation analysis for location
sigma = 3;
[elevation_map3,elevation_map4,DOB_high DOB_low] = update_elevation(sigma...
    ,min_DOB,elevation_map2);
[px_high,py_high,width_high,height_high,px_low,py_low,width_low,height_low] = update_location(elevation_map2,...
    elevation_map3,elevation_map4,px,py,width,height);

%% updated DOB from minimum Depth of Burst
for i = 1:6
    temp_elev = reshape(elevation_map3{i,1},[],1);
    [elev,elev_dist_name, elev_dist_x2(i,:),elev_dist_y2(i,:)] = fitmethis(temp_elev,...
        'output','off');
    figure;
    plot(elev_dist_x(i,:),elev_dist_y(i,:),'linewidth',2,'color', 'r');
    hold on
    plot(elev_dist_x2(i,:),elev_dist_y2(i,:),'linewidth',2,'color', 'b');
    legend('Initial Depth of Burst', 'Updated Depth of Burst');
    title('Updated Depth of Burst Distribution test');
    xlabel('Depth of Burst(m)');
    ylabel('Frequency');
end
%% Compare possible elevations
compare_elevations(elevation_map, elevation_map2, elevation_map3, elevation_map4...
    ,px,py,width,height);
for i = 1:6
    figure;
    plot(elev_dist_x(i,:),elev_dist_y(i,:),'lineWidth',2,'Color','r');
    hold on
    plot(elev_dist_x2(i,:),elev_dist_y2(i,:),'lineWidth',2,'Color','b');
    title('Depth of Burst Distribution Comparison');
    xlabel('Depth of Burst');
    ylabel('Frequency');
    legend('Original distribution depth', 'Updated distribution depth','location','Northwest');
end
