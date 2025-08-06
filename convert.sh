#!/data/data/com.termux/files/usr/bin/bash

mkdir -p /sdcard/Movies/HighS_480p

for file in /sdcard/Download/HighS/*; do
  filename=$(basename "$file")
  output="/sdcard/Movies/HighS_480p/$filename"

  if [ -f "$output" ]; then
    echo "Skipping already converted: $filename"
    continue
  fi

  echo "Converting (480p): $filename"
  ffmpeg -i "$file" \
    -vf "scale=854:480,setdar=16/9" \
    -c:v libx264 -preset ultrafast -crf 26 \
    -c:a aac -b:a 128k \
    "$output"
donedone
