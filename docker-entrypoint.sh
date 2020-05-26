#!/bin/sh
set -e


if [ "$1" = "gasExpress.py" ]; then
  mkdir -p "$OUTPUT_DIR"
  chmod 755 "$OUTPUT_DIR"
  chown -R $USER "$OUTPUT_DIR"
  cd "$OUTPUT_DIR"
  exec gosu $USER "$@"
fi

echo
exec "$@"
