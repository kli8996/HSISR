# HISR-Spectral-Mixup-Heterogeneous-Datasets-PyTorch
arXiv link:  https://arxiv.org/abs/2101.07589

##Hyperspectral Image Super-Resolution with Spectral Mixup and Heterogeneous Datasets

Abstract: This  work  studies  Hyperspectral  image  (HSI)  super-resolution   (SR).   HSI   SR   is   characterized   by   high-dimensional data and a limited amount of training exam-ples.   This  exacerbates  the  undesirable  behaviors  of  neu-ral networks such as memorization and sensitivity to out-of-distribution samples.   This work addresses these issueswith three contributions. First, we propose a simple, yet ef-fective data augmentation routine, termed Spectral Mixup,to construct effective virtual training samples.  Second, weobserve that HSI SR and RGB image SR are correlated anddevelop a novel multi-tasking network to train them jointlyso that the auxiliary task RGB image SR can provide addi-tional supervision. Finally, we extend the network to a semi-supervised setting so that it can learn from datasets contain-ing low-resolution HSIs only. With these contributions, ourmethod is able to learn from heterogeneous datasets and liftthe requirement for having a large amount of HD HSI train-ing samples.  Extensive experiments on four datasets showthat our method outperforms existing methods significantlyand underpin the relevance of our contributions. 

###Result
