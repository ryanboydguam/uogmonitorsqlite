#!/bin/sh -e

case $1 in

  start)
    exec bin/rails s -b '0.0.0.0' -p '3000'
  ;;
  scheduler)
    bundle exec whenever --update-crontab 
    exec crond -l0 -f -d0
  ;;
  *)
    exec "$@"
  ;;

 
esac

exit 0