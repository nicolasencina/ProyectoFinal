ranks = load('ranks_array_gabor_normalized.mat');

ranks_matrix = ranks.rank_array;

promedios = zeros(1,4);
desviaciones = zeros(1,4);
maximos = zeros(1,4);

decimales = 1000;

for i=1:4
%     promedios(i) =mean(ranks_matrix(:,i));
%     desviaciones(i) = std(ranks_matrix(:,i));
    promedios(i) = fix(decimales*mean(ranks_matrix(:,i)))/decimales;
    desviaciones(i) = fix(decimales*std(ranks_matrix(:,i)))/decimales;
    maximos(i) = fix(decimales*max(ranks_matrix(:,i)))/decimales;
end

% ranks_normalized = ranks_matrix;
% 
% for j=1:length(ranks_normalized(:,1));
%     for g=1:4
%         ranks_normalized(j,g) = ranks_normalized(j,g)/((ranks_normalized(j,5)+1)/2);
%     end
% end
% 
% 
% for i=1:4
% %     promedios(i) =mean(ranks_matrix(:,i));
% %     desviaciones(i) = std(ranks_matrix(:,i));
%     promedios(i) = fix(decimales*mean(ranks_normalized(:,i)))/decimales;
%     desviaciones(i) = fix(decimales*std(ranks_normalized(:,i)))/decimales;
%     maximos(i) = fix(decimales*max(ranks_normalized(:,i)))/decimales;
% end

