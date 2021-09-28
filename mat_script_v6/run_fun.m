function [ all_res ] = run_fun(ind, thres, pres_num, se_si)
% det_str: Edge detection operator
% con_num: Pixel connectivity
% thres: Minimum area of ER membrane in pixel number

% set the path
pa = '../Addition_data/';
da_d = dir(pa);
% traverse
all_res = {};
for i = 3:length(da_d)
    fu_fo = [pa, da_d(i).name, '/'];
    sa_fo = ['../Processed_addition_data/', da_d(i).name, '/', num2str(ind), '/'];
    
    % create the folder to save the result image
    mkdir(sa_fo);
    
    % sub folder
    fo_d = dir(fu_fo);
    res = [];
    for j = 3:length(fo_d)
        % read image
        fu_fi = [fu_fo, fo_d(j).name];
        img = imread(fu_fi);
        [clo_img, num, mea, med] = Connectivity_analysis(img, 1/160, thres, 4, pres_num, se_si);
        res(j-2, :) = [num, mea, med];
        % save image
        imwrite(clo_img, [sa_fo, 'clo_', fo_d(j).name]);
        
    end
    all_res{i-2, 1} = res;
end
end

