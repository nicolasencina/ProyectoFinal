%filenames = {'features1','features2','features3','features4'};
filenames = {'features1_g','features2_g','features3_g','features4_g'};

% Extraccion de datos de base de datos usando metodo 1
method = 2;
database = load(filenames{method});
database_1 = database.database_features;

database2 = load(filenames{1});
database_2 = database2.database_features;

% Abrir imagenes de la carpeta de consulta
pc_name = 'Nico';
folder = 'ProyectoFinal';
query_database = 'img_query';
image_database = 'img_database';

database_info = images_info(pc_name, folder, image_database); 
query_info = images_info(pc_name, folder, query_database);

n_query = length(query_info);


for k=1:1
   image_name = query_info(k).name;
   image_class = query_info(k).class;
   
   rank = consult_image(image_name, image_class, database_1, method, image_database, database_info);
end
