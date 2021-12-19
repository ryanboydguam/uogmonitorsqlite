web: bin/rails server -p ${PORT:-5000} -e $RAILS_ENV
schedular: bundle exec whenever --update-crontab && crond -l0 -f -d0