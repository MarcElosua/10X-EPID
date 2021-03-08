# Dietary palmitic acid promotes a prometastatic epigenetic memory related to tumor-
associated Schwann cell activation

## Abstract
Metastasis is promoted by fatty acid (FA) uptake and metabolism 1-2 . How this works, or whether all dietary FAs are prometastatic, is not known. Here we show that dietary palmitic acid (PA), but not oleic acid (OA) or linoleic acid, promotes metastasis in oral carcinomas and melanoma, indicating specificity of action for distinct FAs. Strikingly, tumours acutely exposed to a PA–rich diet remain highly metastatic even when serially transplanted. This PA–induced prometastatic memory requires the FA transporter CD36 as well as the epigenetically stable deposition of histone H3 lysine 4 trimethylation by the methyltransferase Set1A/COMPASS. Bulk, single cell and positional RNA sequencing indicate that genes with this metastatic memory predominantly relate to a neural
signature that stimulates activation of intratumor Schwann cells and perineural invasion, two parameters strongly correlated with metastasis but etiologically poorly understood 3-4 . Mechanistically, tumour-associated Schwann cells secrete a specialized pro-regenerative extracellular matrix reminiscent of perineuronal nets, which when ablated strongly inhibits metastatic colonization. The induction of the epigenetic neural signature and its associated long-term boost in metastasis downstream of PA require the transcription factor EGR2 and the glial cell-stimulating peptide galanin. We provide evidence for a long-term epigenetic stimulation of metastasis by a dietary metabolite related to a pro-regenerative state of tumour-activated Schwann cells. In addition to underscoring the potential danger of eating large amounts of PA, our results reveal novel epigenetic and neural-related therapeutic strategies for metastasis.

## 10X Data Analysis - EPID
In this repository we analyze SC and ST data from mouse models with the aim of understanding how the stromal fraction of a tumor changes depending on the diet. In short, xenografts of human tumoural cells are implanted in mouse tongues. These mice are then administered one of: control diet, olive oil rich diet or palm oil rich diet. The diet is kept during 35 days and after the mice are sacrificed and the tumoural cells that have been developing are implanted in a new generation of mice. This new generation of mice is put on the control diet and what we want to observe is how the tumor evolves depending on the prior diet and *see if tumor cells have memory of past events*.

### Single-Cell analysis
In order to do so we carried out FACS sorted scRNAseq to select the stromal compartment of the tumor. We then sequenced and analyzed the data to characterize the populations present and the differential abundance between conditions. 

### Spatial-Transcriptomic analysis
In parallel, we also carried out Visium spatial transcriptomcs experiments to understand the spatial organization of these different tumors. We mainly focused on gene marker characterization in the tissue and the different compartments and we also mapped the single-cell signatures to the tissue to also quantify cell-type proportions in the different regions. 

# Software versions
All analysis were run using R 4.0.1 and Python 3.6.0
Main packages and versions used throughout all the analysis:
* [tidyverse 1.3.0](https://cran.r-project.org/web/packages/tidyverse/vignettes/paper.html)
* [cowplot 1.1.1](https://cran.r-project.org/web/packages/cowplot/index.html)
* [ggpubr 0.4.0](https://cran.r-project.org/web/packages/ggpubr/index.html)
* [NMF 0.23.0](https://cran.r-project.org/web/packages/NMF/index.html)
* [Seurat 4](https://satijalab.org/seurat/)
* [harmony 1.0](https://github.com/immunogenomics/harmony)
* [SPOTlight 0.1.5](https://github.com/MarcElosua/SPOTlight)
