# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks
task :test do
  if Rails.env == "test"
    puts "--- Databdse cleaning ----"
    Rake::Task["db:reset"].execute
  end
end
