# -*- encoding : utf-8 -*-"
#
# = boot.rb
# require all files to load
require 'optparse'
require 'logger'
require 'json'

require File.expand_path('../../app/application_loader', __FILE__)
require File.expand_path('../../app/exceptions/options_error', __FILE__)
require File.expand_path('../../app/commands/command_runner', __FILE__)
require File.expand_path('../../app/commands/base_command', __FILE__)
require File.expand_path('../../app/commands/application_debugger', __FILE__)
require File.expand_path('../../app/application', __FILE__)

