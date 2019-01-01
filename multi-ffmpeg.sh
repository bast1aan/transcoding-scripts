for i in `ls VID000??.MOV`; do
  ffmpeg -i $i -acodec copy -vcodec libx264 -level 21 -refs 2 -b:v 4096k -threads 0 -r 29.97 /run/media/bastiaan/movie_tmp/bastiaan/2016-02-26-noorwegen/3/`echo $i | cut -d'.' -f 1`.mp4
done;


