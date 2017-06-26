clear all
pc_name = 'Nico';
folder = 'ProyectoFinal';

% Abrir imagenes desde img_database
database = 'img_database';
database_images = direcciones(pc_name, folder , database);

RGB_img = image_read(database, database_images, 3);
HSV_img = rgb2hsv(RGB_img); 

divisions = 4;
divided = subdivide_image(RGB_img, divisions);