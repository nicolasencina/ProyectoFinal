function[output] = subdivide_image(image, divisions)
rows = length(image(:,1,1));
cols = length(image(1,:,1));

rows_pix = floor(rows/divisions);
cols_pix = floor(cols/divisions);

output = cell(divisions, divisions);

cell_index = 1;
for col=1:divisions
    for row=1:divisions
        if row ~= divisions
            rows_bounds = (rows_pix*(row-1)+1):rows_pix*(row);
        else
            rows_bounds = (rows_pix*(row-1)+1):rows;
        end
        
        if col ~= divisions   
            cols_bounds = (cols_pix*(col-1)+1):cols_pix*(col);
        else
            cols_bounds = (cols_pix*(col-1)+1):cols;
        end
        
        output{cell_index} = image(rows_bounds,cols_bounds, :);
        cell_index = cell_index + 1;
    end
      
end
end