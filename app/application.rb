# -*- encoding : utf-8 -*-

require File.expand_path('../application_loader', __FILE__)
require File.expand_path('../../app/exceptions/options_error', __FILE__)
require 'logger'
require 'optparse'

# = Application
# The Application class handles the outer-application-loop and loading
# of ruby-files
# @author Andreas Altendorfer <andreas@altendorfer.at>
class Application

  include ApplicationLoader

  def initialize(*args)
    parse_options(*args)
    set_log_level
  end

  def options
    @options ||= {}
  end

  # Initialize on first call and then return Logger-object
  # @return [Logger]
  def logger
    @logger ||= Logger.new($stdout)
  end

  # Run the application's outer loop
  # @return [Integer]  0 on success -N on failures/fatal, +N on errors
  def run
    0
  end


  private
  def parse_options(*args)
    _opts = OptionParser.new(args) do |opts|
      opts.banner = "Usage: #{$0} [options]"

      opts.on("-q", "--quiet", "Log-level FATAL") do |v|
        options[:quiet] = v
      end

      opts.on("-v", "--verbose", "Log-level INFO") do |v|
        options[:verbose] = v
      end
    end
    _opts.parse!(args)
  end


  def set_log_level
    logger.level = options[:quiet] ? Logger::FATAL : Logger::WARN
    logger.level = Logger::INFO if options[:verbose]
    logger.info("Logger.level set to #{logger.level}")
    raise OptionsError.new("Option mismatch - you can't provide -v and -q at the same time") if options[:quiet] && options[:verbose]
  end

end