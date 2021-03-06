# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
#tells cron tab your are in development
set :environment, ENV["RAILS_ENV"]

# Example:
#
 set :output, "log/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
every 1.minutes do
  # runner "AddressStatusCheckJob.perform_later()"
  rake "uog_monitor:ping_sites"
end
every 1.minutes do
   runner "DiscordBotJob.perform_now()"
 end