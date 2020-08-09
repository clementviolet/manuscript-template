#!/bin/bash

repo=manuscript-template

# Bibliography part
pandoc-citeproc --bib2json references.bib > references.json
python .assets/scripts/bibliography.py

# Adding mandatory files
mkdir -p rendered
mkdir -p rendered/css
mkdir -p rendered/js
cp -r figures rendered/
mv references.json rendered/

# Create tex file
echo "TeX document"
pandoc manuscript.md -s -o rendered/$repo.tex --filter pandoc-xnos --bibliography=./rendered/references.json --csl=.assets/templates/ecology-letters.cls --metadata-file=metadata.json --template=.assets/templates/template.tex

# Create html file
echo "HTML document"
cp .assets/templates/{style.less,jquery.tocify.css,bootstrap.css} rendered/css/
cp .assets/templates/{jquery-1.8.3.min.js,jquery-ui-1.9.1.custom.min.js,jquery.tocify.min.js} rendered/js
pandoc manuscript.md  -o rendered/index.html --filter pandoc-xnos --template=.assets/templates/template.html --bibliography=./rendered/references.json --csl=.assets/templates/ecology-letters.cls --metadata-file=metadata.json --include-in-header=.assets/templates/tocify

# Create docx file
echo "MS Word document"
pandoc manuscript.md -s -o rendered/$repo.docx --toc --filter pandoc-xnos --bibliography=./rendered/references.json --csl=.assets/templates/ecology-letters.cls --metadata-file=metadata.json

# Create pdf file
echo "PDF Document"
latexmk $repo.tex -lualatex --file-line-error --interaction=nonstopmode
latexmk -c # Cleaning up
rm -Rf figures references.json
rm -f references.json
cd ..