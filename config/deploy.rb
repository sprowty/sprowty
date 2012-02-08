require 'bundler/capistrano'

load "config/deploy/settings.rb"

load "config/deploy/production.rb"

load "config/deploy/tasks.rb"

require './config/boot'

require './config/boot'
require 'airbrake/capistrano'
