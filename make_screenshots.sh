#!/bin/sh
#
# Script to make screen shots from the PDF files.
#

THEMES="Antibes Berkeley Rochester"

createScreenshot() {
        # Extract a page from a pdf as a .png file
        # arguments: pdf-file-name page resolution (dpi)

        name=$1
        page=$2
        ppmResolution=$3
        pdfName=$name.pdf
        ppmName=$name-screenshot-$page.ppm
        pngName=$name-screenshot-$page.png

        pdftoppm -f $page -l $page -r $ppmResolution $pdfName > $ppmName
        convert $ppmName $pngName
        rm $ppmName
}

for theme in $THEMES; do
  if [ -d $theme ] ; then
    rm $theme/*
  else
    mkdir $theme
  fi
  make realclean
  make MY_THEME=$theme slides
  make MY_THEME=$theme handout
  createScreenshot vt-beamer-slides 1 150
  createScreenshot vt-beamer-slides 3 150
  createScreenshot vt-beamer-slides 4 150
  createScreenshot vt-beamer-slides 9 150
  createScreenshot vt-beamer-handout 1 300
  createScreenshot vt-beamer-handout 2 300
  mv *.png $theme
  mv *.pdf $theme
done

exit

