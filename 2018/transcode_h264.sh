ffmpeg -i VID00081.MOV -acodec copy -vcodec libx264 -level 21 -refs 2 -b:v 2048k -threads 0 -s 1280x720 -r 29.97 web/afdaling-jonkoping.mp4

ffmpeg -i lund-universitetsbibliothek-stortorget.mp4 -acodec copy -vcodec libx264 -level 21 -refs 2 -b:v 4096k -threads 0 -s 1280x720 web/lund-universitetsbibliothek-stortorget-720p.mp4

ffmpeg -i lund-universitetsbibliothek-stortorget.mp4 -acodec copy -vcodec libx264 -level 21 -refs 2 -b:v 1792k -threads 0 -s 853x480 web/lund-universitetsbibliothek-stortorget-480p.mp4

ffmpeg -i lund-universitetsbibliothek-stortorget.mp4 -acodec copy -vcodec libx264 -level 21 -refs 2 -b:v 1024k -threads 0 -s 640x360 web/lund-universitetsbibliothek-stortorget-360p.mp4
