#! /bin/sh

DIR=split

A_DIR="${DIR}/141717_0000298"

B_DIR="${DIR}/141717_0000298_mask"

OUT_DIR="${DIR}/141717_0000298_join"
if [ ! -e $OUT_DIR ]; then mkdir $OUT_DIR ; fi


for c in `seq 0 4`
do
	for r in `seq 0 1`
	do
		cnum=`printf %02d $c`
		rnum=`printf %02d $r`

		A_JPG="${A_DIR}/141717_0000298_c${cnum}r${rnum}.jpg"
		
		B_JPG="${B_DIR}/141717_0000298_mask_c${cnum}r${rnum}.jpg"
		
		OUT_JPG="${OUT_DIR}/141717_0000298_c${cnum}r${rnum}.jpg"
		
		magick $A_JPG $B_JPG -rotate 90 -background "rgb(0,0,255)" -gravity center -append -rotate -90 $OUT_JPG

	done
done


exit 
