function [ all_res ] = run_fun( det_str, con_num, thres )
% det_str: Edge detection operator
% con_num: Pixel connectivity
% thres: Minimum area of ER membrane in pixel number

% set the path
da_d = dir('../data/');
% traverse
all_res = {};
for i = 3:length(da_d)
    fu_fo = ['../data/', da_d(i).name, '/'];
    sa_fo = ['../processed_data/', da_d(i).name, '/', det_str, '_', num2str(con_num), '_', num2str(thres), '/'];
    
    % create the folder to save the result image
    mkdir(sa_fo);
    
    % sub folder
    fo_d = dir(fu_fo);
    res = [];
    for j = 3:length(fo_d)
        % read image
        fu_fi = [fu_fo, fo_d(j).name];
        img = imread(fu_fi);
        [clo_img, num, mea, med] = Connectivity_analysis(img, 1/160, thres, det_str, con_num);
        res(j-2, :) = [num, mea, med];
        % save image
        imwrite(clo_img, [sa_fo, 'clo_', fo_d(j).name]);
    end
    all_res{i-2, 1} = res;
end
end

