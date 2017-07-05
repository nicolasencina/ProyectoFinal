clear all
pc_name = 'Nico';
folder = 'ProyectoFinal';


filenames_database = {'features1','features2','features3','features4'};
filenames_query = {'features1_query','features2_query','features3_query','features4_query'}; 

database_query = [0 1];

for j=1:2  
    if database_query(j) 
        if j==1
            database = 'img_database';
            filenames = filenames_database;
        else
            database = 'img_query';
            filenames = filenames_query;
        end

        database_images = direcciones(pc_name, folder , database);
        n_database = length(database_images);
              
        
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
        
    end
end



