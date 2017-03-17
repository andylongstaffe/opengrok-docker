SRC=/Users/andrewlongstaffe/opengrok/src
find $SRC -type d -depth 1 -exec git --git-dir={}/.git --work-tree={} pull origin master \;
