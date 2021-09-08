#!/bin/bash

images=()
swaylock_args=()

for output in $(swaymsg -t get_outputs | jq -r '.[] .name'); do
  image=$(mktemp --suffix=.png)
  images+=($image)
  swaylock_args+=(-i $output:$image)
  grim -o $output $image
done

for image in ${images[@]}; do
  corrupter -mag 2 -boffset 35 $image $image
done

swaylock ${swaylock_args[@]} -s center
rm ${images[@]}
