clear all
pc_name = 'Nico';
folder = 'ProyectoFinal';

% Abrir imagenes desde img_database
database = 'img_database';
database_images = direcciones(pc_name, folder , database);


% Leer imagen y convertir a espacio HSV
image_idx = 3;
RGB_img = image_read(database, database_images, image_idx);

method = 1;  % De 1 a 3 por el momento, 4 se demora mucho
features = features_vector(RGB_img, method);



