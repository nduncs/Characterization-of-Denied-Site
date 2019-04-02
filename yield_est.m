function [DOB,Ypdf_test1,Ypdf_test3,Ypdf_test4,Ypdf_test5,Ypdf_test6] = yield_est()

%% Create yield distribution based upon seismic magnitude P wave data
% input: Mb values for P waves
% output: yield range distributions and minimum depth of burst
clear
%% import the magnitude data
data    = xlsread('Magnitude_KZ.xlsx');
k       = find(isnan(data));
data(k) = 0;
%% Sort the data by test
test_3  = data(:,2);
row     = find(data(:,1) == 0);
test_1  = data(1:row(1)-1,1);
row     = find(data(:,3) == 0);
test_4  = data(1:row(1)-1,3);
row     = find(data(:,4) == 0);
test_5  = data(1:row(1)-1,4);
row     = find(data(:,5) == 0);
test_6  = data(1:row(1)-1,5);
%% Actual Data from Publication
test_one_actual     = [19680929 60 290];
test_three_actual   = [19710425 90 296];
test_four_actual    = [19711129 20 203];
test_five_actual    = [19720328 6 124];
test_six_actual     = [19720816 8 139];
%% Create random values of yield based upon range of values of constants
% Mb = A + Blog(Y)
% A ranges from 4.05 - 4.5
% B ranges from 0.75 - 1.0
A1      = 4.35;
A2      = 4.45;
B1      = 0.75;
B2      = 0.8;
A       = (A2-A1).*rand(100,1)+A1;
B       = (B2-B1).*rand(100,1)+B1;
temp1   = (transpose(test_1)-A);
temp3   = (transpose(test_3)-A);
temp4   = (transpose(test_4)-A);
temp5   = (transpose(test_5)-A);
temp6   = (transpose(test_6)-A);
for i = 1:100
    temp_1(i,:) = temp1(i,:)/B(i);
end
for i = 1:100
    temp_3(i,:) = temp3(i,:)/B(i);
end
for i = 1:100
    temp_4(i,:) = temp4(i,:)/B(i);
end
for i = 1:100
    temp_5(i,:) = temp5(i,:)/B(i);
end
for i = 1:100
    temp_6(i,:) = temp6(i,:)/B(i);
end
temp1   = temp1(:);
temp3   = temp3(:);
temp4   = temp4(:);
temp5   = temp5(:);
temp6   = temp6(:);
test_1  = 10.^temp1;
test_3  = 10.^temp3;
test_4  = 10.^temp4;
test_5  = 10.^temp5;
test_6  = 10.^temp6;
%% fit the distributions and plot the possible yields
[Ypdf_test1,best_test1,KT1,y] = fitmethis(test_1,'output','off');
hold on
line([test_one_actual(2) test_one_actual(2)],[0 max(y)],'linewidth',2);
xlabel('Yield (Kilotons)');
ylabel('Frequency');
title('Yield Distribution Test 1');
legend('Frequency','distribution','actual');

[Ypdf_test3,best_test3,KT3,y] = fitmethis(test_3,'output','off');
hold on
line([test_three_actual(2) test_three_actual(2)],[0 max(y)],'linewidth',2);
xlabel('Yield (Kilotons)');
ylabel('Frequency');
title('Yield Distribution Test 3');
legend('Frequency','distribution','actual');

[Ypdf_test4,best_test4,KT4,y] = fitmethis(test_4,'output','off');
hold on
line([test_four_actual(2) test_four_actual(2)],[0 max(y)],'linewidth',2);
xlabel('Yield (Kilotons)');
ylabel('Frequency');
title('Yield Distribution Test 4');
legend('Frequency','distribution','actual');

[Ypdf_test5,best_test5,KT5,y] = fitmethis(test_5,'output','off');
hold on
line([test_five_actual(2) test_five_actual(2)],[0 max(y)],'linewidth',2);
xlabel('Yield (Kilotons)');
ylabel('Frequency');
title('Yield Distribution Test 5');
legend('Frequency','distribution','actual');

[Ypdf_test6,best_test6,KT6,y] = fitmethis(test_6,'output','off');
hold on
line([test_six_actual(2) test_six_actual(2)],[0 max(y)],'linewidth',2);
xlabel('Yield (Kilotons)');
ylabel('Frequency');
title('Yield Distribution Test 6');
legend('Frequency','distribution','actual');
%% Determine distribution for minimum depth of burst for each test
DOB1 = 90*test_1.^(1/3.4);
DOB3 = 90*test_3.^(1/3.4);
DOB4 = 70*test_4.^(1/3.4);
DOB5 = 70*test_5.^(1/3.4);
DOB6 = 70*test_6.^(1/3.4);
%% Fit distributions to the results and plot possible DOB
[DOBpdf_test1,best_DOB1,m1,y] = fitmethis(DOB1,'output','off');
hold on
line([test_one_actual(3) test_one_actual(3)],[0 max(y)],'linewidth',2);
xlabel('Minimum Depth of Burst (meters)');
ylabel('Frequency');
title('Minimum Depth of Burst Distribution Test 1');
legend('Frequency','distribution','actual');
[DOBpdf_test3,best_DOB3,m3,y] = fitmethis(DOB3,'output','off');
hold on
line([test_three_actual(3) test_three_actual(3)],[0 max(y)],'linewidth',2);
xlabel('Minimum Depth of Burst (meters)');
ylabel('Frequency');
title('Minimum Depth of Burst Distribution Test 3');
legend('Frequency','distribution','actual');
[DOBpdf_test4,best_DOB4,m4,y] = fitmethis(DOB4,'output','off');
hold on
line([test_four_actual(3) test_four_actual(3)],[0 max(y)],'linewidth',2);
xlabel('Minimum Depth of Burst (meters)');
ylabel('Frequency');
title('Minimum Depth of BurstDistribution Test 4');
legend('Frequency','distribution','actual');
[DOBpdf_test5,best_DOB5,m5,y] = fitmethis(DOB5,'output','off');
hold on
line([test_five_actual(3) test_five_actual(3)],[0 max(y)],'linewidth',2);
xlabel('Minimum Depth of Burst (meters)');
ylabel('Frequency');
title('Minimum Depth of Burst Distribution Test 5');
legend('Frequency','distribution','actual');
[DOBpdf_test6,best_DOB6,m6,y] = fitmethis(DOB6,'output','off');
hold on
line([test_six_actual(3) test_six_actual(3)],[0 max(y)],'linewidth',2);
xlabel('Minimum Depth of Burst (meters)');
ylabel('Frequency');
title('Minimum Depth of Burst Distribution Test 6');
legend('Frequency','distribution','actual');

%% Summarize distributions for each test

DOB(1:6,1:3) = zeros;
DOB(1,1:2) = DOBpdf_test1(1).par;
DOB(2,1)   = 150;
DOB(3,1:3) = DOBpdf_test3(1).par;
DOB(4,1:2) = DOBpdf_test4(1).par;
DOB(5,1:3) = DOBpdf_test5(1).par;
DOB(6,1:3) = DOBpdf_test6(1).par;
end
    
    