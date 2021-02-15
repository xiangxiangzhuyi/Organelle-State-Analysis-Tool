function [ all_res ] = batch_process( re_pa, sa_pa, thres, pix_w)
% process the batch of files, only support two-level folders
% re_pa: the folder contains subfolder where image files store
% sa_pa: the folder where edge image files sotre

da_d = dir(re_pa);
% traverse
all_res = struct;
for i = 3:length(da_d)
    fu_fo = [re_pa, '/', da_d(i).name, '/'];
    sa_fo = [sa_pa, '/', da_d(i).name, '/'];
    
    % sub folder
    fo_d = dir(fu_fo);
    res = struct;
    all_organelle_connectivity_density = 0;
    all_mean_edge_length = 0;
    all_median_edge_length = 0; 
    for j = 3:length(fo_d)
        % read image
        fu_fi = [fu_fo, fo_d(j).name];
        img = imread(fu_fi);
        [clo_img, num, mea, med] = Connectivity_analysis(img, thres, pix_w);
        % assign to the struct
        res(j-2).organelle_connectivity_density = num;
        res(j-2).mean_edge_length = mea;
        res(j-2).median_edge_length = med;
        
        % sum
        all_organelle_connectivity_density = all_organelle_connectivity_density + num;
        all_mean_edge_length = all_mean_edge_length + mea;
        all_median_edge_length = all_median_edge_length + med;
        
        % save image
        imwrite(clo_img, [sa_fo, 'clo_', fo_d(j).name]);
    end
    all_res(i-2).name = da_d(i).name;
    all_res(i-2).organelle_connectivity_density = all_organelle_connectivity_density/(length(fo_d) - 2);
    all_res(i-2).mean_edge_length = all_mean_edge_length/(length(fo_d) - 2);
    all_res(i-2).median_edge_length = all_median_edge_length/(length(fo_d) - 2);
    all_res(i-2).detail_result = res;
end
end


