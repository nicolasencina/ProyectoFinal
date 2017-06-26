function [listing] = direcciones(pc_name, folder_name, database )
dir1 = 'C:\Users\';
dir2 = '\Desktop\';
start_path = fullfile(dir1,pc_name,dir2,folder_name,'\',database);
listing = dir(start_path);
end