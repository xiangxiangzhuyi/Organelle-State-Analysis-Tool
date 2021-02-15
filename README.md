# Organelle-State-Analysis-Tool

# Introduction

We developed a topological analytical tool able to indicate minor, stress-induced structural changes in ER without involving fluorescence intensity change and thus quantitatively identify ER stress prior to ER-phagy.

# System requirements
This tool was developed based on the MATLAB (Windows version). we tested the tool on the MATLAB R2016a. The tool doesn't need any required non-standard hardware.

# Installation guide
Please download all files and add the folder "mat_script_v3" to your MATLAB path. This operation can be completed in five seconds.

# Demo
There are three folders: "data", "mat_script_v3", "processed_data" in our tool.
1) "data" contains the images used in the demo. These images are divided into three categories by three subfolders: "EBSS-treat_mask", "TM-treated_mask", and "untreated_mask". Each subfolder contain 10 images.
2) "mat_script_v3" contains the code of the tool.
3) "processed_data" is the output folder of the our tool. The binary images obtained by our tool are stored in this folder. There are three corresponding subfolders in "processed_data" to store the binary images of the three categories： "EBSS-treat_mask", "TM-treated_mask", and "untreated_mask".

There are three hyperparameters in our tool: edge detection operator (Sobel/Prewitt/Roberts/Canny), pixel connectivity (4/8), and minimum area of ER membrane in pixel number (10/20/30/40/50). We have listed some options for the three hyperparameters. The three hyperparameters will produce 40 hyperparameter combinations. 

Our demo can be reproduced by directly running the following command:
>> Optimization

After the code runs, each hyperparameter combination will generate a set of binary images. Those binary images are stored in the folder "processed_data". Each hyperparameter combination will create a folder, such as "Sobel_4_30". In the workspace of the MATLAB, the connectivity density of each image in each hyperparameter combination can be accessed by the variable "all_res" which is a 2D matrix. In ""all_res"", the first dimension is the list of hyperparameter combinations and the second dimension is the list of images.

In our computer (Intel(R) Core(TM) i7-8550U CPU @ 1.80GHz 1.99 GHz, 16 GB RAM), this demo took nearly 5 hours to run.

# Instructions for use
If you want to change the hyperparameter option of our demo, you can set the three hyperparameters in the "Optimization.m" by your own idea. Then run the code by following our demo instruction.

In addition to processing the image data in the demo, you can also process your own images. you can implement the following command to calculate the connectivity density of your image.
>> [clo_img, num, mea, med] = Connectivity_analysis(img, pix_w, thres, det_str, con_num);

To get the help of the function "Connectivity_analysis", please implement
>> help Connectivity_analysis

If you want to batch process your images, the following command is what you need.
>> all_res = batch_process(re_pa, sa_pa, thres, pix_w);

To get help, please implement
>> help batch_process

For more detailed information about our tool, please wait for our paper "....". 

If you use this tool in your article, please cite our paper in the following format

.....

