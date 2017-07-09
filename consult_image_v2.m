function [rank, N_rel] = consult_image_v2(image_index, image_class, features_database, features_query, image_database, database_info)

query_features = features_query{image_index};

n_img_database = length(features_database);
distances = zeros(n_img_database, 1);
for j=1:n_img_database
    first_image = features_database{j};
    dist = chisquare_distance(query_features, first_image);
    distances(j) = dist;
end

[~,I] = sort(distances);

Ri_sum = 0;
N_rel = 0;
for k=1:length(I)
    index = I(k);
    database_image_class = database_info(index).class;
    
    if sum(database_image_class == image_class) == 3
        Ri_sum = Ri_sum + k;
        N_rel = N_rel + 1;
    end
end
rank = Ri_sum/N_rel;

end