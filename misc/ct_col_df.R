library(Seurat)
library(pals)

pal.bands(alphabet, alphabet2, cols25, glasbey, kelly, polychrome, 
          stepped, tol, watlington,
          show.names=FALSE)

# *sc_analysis/04-annotation/11-join_annotation.Rmd
# sc_obj <- "{anot_28}/{robj_dir}/annotated_se.rds" %>%
#   glue::glue() %>%
#   here::here() %>%
#   readRDS(file = .)


##################
##### EPID20 #####
##################
sc_obj <- "{anot_28}/{robj_dir}/harmony_se_annot.rds" %>%
  glue::glue() %>%
  here::here() %>%
  readRDS(file = .)

ct <- unique(sc_obj@meta.data[, "specific_annot_mod"])
col_df <- data.frame(
  "cell_type" = ct,
  "cell_type_mod" = stringr::str_replace_all(
    string = ct,
    pattern = "[[:punct:]]|[[:space:]]",
    replacement = "."),
  "ct_col" = as.character(pals::alphabet(n = length(ct))),
  stringsAsFactors = FALSE)

saveRDS(object = col_df,
        file = "misc/col_df2.rds")
