function [ label_img ] = label_components( img, nei_num)
% the function is used to label the isolated area in the binary image
% img: the binary image
% nei_num: 4/8
% image size


wid = size(img, 1);
hig = size(img, 2);
c_img = zeros(wid+2, hig+2);
c_img(2:end-1, 2:end-1) = img;
img = c_img;
wid = size(img, 1);
hig = size(img, 2);
% the first pass
label_img = zeros(wid, hig);
label_set = {};
label = 0;

for i = 2:wid-1
    for j = 2:hig-1
        % pixel value and the window around the pixel 
        v = img(i, j);
        nei_win = wind(label_img(i-1: i+1, j-1: j+1), nei_num);
        % check
        if v == 0
            continue;
        end
        if max(nei_win(:)) == 0
            % labeling
            label = label +1;
            label_img(i, j) = label;
            
            % add to the label set
            label_set{end+1, 1} = label;
        else
            labb = sort(unique(nei_win));
            if labb(1) == 0
                label_img(i, j) = labb(2);
            else
                label_img(i, j) = labb(1);
            end
            
            nei_win = wind(label_img(i-1: i+1, j-1: j+1), nei_num);
            uni_lab = sort(unique(nei_win));
            uni_lab(find(uni_lab == 0)) =[];
            
            % the connectivity among label sets
            ind = [];
            for la = 1:length(uni_lab)
                for k = 1:length(label_set)
                    if ismember(uni_lab(la), label_set{k})
                        ind(end+1) = k;
                    end
                end
            end
            % reset label sets
            old_set = {};
            new_set = [];
            for k = 1:length(label_set)
                if ismember(k, ind)
                   new_set = [new_set, label_set{k}];
                else
                   old_set{end+1, 1} = label_set{k};
                end
            end
            if ~isempty(new_set)
                old_set{end+1, 1} = new_set;
            end
            label_set = old_set;
            
        end
    end  
end

% the second pass

for i = 1:length(label_set)
    labs = label_set{i};
    for j = labs
        label_img(label_img == j) = min(labs);
    end
end
% convert
un_lab = sort(unique(label_img));
un_lab(find(un_lab == 0)) =[];
for i = 1:length(un_lab)
    label_img(label_img == un_lab(i)) = i;
end
label_img = label_img(2:end-1, 2:end-1);
end

function win = wind(win, num)
if num == 4
    mask = [0 1 0; 1 1 1; 0 1 0];
elseif num == 8
    mask = ones(3, 3);
end
win = win.*mask;
end


