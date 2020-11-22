ffmpeg -i paastreffen-2018-70km-rit-lossless.mp4 -acodec libopus -ac 2 -b:a 96k -b:v 8736k -s 1280x720 -threads 2 paastreffen-2018-70km-rit-720p-vp9-opus-8736kbps.webm

ffmpeg -i paastreffen-2018-70km-rit-lossless.mp4 -acodec libopus -ac 2 -b:a 96k -b:v 3500k -s 854x480 -threads 2 paastreffen-2018-70km-rit-480p-vp9-opus-3500kbps.webm
