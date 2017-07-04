function [] = consult_image(image_name, features_database, method, image_database, database_info)
RGB_img = image_read_v2('img_query' ,image_name);
query_features = features_vector(RGB_img, method);


n_img_database = length(features_database);
distances = zeros(n_img_database, 1);
for j=1:n_img_database
    first_image = features_database{j};
    dist = chisquare_distance(query_features, first_image);
    distances(j) = dist;
end

[B,I] = sort(distances);

best_images = cell(9,1);
for i=1:9
    index = I(i);
    best_images{i} = image_read_v2(image_database,database_info(index).name);
end

splot(3,3,best_images)

end