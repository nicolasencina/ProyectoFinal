function [salida] = chisquare_distance(matrix_1, matrix_2)
rows = length(matrix_1(:,1,1));
cols = length(matrix_1(1,:,1));
zetas = length(matrix_1(1,1,:));

output = 0;
for i=1:rows
    for j=1:cols
        for k=1:zetas
            a = matrix_1(i,j,k);
            b = matrix_2(i,j,k);
            if (a+b)~=0
                output = output + ((a-b)^2)/(a+b);
            end
        end
    end
end
salida = output;
end