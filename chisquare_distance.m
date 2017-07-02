function [output] = chisquare_distance(matrix_1, matrix_2)
rows = matrix_1(:,1,1);
cols = matrix_1(1,:,1);
zetas = matrix_1(1,1,:);

output = 0;
for i=1:rows
    for j=1:cols
        for k=1:zetas
            a = matrix_1(i,j,k);
            b = matrix_2(i,j,k);
            output = output + ((a-b)^2)/(a+b);
        end
    end
end
end