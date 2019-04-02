function [test_one,test_two,test_three,test_four,test_five,test_six] = sort_data(data)

test_date   = data.data(:,3);
test_lat    = data.data(:,4);
test_lon    = data.data(:,5);
test_depth  = data.data(:,6);

j=1;
for i = 1:length(test_date)/6
        test_one(i,1) = test_date(j);
        test_one(i,2) = test_lat(j);
        test_one(i,3) = test_lon(j);
        test_one(i,4) = test_depth(j);
    j = j + 6;
end

j=2;
for i = 1:length(test_date)/6
        test_two(i,1) = test_date(j);
        test_two(i,2) = test_lat(j);
        test_two(i,3) = test_lon(j);
        test_two(i,4) = test_depth(j);
    j = j + 6;
end
j=3;
for i = 1:length(test_date)/6
        test_three(i,1) = test_date(j);
        test_three(i,2) = test_lat(j);
        test_three(i,3) = test_lon(j);
        test_three(i,4) = test_depth(j);
    j = j + 6;
end
j=4;
for i = 1:length(test_date)/6
        test_four(i,1) = test_date(j);
        test_four(i,2) = test_lat(j);
        test_four(i,3) = test_lon(j);
        test_four(i,4) = test_depth(j);
    j = j + 6;
end
j=5;
for i = 1:length(test_date)/6
        test_five(i,1) = test_date(j);
        test_five(i,2) = test_lat(j);
        test_five(i,3) = test_lon(j);
        test_five(i,4) = test_depth(j);
    j = j + 6;
end
j=6;
for i = 1:length(test_date)/6
        test_six(i,1) = test_date(j);
        test_six(i,2) = test_lat(j);
        test_six(i,3) = test_lon(j);
        test_six(i,4) = test_depth(j);
    j = j + 6;
end
end