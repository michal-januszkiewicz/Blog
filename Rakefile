# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :promote_user, [:user_id] => :environment do |t, args|
  User.find(args["user_id"]).update_attribute('admin', true)
end
