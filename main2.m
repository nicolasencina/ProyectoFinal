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


for k=1:1
    RGB_img = image_read_v2(query_database,query_info(k).name);
    %method = 1;  %Definido al principio
    query_features = features_vector(RGB_img, method);
end


n_img_database = length(database_1);
distances = zeros(n_img_database, 1);
for j=1:n_img_database
    first_image = database_1{j};
    dist = chisquare_distance(query_features, first_image);
    distances(j) = dist;
end

[B,I] = sort(distances);




