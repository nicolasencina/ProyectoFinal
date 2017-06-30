function [output] = hist3d(subimage)
rows = length(subimage(:,1,1));
cols = length(subimage(1,:,1));

data = zeros(rows*cols, 3);

idx = 1;
for col=1:cols
    for row=1:rows
        H = subimage(row,col,1);
        S = subimage(row,col,2);
        V = subimage(row,col,3);
        data(idx, :) = [H, S, V]; 
        idx = idx + 1;  
    end
end
binsH = 8;
binsS = 12;
binsV = 3;

[output , ~, ~, ~] = histcn(data, (binsH-1) , (binsS-1), (binsV-1));



end