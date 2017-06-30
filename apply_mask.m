function [out] = apply_mask(image, mask)
out = image;
out(:,:,1) = image(:,:,1).*mask;
out(:,:,2) = image(:,:,2).*mask;
out(:,:,3) = image(:,:,3).*mask;
end