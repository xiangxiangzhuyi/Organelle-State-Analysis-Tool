function [ pre_img, u_num, u_mea, u_med] = Connectivity_analysis(img, pix_w, thres, det_str, con_num)
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

% whether RGB image
if length(size(img)) == 3
    img = rgb2gray(img);
end
% canny edge detection
pre_img = edge(img, det_str);

% dilate
se = strel('disk', 2, 0);
pre_img = imdilate(pre_img,se);

% connectivity analysis
lab_img = bwlabel(pre_img, con_num); % matlab function to label connected components 
% lab_img = label_components(clo_img, 8); % our function to label connected components 
[num, mea, med, pre_img]= analysis_labeling(lab_img, thres);

% indexes in unit
u_num = num*160*160/(size(img, 1) * size(img, 2)); % the number of connected components in one ?m^2 
u_mea = mea/(5*160); % the mean length(?m) of the edge
u_med = med/(5*160); % the median length(?m) of the edge
end





