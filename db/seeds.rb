# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ASSIGNMENTS_TO_RUN_RSPEC = [
'playlister-rb',
'003-School-Domain',
'structured-learning',
'rps-game-app',
'sinatra-rspec-intro-ruby-003',
'using-bundler-ruby-003',
'sinatra-students-ruby-003',
'sinatra-orm-halloween-ruby-003',
'ruby-003-unit-2',
'activerecord-tvland-ruby-003',
'the-big-todo-ruby-003',
'playlister-rails'
]

Assignment.all.each do |assignment|
  if ASSIGNMENTS_TO_RUN_RSPEC.include? assignment.name 
    assignment.spec_present = true
    assignment.save
  end
end