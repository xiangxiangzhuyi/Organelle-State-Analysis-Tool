# Organelle-State-Analysis-Tool

Introduction

.......




Install the tool

Please download the "mat_script" folder, and add the folder to your MATLAB path.


Use the tool
If you have read your image into the MATLAB workspace, you can implement the following command to calculate the unit connectivity of your image.
>> [clo_img, num, mea, med] = Connectivity_analysis(img, thres, pix_w);

To get the help of the function "Connectivity_analysis", please implement
>> help Connectivity_analysis

If you want to batch process your images, the following command is what you need.
>> all_res = batch_process(re_pa, sa_pa, thres, pix_w);

To get help, please implement
>> help batch_process

For more detailed information about our tool, please wait for our paper "....". 

If you use this tool in your article, please cite our paper in the following format

.....

