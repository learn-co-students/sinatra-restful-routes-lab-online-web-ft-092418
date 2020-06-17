ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

# Type `rake -T` on your command line to see the available rake tasks.

task :console do
  Pry.start
end

task :reset_db do
  puts "dropping database..."
  system("rm db/development.sqlite && rm db/test.sqlite && rm db/schema.rb")
  puts "migrating databases..."
  system("rake db:migrate && rake db:migrate SINATRA_ENV=test")
end
