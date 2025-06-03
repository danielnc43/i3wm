#!/bin/bash

# i3lock blurred screen inspired by /u/patopop007 and the blog post
# http://plankenau.com/blog/post-10/gaussianlock

# Dependencies:
# imagemagick
# i3lock-color
# scrot (optional but default)
xset +dpms
IMAGE=/tmp/i3lock.png
SCREENSHOT="scrot $IMAGE" # 0.46s

# Alternate screenshot method with imagemagick. NOTE: it is much slower
# SCREENSHOT="import -window root $IMAGE" # 1.35s

# Here are some imagemagick blur types
# Uncomment one to use, if you have multiple, the last one will be used

# All options are here: http://www.imagemagick.org/Usage/blur/#blur_args
#BLURTYPE="0x5" # 7.52s
#BLURTYPE="0x2" # 4.39s
#BLURTYPE="5x2" # 3.80s
#BLURTYPE="2x8" # 2.90s
#BLURTYPE="2x3" # 2.92s
BLURTYPE="5x4" # 2.92s

# Get the screenshot, add the blur and lock the screen with it
$SCREENSHOT
convert $IMAGE -blur $BLURTYPE $IMAGE

alpha='dd'
background='#282a36'
selection='#44475a'
comment='#6272a4'

yellow='#f1fa8c'
orange='#ffb86c'
red='#ff5555'
magenta='#ff79c6'
blue='#6272a4'
cyan='#8be9fd'
green='50fa7b'
lime='#d7ff00'

i3lock \
  --insidever-color=$selection$alpha \
  --insidewrong-color=$selection$alpha \
  --inside-color=$selection$alpha \
  --ringver-color=$green$alpha \
  --ringwrong-color=$red$alpha \
  --ringver-color=$lime$alpha \
  --ringwrong-color=$red$alpha \
  --ring-color=$blue$alpha \
  --line-uses-ring \
  --keyhl-color=$lime$alpha \
  --bshl-color=$orange$alpha \
  --separator-color=$selection$alpha \
  --verif-color=$lime \
  --wrong-color=$red \
  --modif-color=$red \
  --layout-color=$blue \
  --date-color=$lime \
  --time-color=$lime \
  --screen 1 \
  --blur 1 \
  --clock \
  --indicator \
  --time-str="%H:%M:%S" \
  --date-str="%A %e %B %Y" \
  --verif-text="Verifying..." \
  --wrong-text="Wrong!" \
  --noinput="No Input" \
  --lock-text="Locking..." \
  --lockfailed="Lock Failed" \
  --radius=120 \
  --ring-width=10 \
  --pass-media-keys \
  --pass-screen-keys \
  --pass-volume-keys \
 --time-font="JetBrainsMono Nerd Font" \
 --date-font="JetBrainsMono Nerd Font" \
 --layout-font="JetBrainsMono Nerd Font" \
 --verif-font="JetBrainsMono Nerd Font" \
 --wrong-font="JetBrainsMono Nerd Font" \

# These last five lines are commented because they concern the font you want to use.
# JetBrainsMono Nerd Font is the font that was used in the screenshot.
# To specify a favorite font, just uncomment the five lines and replace the parameter with the font you prefer.

# Remove the temporary image
rm $IMAGE
