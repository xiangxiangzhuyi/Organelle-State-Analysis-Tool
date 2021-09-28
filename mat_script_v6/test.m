% clean up the work space
clc;
clear;

% set the three hyperparameters
det_str_li = {'Canny'};  % Edge detection operator:Sobel/Prewitt/Roberts/Canny
con_num_li = [4]; % Pixel connectivity: 4/8
thres_li = [50]; % Minimum area of ER membrane in pixel number: 10/20/30/40/50
res = run_fun('Canny', 4, 20);














