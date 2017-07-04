function [database_images_info] = images_info(pc_name, folder, database)
database_images = direcciones(pc_name, folder , database);

% Creación de vectores de caracteriticas de la base de datos para los 4
% metodos
n_database = length(database_images);

names_ = cell(n_database-2, 1);
classes = cell(n_database-2, 1); 
ides = cell(n_database-2, 1);

for k=3:n_database
    % Leer imagen y convertir a espacio HSV
    image_idx = k;
    name = database_images(image_idx).name;
    [name, class, id] = split_name(name);
    names_{image_idx-2} = name;
    classes{image_idx-2} = class;
    ides{image_idx-2} = id;
    %s = struct('name', name, 'class', class, 'id', id, 'index', image_idx-2);
    %database_images_info{image_idx-2} = s;
end

database_images_info = struct('name', names_, 'class', classes, 'id', ides);
end
  