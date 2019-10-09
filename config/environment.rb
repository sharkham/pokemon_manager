ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'rack-flash'
require 'open-uri'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

ActiveSupport::Inflector.inflections do |inflect|
  inflect.uncountable %w( pokemon )
  # inflect.uncountable [pokemon]
 end

require './app/controllers/application_controller'
require_all 'app'
