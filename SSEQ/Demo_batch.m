Original_image_dir  =    'E:\outputs_177_N_1\';
num = 1;
for j = 341:399
    path = strcat(Original_image_dir,'00', int2str(j))
    fpath = fullfile(path, '*.jpg');
    im_dir  = dir(fpath);
    im_num = length(im_dir);
    NIQE = [];
    for i = 1:im_num
        %% read clean image
        IMname = regexp(im_dir(i).name, '\.', 'split');
        IMname = IMname{1};
        im=imread(fullfile(path, im_dir(i).name));
            quality = SSEQ(im);
            %imDis is a RGB colorful image
        %fprintf('%2.4f. \n', quality)
            NIQE = [NIQE quality];
    end
    mNIQE = mean(NIQE);
    fprintf('The average SSEQ = %2.4f. \n', mNIQE);
    xlswrite('SSEQ',mNIQE,1,strcat('A',int2str(num)))
    num = num + 1;
    %csvwrite('SSEQ.csv',mNIQE)
    %save E:/★★★★★神经网络模型★★★★★/Bovik_NIQE_SPL2013-master/real/NIQE_Real_BM3D.mat NIQE mNIQE
end
