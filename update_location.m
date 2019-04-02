function [px_high,py_high,width_high,height_high,px_low,py_low,width_low,height_low] = update_location(elevation_map2, elevation_map3...
    ,elevation_map4,px,py,width,height)
width_high(1:6) = zeros;
height_high(1:6) = zeros;
px_high(1:6) = zeros;
py_high(1:6) = zeros;
width_low(1:6) = zeros;
height_low(1:6) = zeros;
px_low(1:6) = zeros;
py_low(1:6) = zeros;
width_avg(1:100,1:6) = zeros;
width_avg1(1:100,1:6) = zeros;
height_avg(1:6,1:100) = zeros;
height_avg1(1:6,1:100) = zeros;
% index(1:6,1:100) = zeros;
% index1(1:6,1:100) = zeros;
% index2(1:6,1:100) = zeros;
% index3(1:6,1:100) = zeros;
for m = 1:6
    shallow = isnan(elevation_map3{m,:,:});
    shallow1 = isnan(elevation_map4{m,:,:});
    width_avg(:,m) = sum(shallow,1);
    width_avg1(:,m) = sum(shallow1,1);
    for i = 1:100
        if width_avg(i,m) < 70
            width_high(m) = width_high(m)+1;
        end
        if width_avg1(i,m) < 70 
            width_low(m) = width_low(m) + 1;
        end

    end
    width_high(m)    = width(m) * (width_high(m)/100);
    width_low(m)     = width(m) * (width_low(m)/100);
    index            = find(width_avg(:,m)<70,1,'last');
    index1           = find(width_avg1(:,m)<70,1,'last');
    if index < 50
        px_high(m)       = px(m)+((-index)/100)*width(m);
    end
    px_high(m)       = px(m)+((100-index)/100)*width(m);
    px_low(m)        = px(m)+((100-index1)/100)*width(m);
    height_avg(m,:)  = sum(shallow,2);
    height_avg1(m,:) = sum(shallow1,2);
    for i = 1:100
        if height_avg(m,i) < 70
            height_high(m) = height_high(m)+1;
        end
        if height_avg1(m,i) < 70 
            height_low(m) = height_low(m) + 1;
        end
      
    end
    height_high(m)  = height(m)*(height_high(m)/100);
    height_low(m)   = height(m)*(height_low(m)/100);
    index2          = find(height_avg(m,:)<70,1,'first');
    index3          = find(height_avg1(m,:)<70,1,'first');
    if index2 < 50
        py_high(m)       = py(m)+((100-index)/100)*height(m);
    end
    py_high(m)      = py(m) + ((index2)/100)*height(m);
    py_low(m)       = py(m) + ((index3)/100)*height(m);

end

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
    meshc(lng_map(i,:), lat_map(i,:), elevation_map2{i,:,:});
    title('Updated Depth of Burst');
    xlabel('Latitude (º)');
    ylabel('Longitude (º)');
    zlabel('Depth of Burst (m)');
        zlh = get(gca,'zlabel');
    zlp = get(zlh, 'Position');
    set(zlh, 'Rotation',0, 'Position',zlp, 'VerticalAlignment','middle', 'HorizontalAlignment','right');
    colorbar;
    plot(i) = rectangle('Position', [px(i), py(i), width(i), height(i)],...
    'EdgeColor','r','lineWidth',2);
    plot1(i) = rectangle('Position', [px_high(i), py_high(i), width_high(i), height_high(i)],...
    'EdgeColor','b','lineWidth',2);
    figure('Name','Elevation Low DOB');
    meshc(lng_map(i,:), lat_map(i,:), elevation_map4{i,:,:});
    hold on
    meshc(lng_map(i,:), lat_map(i,:),elevation_map2{i,:,:});
    title('Updated Depth of Burst');
    xlabel('Latitude (º)');
    ylabel('Longitude (º)');
    zlabel('Depth of Burst (m)');
    zlh = get(gca,'zlabel');
    zlp = get(zlh, 'Position');
    set(zlh, 'Rotation',0, 'Position',zlp, 'VerticalAlignment','middle', 'HorizontalAlignment','right');
    colorbar;
    plot2(i) = rectangle('Position', [px(i), py(i), width(i), height(i)],...
    'EdgeColor','r','lineWidth',2);
    plot3(i) = rectangle('Position', [px_low(i), py_low(i), width_low(i), height_low(i)],...
    'EdgeColor','b','lineWidth',2);
end


end