% clean up the work space
clc;
clear;

% set the three hyperparameters
thres_li = [40]; % Minimum area of ER membrane in pixel number: 10/20/30/40/50
pres_num_li = [1];
se_si_li = [2];
resi_li = [1];

% length
l1 = length(thres_li);
l2 = length(pres_num_li);
l3 = length(se_si_li);
l4 = length(resi_li);

% hyperparameters combination
c_li = {};
for i = 1:l1
    for j = 1:l2
        for k = 1:l3
            for m = 1:l4
                ind = (i-1)*l2*l3*l4 + (j-1)*l3*l4 + (k-1)*l4 + m;
                c_li(ind, :) = {ind, thres_li(i), pres_num_li(j), se_si_li(k), resi_li(m)};
            end
        end
    end
end

% parallel computing
all_res = [];
parfor i = 1:size(c_li,1)
    %resizeimg_fun(c_li{i, 5})
    res = run_fun(c_li{i, 1}, c_li{i, 2}, c_li{i, 3}, c_li{i, 4});
    % together
    re_res = [];
    for j = 1:2
        den_li = res{j};
        den_li = den_li(:, 1);
        re_res = [re_res, den_li'];
    end
    all_res(i,:) = re_res;
    disp(i);
end














