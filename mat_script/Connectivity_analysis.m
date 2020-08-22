function [ clo_img, u_num, u_mea, u_med] = Connectivity_analysis(img, thres, pix_w)
% this function is the implement of connectivity analysis
% img: the image to be analysis, 2D or 3D are both OK
% thres: the threshold of the area to exclude the area with a too-small area
% pix_w: the width(?m) of the pixel

% check the pixel space and resize the image
if pix_w ~= 1/160
    img = imresize(img, pix_w*160);
end

% whether RGB image
if length(size(img)) == 3
    img = rgb2gray(img);
end
% canny edge detection
edg_img = edge(img, 'Canny');
% dilate
se = strel('disk', 4, 0);
dil_img = imdilate(edg_img,se);
% erode
se = strel('disk', 2, 0);
ero_img = imerode(dil_img, se);
% close
se = strel('disk', 3, 0);
clo_img = imclose(ero_img, se);

% connectivity analysis
lab_img = bwlabel(clo_img, 8); % matlab function to label connected components 
% lab_img = label_components(clo_img, 8); % our function to label connected components 
[num, mea, med]= analysis_labeling(lab_img, thres);

% indexes in unit
u_num = num*160*160/(size(img, 1) * size(img, 2)); % the number of connected components in one ?m^2 
u_mea = mea/(5*160); % the mean length(?m) of the edge
u_med = med/(5*160); % the median length(?m) of the edge
end





