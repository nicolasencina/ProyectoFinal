clear all
pc_name = 'Nico';
folder = 'ProyectoFinal';

% Abrir imagenes desde img_database
database = 'img_database';
database_images = direcciones(pc_name, folder , database);


% Creación de vectores de caracteriticas de la base de datos para los 4
% metodos
n_database = length(database_images);
filenames = {'features1','features2','features3','features4'};

for metodo=1:4
    display('Metodo:')
    display(metodo)
    tic;
    database_features = cell(n_database-2, 1);
    for k=3:n_database
        % Leer imagen y convertir a espacio HSV
        image_idx = k;
        RGB_img = image_read(database, database_images, image_idx);
        database_features{k-2} = features_vector(RGB_img, metodo);
    end
    save(filenames{metodo}, 'database_features')
    toc;
end



