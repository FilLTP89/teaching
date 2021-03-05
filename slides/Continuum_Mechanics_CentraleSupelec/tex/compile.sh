#!/bin/bash
pdflatex $1.tex 
biber $1.bcf --validate_datamodel
pdflatex $1.tex
pdflatex $1.tex
