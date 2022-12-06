function [out] = crop_image_RGB(img, patch_size, stride, factor, file_name, file_folder)

% Normalization for RGB
% channel_matrix = [1 0.66 0.34 0 0 0 0 0;
%                   0 0.34 0.76 1 0.75 0.5 0.25 0;
%                   0 0 0 0 0.25 0.5 0.75 1];
              
img = double(img)./255;
[H, W, C] = size(img);

% img = reshape(img, [H*W, C]);
% img = img * channel_matrix;
% img = reshape(img,[H, W, 8]);

p = patch_size;
pat_col_num = 1:stride:(H - p + 1);
pat_row_num = 1:stride:(W - p + 1);
total_num = length(pat_col_num) * length(pat_row_num);
index = 1;
%gt_all = zeros(p, p, C, total_num);
%ms_all = zeros(p*factor, p*factor, C, total_num);
%ms_bicubic_all = zeros(p, p, C, total_num);
% crop a single patch from whole image
for i=1:length(pat_col_num)
    for j = 1:length(pat_row_num)
        up = pat_col_num(i);
        down = up + p - 1;
        left = pat_row_num(j);
        right = left + p - 1;
        gt = img(up:down, left:right, :);
        ms = single(imresize(gt, factor));
        ms_bicubic = single(imresize(ms,1/factor));
        gt = single(gt);
        file_path = strcat(file_folder, file_name, '_', num2str(index), '.mat');
        save(file_path,'gt','ms','ms_bicubic','-v6');
        %pat_img = img(up:down, left:right, :);
        %gt_all(:,:,:, index) = reshape(pat_img, [p, p, C, 1]);
        %ms_pat_img = single(imresize(pat_img, factor));
        %ms_all(:,:,:, index) = reshape(ms_pat_img, [p*factor, p*factor, C, 1]);
        %ms_bicubic_all(:,:,:, index) = reshape(single(imresize(ms_pat_img, 1/factor)), [p, p, C, 1]);
        index = index + 1;
    end
end
%gt_all = single(gt_all);
%for k=1:9:total_num
%    gt = gt_all(:,:,:,k:k+8);
%    ms = ms_all(:,:,:,k:k+8);
%    ms_bicubic = ms_bicubic_all(:,:,:,k:k+8);
%    file_path = strcat(file_folder, file_name, '_', num2str(k), '.mat');
%    save(file_path,'gt','ms','ms_bicubic','-v6');
%end
out = total_num;
