# Covariance bandwidth estimation and banded testing

This repository provides the codes for the paper "Bandwidth Selection for High-Dimensional Covariance Matrix Estimation" by Yumou Qiu and Song Xi Chen.

- The fold **R code** provide the codes to estimate the optimal bandwidths for the banding and tapering estimators of covariance matrices. 

- Empirical data used in the paper are provided in the **Data** folder. 

- The R package **bandcov** uses c++ to optimize the computation. The source files, including documentation, c++ and R functions, are provided in the fold **R package files**.  

- This package also provides the code for testing banded structure of covariances, proposed in the paper "Test for Bandedness of High-dimensional Covariance Matrices and Bandwidth Estimation" by Yumou Qiu and Song Xi Chen.

- The installation file is provided in the **R package installation** folder. In R-studio, please use *install from package archive file* for the installation.
