% pc_name = 'Nico';
% folder = 'ProyectoFinal';
% database = 'img_database';
% 
% database_images = direcciones(pc_name, folder , database);
% 
% RGB = image_read(database, database_images, 3);
% RGB_img = imresize(RGB, 0.3);
% method = 1;

function [features] = features_vector_gabor(gaborArray, RGB_img, method)
% Traspasar a escala de grises
gray_img = rgb2gray(RGB_img); 

messy_partitions = false(1);
% Elección de método (cantidad de subdivisiones)
if (method==1)
    divisions = 4;
elseif (method==2)
    divisions = 5;
elseif (method==3)
    divisions = 6;
elseif (method==4);
    messy_partitions = true(1);
    divisions = 0;
    n_subimages = 5;
end

divided = subdivide_image(gray_img, divisions, messy_partitions);

if messy_partitions == 0
    n_subimages = divisions^2;
end

for image_cells_idx=1: n_subimages;
    subimage = divided{image_cells_idx};

    % Cálculo de histograma 3D y normalización

    gabor_features = gaborFeatures(subimage,gaborArray);
    % Concatenación
    if (image_cells_idx==1)
        cat_hists = gabor_features;
    else
        cat_hists = cat(2, cat_hists, gabor_features);       
    end

end

features = cat_hists;

end

