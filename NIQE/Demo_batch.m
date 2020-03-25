load modelparameters.mat

blocksizerow    = 96;
blocksizecol    = 96;
blockrowoverlap = 0;
blockcoloverlap = 0;

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
        quality = computequality(im,blocksizerow,blocksizecol,blockrowoverlap,blockcoloverlap, ...
            mu_prisparam,cov_prisparam);
            %imDis is a RGB colorful image
        %fprintf('%2.4f. \n', quality)
            NIQE = [NIQE quality];
    end
    mNIQE = mean(NIQE);
    fprintf('The average NIQE = %2.4f. \n', mNIQE);
    xlswrite('NIQE',mNIQE,1,strcat('A',int2str(num)))
    num = num + 1;
    %csvwrite('SSEQ.csv',mNIQE)
    %save E:/★★★★★神经网络模型★★★★★/Bovik_NIQE_SPL2013-master/real/NIQE_Real_BM3D.mat NIQE mNIQE
end
