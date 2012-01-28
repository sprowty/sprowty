require 'bundler/capistrano'

load "config/deploy/staging.rb"

load "config/deploy/settings.rb"

load "config/deploy/tasks.rb"

require './config/boot'

require './config/boot'
require 'airbrake/capistrano'
