ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

# Inflector.inflections do |inflect|
#   inflect.uncountable [pokemon]
#  end
#this method only works for rails

require './app/controllers/application_controller'
require_all 'app'
