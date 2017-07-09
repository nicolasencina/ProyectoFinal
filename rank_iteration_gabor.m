clear all
% Abrir imagenes de la carpeta de consulta
pc_name = 'Nico';
folder = 'ProyectoFinal';

% Info de cada conjunto de imagenes
query_database = 'img_query';
image_database = 'img_database';
database_info = images_info(pc_name, folder, image_database); 
query_info = images_info(pc_name, folder, query_database);

n_query = length(query_info);

filenames_database = {'features1_g','features2_g','features3_g','features4_g'};
filenames_query = {'features1_query_g','features2_query_g','features3_query_g','features4_query_g'}; 

rank_array = zeros(n_query, 5);

for method=1:3
    % Extraccion de vectores de caracteristicas guardados en archivos
    db = load(filenames_database{method});
    db_features = db.database_features;

    dq = load(filenames_query{method});
    dq_features = dq.database_features;
    
    for k=1:n_query
       image_name = query_info(k).name;
       image_class = query_info(k).class;
       [rank, N_rel] = consult_image_v2(k, image_class, db_features, dq_features, image_database, database_info);
       rank_array(k,method) = rank;
       rank_array(k,5) = N_rel;
    end
end

save('ranks_array_gabor_normalized','rank_array')

