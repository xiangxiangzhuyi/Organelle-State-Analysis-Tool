function [ pre_img, u_num, u_mea, u_med] = Connectivity_analysis(img, pix_w, thres, con_num, pres_num, se_si)
% this function is the implement of connectivity analysis
% img: the image to be analysis, 2D or 3D are both OK
% thres: the threshold of the area to exclude the area with a too-small area
% pix_w: the width(?m) of the pixel
% det_str: Edge detection method, 'Sobel'/'Prewitt'/'Roberts'/'log'/'zerocross'/'Canny'
% con_num: Pixel connectivity, 4/8

% check the pixel space and resize the image
if pix_w ~= 1/160
    img = imresize(img, pix_w*160);
end

img = img(:,:,2);
% canny edge detection
edge_img = edge(img, 'Canny');

se = strel('disk', se_si, 0);
if pres_num == 0
    pre_img = edge_img;
elseif pres_num == 1
    pre_img = imdilate(edge_img,se);
elseif pres_num == 2
    pre_img = imclose(edge_img,se);
end

% connectivity analysis
lab_img = bwlabel(pre_img, con_num); % matlab function to label connected components 
% lab_img = label_components(clo_img, 8); % our function to label connected components 
[num, mea, med, pre_img]= analysis_labeling(lab_img, thres);

% indexes in unit
u_num = num*160*160/(size(img, 1) * size(img, 2)); % the number of connected components in one ?m^2 
u_mea = mea/(5*160); % the mean length(?m) of the edge
u_med = med/(5*160); % the median length(?m) of the edge
end





