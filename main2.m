clear all
filenames = {'features1','features2','features3','features4'};

% Extraccion de datos de base de datos usando metodo 1
method = 1;
database = load(filenames{method});
database_1 = database.database_features;

% Abrir imagenes de la carpeta de consulta
pc_name = 'Nico';
folder = 'ProyectoFinal';
query_database = 'img_query';
image_database = 'img_database';

database_info = images_info(pc_name, folder, image_database); 
query_info = images_info(pc_name, folder, query_database);

query_images = direcciones(pc_name, folder , query_database);
n_query = length(query_info);


for k=24:24
   image_name = query_info(k).name;
   consult_image(image_name, database_1, method, image_database, database_info)
end
