ffmpeg -i VID00081.MOV -acodec copy -vcodec libx264 -level 21 -refs 2 -b:v 2048k -threads 0 -s 1280x720 -r 29.97 web/afdaling-jonkoping.mp4

ffmpeg -i keulen-bonn.lossless.mp4 -acodec libvorbis -ac 2 -b:a 96k -b:v 2560k -s 1280x720 -r 29.97 -threads 0 keulen-bonn.webm

