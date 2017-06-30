function [features] = features_vector(RGB_img, method)

% Traspasar a espacio HSV
HSV_img = rgb2hsv(RGB_img); 

% Elección de método (cantidad de subdivisiones)
if (method==1)
    divisions = 4;
elseif (method==2)
    divisions = 5;
elseif (method==3)
    divisions = 6;
end
       
divided = subdivide_image(HSV_img, divisions);

for image_cells_idx=1:divisions^2;
    subimage = divided{image_cells_idx};

    % Cálculo de histograma 3D y normalización
    histograma3d = hist3d(subimage);
    hist_mean = mean(histograma3d(:));
    normalized_hist = (histograma3d/hist_mean);

    % Concatenación
    if (image_cells_idx==1)
        cat_hists = normalized_hist;
    else
        cat_hists = cat(3, cat_hists, normalized_hist);       
    end

end

features = cat_hists;
end