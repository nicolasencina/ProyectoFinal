clear all
pc_name = 'Nico';
folder = 'ProyectoFinal';


filenames_database = {'features1_g','features2_g','features3_g','features4_g'};
filenames_query = {'features1_query_g','features2_query_g','features3_query_g','features4_query_g'}; 
database_query = [1 1];

gaborArray = gaborFilterBank(4,4,39,39);

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
              
        
        for metodo=1:3
            display('Metodo:')
            display(metodo)
            tic;
            database_features = cell(n_database-2, 1);
            for k=3:n_database
                % Leer imagen y convertir a espacio HSV
                image_idx = k;
                RGB = image_read(database, database_images, image_idx);
                RGB_img = imresize(RGB, 0.4);
                database_features{k-2} = features_vector_gabor(gaborArray, RGB_img, metodo);
            end
            save(filenames{metodo}, 'database_features');
            toc;
        end
        
    end
end



