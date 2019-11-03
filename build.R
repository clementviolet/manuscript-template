install.packages(c("knitr", "rmarkdown"))

rmarkdown::render("manuscript.Rmd", output_format = rmarkdown::md_document(preserve_yaml = TRUE), output_file = "manuscript.md")