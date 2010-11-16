#!/bin/sh
#
# Script to make screen shots from the PDF files.
#

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

createScreenshot vt-beamer-slides 1 150
createScreenshot vt-beamer-slides 3 150
createScreenshot vt-beamer-slides 4 150
createScreenshot vt-beamer-slides 9 150
createScreenshot vt-beamer-handout 1 300
createScreenshot vt-beamer-handout 2 300
