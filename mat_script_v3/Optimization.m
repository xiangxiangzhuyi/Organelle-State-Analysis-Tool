    <one line to give the program's name and a brief idea of what it does.>
    Copyright (C) <year>  <name of author>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.


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














