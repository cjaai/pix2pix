#! /bin/sh

IN_DIR=facades
OUT_DIR=facades/val

CMD=`basename $0`
if [ $# -ne 1 ]; then
  echo "Usage: $CMD image_file" 1>&2
  exit 1
fi

srcfile=$1

base=`basename $1 .jpg`

#modify by ryou
#destdir="$OUT_DIR/${base}"

destdir="$OUT_DIR"


if [ ! -e $destdir ]; then mkdir $destdir ; fi

for c in `seq 0 16`
do
	for r in `seq 0 7`
	do
		cnum=`printf %02d $c`
		rnum=`printf %02d $r`
		# echo "$c $cnum $r $rnum"

		lux=`expr $c \* 64`
		luy=`expr $r \* 64`

		destfile="${base}_c${cnum}r${rnum}.jpg"

		echo "convert -crop 256x256+${lux}+${luy} $IN_DIR/$srcfile $destdir/$destfile"
		magick  $IN_DIR/$srcfile -crop 256x256+${lux}+${luy} $destdir/$destfile

	done
done


exit 
