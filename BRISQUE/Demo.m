Original_image_dir  =    'E:/★★★★★神经网络模型★★★★★/IQA/BRISQUE/ABC_144_mask[5]/';
fpath = fullfile(Original_image_dir, '*.jpg');
im_dir  = dir(fpath);
im_num = length(im_dir);
NIQE = [];
for i = 1:im_num
    %% read clean image
    IMname = regexp(im_dir(i).name, '\.', 'split');
    IMname = IMname{1};
    im=imread(fullfile(Original_image_dir, im_dir(i).name));
        quality = brisquescore(im);
        %imDis is a RGB colorful image
    fprintf('%2.4f. \n', quality)
        NIQE = [NIQE quality];

end
mNIQE = mean(NIQE);
fprintf('The average brisque = %2.4f. \n', mNIQE);
%save E:/★★★★★神经网络模型★★★★★/Bovik_NIQE_SPL2013-master/real/NIQE_Real_BM3D.mat NIQE mNIQE
