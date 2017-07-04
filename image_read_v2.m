function [image] = image_read_v2(database_folder, name)
image = imread(fullfile(database_folder,'\', name));
end