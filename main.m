clear all
pc_name = 'Nico';
folder = 'ProyectoFinal';

% Abrir imagenes desde img_database
database = 'img_database';
database_images = direcciones(pc_name, folder , database);

% Leer imagen y convertir a espacio HSV
image_idx = 3;
RGB_img = image_read(database, database_images, image_idx);
HSV_img = rgb2hsv(RGB_img); 

% Elección de método (cantidad de subdivisiones)
divisions = 4;
divided = subdivide_image(RGB_img, divisions);
idx = 1;
subimage = divided{idx};

% Cálculo de histograma 3D y normalización
histograma3d = hist3d(subimage);
hist_mean = mean(histograma3d(:));
normalized_hist = (histograma3d/hist_mean);

% Concatenación
% cat(3, A, B);



