ffmpeg -i tampere.mp4 -acodec copy -vcodec libx264 -level 21 -refs 2 -b:v 768k -threads 3 -s 640x360 -r 29.97 tampere-360p.mp4

ffmpeg -i tampere.mp4 -acodec libvorbis -ac 2 -b:a 96k -b:v 868k -s 640x360 -r 29.97 tampere-360p.webm


