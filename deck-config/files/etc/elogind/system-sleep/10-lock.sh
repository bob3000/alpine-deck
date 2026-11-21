#!/bin/sh
# elogind calls hook with: $1 = pre|post, $2 = suspend|hibernate
if [ "$1" = pre ]; then
  pgrep -x swaylock >/dev/null || /usr/bin/swaylock -d
fi
exit 0
