function [  ] = resizeimg_fun( rescal )

% set the path
o_pa = 'E:/Others/evaluatation/Connectivity analysis tool/ER_addition_data/';
r_pa = 'E:/Others/evaluatation/Connectivity analysis tool/resize_ER_addition_data';

% traverse
pa_d = dir(o_pa);
for i = 3:length(pa_d)
    fo = pa_d(i).name;
    n_fo = [r_pa, '/', fo];
    mkdir(n_fo)
    
    % get the file list
    o_fo = [o_pa, fo];
    fo_d = dir(o_fo);
    for j = 3:length(fo_d)
        fi = fo_d(j).name;
        fo_fi = [o_fo, '/', fi];
        img = imread(fo_fi);
        img = imresize(img, rescal);
        n_fi = [n_fo, '/', fi];
        imwrite(img, n_fi,'tiff');
    end
end
end

