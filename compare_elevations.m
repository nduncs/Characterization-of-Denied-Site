function compare_elevations(elevation_map,elevation_map2,elevation_map3,elevation_map4...
    ,px,py,width,height)

lng_map(1:6,1:100) = zeros;
lat_map(1:6,1:100) = zeros;
lng_grid = width/100;
lat_grid = height/100;
for i = 1:6
    lng_map(i,1) = px(i);
    lat_map(i,1) = py(i);
        for j = 2:100
            lng_map(i,j) = lng_map(i,j-1)+lng_grid(i);
            lat_map(i,j) = lat_map(i,j-1)+lat_grid(i);
        end
    figure('Name','Elevation High DOB');
    meshc(lng_map(i,:), lat_map(i,:), elevation_map3{i,:,:});
    hold on
    meshc(lng_map(i,:), lat_map(i,:), elevation_map{i,:,:});
    title('Elevation profile');
    xlabel('Latitude (º)');
    ylabel('Longitude (º)');
    zlabel('Elevation (m)');
    colorbar;
    
    figure('Name','Elevation Low DOB');
    meshc(lng_map(i,:), lat_map(i,:), elevation_map4{i,:,:});
    hold on
    meshc(lng_map(i,:), lat_map(i,:), elevation_map{i,:,:});
    title('Elevation profile');
    xlabel('Latitude (º)');
    ylabel('Longitude (º)');
    zlabel('Elevation (m)');
    colorbar;
end


end