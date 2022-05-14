#!/usr/bin/env sh

ffmpeg  -f v4l2 -framerate 25 -video_size 640x480 -i /dev/video0 \
  -filter_complex "[0:v]split=2[v0][v1]; \
  [v1]tpad=start=50[r1]; \
  [v0][r1]hstack=inputs=2[outv]" \
  -map '[outv]' \
  output5.mkv
