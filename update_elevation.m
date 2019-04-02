function [elevation_map3,elevation_map4, high_DOB low_DOB] = update_elevation(sigma,DOB,elevation_map2)
high_DOB(1:6) = zeros;
high_DOB(1:2) = [DOB(1) DOB(2)];
high_DOB(3)   = DOB(3,3)+sigma*DOB(3,2);
high_DOB(4)   = DOB(4,2);
high_DOB(5)   = DOB(5,3)+sigma*DOB(5,2);
high_DOB(6)   = DOB(6,3)+sigma*DOB(6,2);
low_DOB(1:6) = zeros;
low_DOB(1:2) = [DOB(1) DOB(2)];
low_DOB(3)   = DOB(3,3)-sigma*DOB(3,2);
low_DOB(4)   = DOB(4,1);
low_DOB(5)   = DOB(5,3)-sigma*DOB(5,2);
low_DOB(6)   = DOB(6,3)-sigma*DOB(6,2);
for i = 1:6
    elevation_map3{i,:,:} = elevation_map2{i,:,:} - high_DOB(i);
end
for i = 1:6
    elevation_map4{i,:,:} = elevation_map2{i,:,:} - low_DOB(i);
end
for m = 1:6
    temp_elev = elevation_map3{m,:,:};
    temp_elev1 = elevation_map4{m,:,:};
    for i = 1:100
        for j = 1:100
            if temp_elev(i,j) < 0
                temp_elev(i,j) = NaN;
            end
            if temp_elev1(i,j) < 0
                temp_elev1(i,j) = NaN;
            end
        elevation_map3{m,:,:} = temp_elev;
        elevation_map4{m,:,:} = temp_elev1;
        end
    end
end
end