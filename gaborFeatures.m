function featureVector = gaborFeatures(img,gaborArray)

% GABORFEATURES extracts the Gabor features of an input image.
% It creates a column vector, consisting of the Gabor features of the input
% image. The feature vectors are normalized to zero mean and unit variance.
%
%
% Inputs:
%       img         :	Matrix of the input image 
%       gaborArray	:	Gabor filters bank created by the function gaborFilterBank
%       d1          :	The factor of downsampling along rows.
%       d2          :	The factor of downsampling along columns.
%               
% Output:
%       featureVector	:   A column vector with length (m*n*u*v)/(d1*d2). 
%                           This vector is the Gabor feature vector of an 
%                           m by n image. u is the number of scales and
%                           v is the number of orientations in 'gaborArray'.
%
%
% Sample use:
% 
% img = imread('cameraman.tif');
% gaborArray = gaborFilterBank(5,8,39,39);  % Generates the Gabor filter bank
% featureVector = gaborFeatures(img,gaborArray,4,4);   % Extracts Gabor feature vector, 'featureVector', from the image, 'img'.
% 
% 
% 
%   Details can be found in:
%   
%   M. Haghighat, S. Zonouz, M. Abdel-Mottaleb, "CloudID: Trustworthy 
%   cloud-based and cross-enterprise biometric identification," 
%   Expert Systems with Applications, vol. 42, no. 21, pp. 7905-7916, 2015.
% 
% 
% 
% (C)	Mohammad Haghighat, University of Miami
%       haghighat@ieee.org
%       PLEASE CITE THE ABOVE PAPER IF YOU USE THIS CODE.


if size(img,3) == 3     % Check if the input image is grayscale
    warning('The input RGB image is converted to grayscale!')
    img = rgb2gray(img);
end

img = double(img);


%% Filter the image using the Gabor filter bank

% Filter input image by each Gabor filter
[u,v] = size(gaborArray);
%gaborResult = cell(u,v);
resultados = zeros(u,v,2);
for i = 1:u
    for j = 1:v
        %gaborResult{i,j} = imfilter(img, gaborArray{i,j});
        result = abs(imfilter(img, gaborArray{i,j}));
        resultados(i,j,1) = mean(result(:));
        resultados(i,j,2) = std(result(:),1);
    end
end

featureVector = resultados;
end


