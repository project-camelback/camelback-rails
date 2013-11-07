# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

WebAppRails::Application.load_tasks

task :environment do |cmd, args|
  require "./config/environment"
end

desc "Download flatiron-school assignments and add to db"
task :assignments => :environment do
  require "./lib/tasks/get_assignments"
  getter = GetAssignments.new
  getter.call
end

desc "Show homeworks_of [student_github_login]"
task :homeworks_of, [:student] => :environment do |t, args|
  require "./lib/tasks/student_homeworks"
  puts "Searching for #{args.student}..."
  query = StudentHomeworks.new(args.student)
  query.call
end