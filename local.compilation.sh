#!/bin/bash

repo=manuscript-template

# Bibliography part
pandoc-citeproc --bib2json references.bib > references.json
python .assets/scripts/bibliography.py

# Adding mandatory files
mkdir -p rendered
cp -r figures rendered/
cp references.json rendered/

# Create tex file
pandoc manuscript.md -s -o rendered/$repo.tex --filter pandoc-xnos --bibliography=references.json --metadata-file=metadata.json --template=.assets/templates/template.tex

# Create pdf file
cd rendered
latexmk ms_m2.tex -lualatex --file-line-error --interaction=nonstopmode

# Cleaning up
latexmk -c
rm -Rf figures references.json
cd ..
