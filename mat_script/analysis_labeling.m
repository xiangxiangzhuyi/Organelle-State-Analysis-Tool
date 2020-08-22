function [ com_num, mean_area, median_area ] = analysis_labeling( lab_img, thres )
% analysis labeling image

for i = 1:max(lab_img(:))
    reg_img = lab_img;
    reg_img(reg_img ~= i) = 0;
    reg_img(reg_img == i) = 1;
    s = sum(reg_img(:));
    if s > thres
        area(i, 1) = s;
    end
end
com_num = size(area, 1);
mean_area = mean(area);
median_area = median(area);
end

