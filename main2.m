filenames = {'features1','features2','features3','features4'};

% Extraccion de datos de base de datos usando metodo 1
method = 1;
database = load(filenames{method});
database_1 = database.database_features;

% Abrir imagenes de la carpeta de consulta
pc_name = 'Nico';
folder = 'ProyectoFinal';
query_database = 'img_query';
query_images = direcciones(pc_name, folder , query_database);
n_query = length(query_images);


for k=3:3
    %Leer imagen y convertir a espacio HSV
    image_idx = k;
    RGB_img = image_read(query_database, query_images, image_idx);
    %method = 1;  %Definido al principio
    tic;
    query_features = features_vector(RGB_img, method);
    toc;
end

first_image = database_1{1};
dist = chisquare_distance(query_features, first_image);




