function[output] = subdivide_image(image, divisions, last_method)

rows = length(image(:,1,1));
cols = length(image(1,:,1));
if last_method == 0
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
else
    [rr, cc] = meshgrid(1:cols,1:rows);
    semi_a = floor(0.9*(cols/2));
    semi_b = floor(0.8*(rows/2));
    left_mask = (rr<=(cols/2));
    superior_mask = (cc<=(rows/2));
    circ = (1/semi_a^2)*(rr-cols/2).^2+(1/semi_b^2)*(cc-rows/2).^2>=1;
    
    mask1 = superior_mask.*left_mask.*not(circ);
    mask2 = superior_mask.*not(left_mask).*not(circ);
    mask3 = not(superior_mask).*not(left_mask).*not(circ);
    mask4 = not(superior_mask).*(left_mask).*not(circ);
    mask5 = circ;
    
    output = cell(5,1);
        
    output{1} = apply_mask(image, mask1);
    output{2} = apply_mask(image, mask2);
    output{3} = apply_mask(image, mask3);
    output{4} = apply_mask(image, mask4);
    output{5} = apply_mask(image, mask5);
    
end
end