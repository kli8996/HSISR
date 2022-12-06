clear all

folder_dir = '/home/kexin/Data/DIV2K_valid_HR/';
img_names = dir(fullfile(folder_dir, '*.png'));

save_path = '/home/kexin/Data/DIV2KRGB/Valid_RGB2020_3channels_x4/'; 
factor = 0.25;
psize=512;
stride = 512;

for j = 1:numel(img_names)
   img_name = img_names(j).name;
   name = erase(img_name, ".png");
   disp(name)
   img = imread(fullfile(folder_dir, img_name));
   
   %img = imresize(single(img), 1/2);
   
   crop_image_RGB(img, psize, stride, factor, name, save_path)
end

        