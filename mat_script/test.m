% clean up the work space
clc;
clear;

% set the path
da_d = dir('../data/');

% traverse
all_res = {};
for i = 3:length(da_d)
    fu_fo = ['../data/', da_d(i).name, '/'];
    sa_fo = ['../processed_data/', da_d(i).name, '/'];
    
    % sub folder
    fo_d = dir(fu_fo);
    res = [];
    for j = 3:length(fo_d)
        % read image
        fu_fi = [fu_fo, fo_d(j).name];
        img = imread(fu_fi);
        [clo_img, num, mea, med] = Connectivity_analysis(img, 40, 1/160);
        res(j-2, :) = [num, mea, med];
        % save image
        imwrite(clo_img, [sa_fo, 'clo_', fo_d(j).name]);
    end
    all_res{i-2, 1} = res;
end






