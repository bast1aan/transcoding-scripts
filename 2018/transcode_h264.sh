ffmpeg -i VID00081.MOV -acodec copy -vcodec libx264 -level 21 -refs 2 -b:v 2048k -threads 0 -s 1280x720 -r 29.97 web/afdaling-jonkoping.mp4

ffmpeg -i lund-universitetsbibliothek-stortorget.mp4 -acodec copy -vcodec libx264 -level 21 -refs 2 -b:v 4096k -threads 0 -s 1280x720 web/lund-universitetsbibliothek-stortorget-720p.mp4

