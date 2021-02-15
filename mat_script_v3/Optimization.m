% clean up the work space
clc;
clear;

% set the three hyperparameters
det_str_li = {'Sobel', 'Canny'};  % Edge detection operator:Sobel/Prewitt/Roberts/Canny
con_num_li = [4, 8]; % Pixel connectivity: 4/8
thres_li = [30]; % Minimum area of ER membrane in pixel number: 10/20/30/40/50

% hyperparameters combination
conf_li = {};
for i = 1:length(det_str_li)
    for j = 1:length(con_num_li)
        for k = 1:length(thres_li)
            ind = (i-1)*length(con_num_li)*length(thres_li) + (j-1)*length(thres_li) + k;
            conf_li(ind, :) = {ind, det_str_li{i}, con_num_li(j), thres_li(k)};
        end
    end
end

% parallel computing
all_res = [];
parfor i = 1:length(conf_li)
    res = run_fun(conf_li{i, 2}, conf_li{i, 3}, conf_li{i, 4});
    % together
    re_res = [];
    for j = 1:3
        den_li = res{j};
        den_li = den_li(:, 1);
        re_res = [re_res, den_li'];
    end
    all_res(i,:) = re_res;
    disp(i);
end














