function [image] = image_read(database_folder, image_names, index)
image = imread(fullfile(database_folder,'\', image_names(index).name));
end