#! /bin/sh
#
# download_data_and_convert.sh
# Copyright (C) 2023 Tong LI <tongli.bioinfo@proton.me>
#
# Distributed under terms of the MIT license.
#

mkdir -p input/CytAssist_FFPE_Human_Breast_Cancer
wget https://cf.10xgenomics.com/samples/spatial-exp/2.0.0/CytAssist_FFPE_Human_Breast_Cancer/CytAssist_FFPE_Human_Breast_Cancer_tissue_image.tif -O input/CytAssist_FFPE_Human_Breast_Cancer/tissue_image.tif
wget https://cf.10xgenomics.com/samples/spatial-exp/2.0.0/CytAssist_FFPE_Human_Breast_Cancer/CytAssist_FFPE_Human_Breast_Cancer_analysis.tar.gz -O input/CytAssist_FFPE_Human_Breast_Cancer/analysis.tar.gz
wget https://cf.10xgenomics.com/samples/spatial-exp/2.0.0/CytAssist_FFPE_Human_Breast_Cancer/CytAssist_FFPE_Human_Breast_Cancer_filtered_feature_bc_matrix.h5 -O input/CytAssist_FFPE_Human_Breast_Cancer/filtered_feature_bc_matrix.h5
wget https://cf.10xgenomics.com/samples/spatial-exp/2.0.0/CytAssist_FFPE_Human_Breast_Cancer/CytAssist_FFPE_Human_Breast_Cancer_spatial.tar.gz -O input/CytAssist_FFPE_Human_Breast_Cancer/spatial.tar.gz

tar -xzvf input/CytAssist_FFPE_Human_Breast_Cancer/analysis.tar.gz -C input/CytAssist_FFPE_Human_Breast_Cancer
tar -xzvf input/CytAssist_FFPE_Human_Breast_Cancer/spatial.tar.gz -C input/CytAssist_FFPE_Human_Breast_Cancer

nextflow run haniffalab/webatlas-pipeline -r dev \
      -params-file templates/examples/CytAssist_FFPE_Human_Breast_Cancer.yaml \
      -entry Full_pipeline
