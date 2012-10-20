# -*- encoding : utf-8 -*-

# = Application
# The Application class handles the outer-application-loop and loading
# of ruby-files
# @author Andreas Altendorfer <andreas@altendorfer.at>
class Application

  include ApplicationLoader

  # ::new Application with parameters.
  # * Parses options
  # * Sets log-level
  # @param [Array] args - will be parsed with OptionParser
  def initialize(*args)
    parse_options(*args)
    set_log_level
    @@application = self
  end

  # @return [Application] - the current running application object
  def self.application
    @@application
  end

  # @return Hash - the options-hash parsed at initializer
  def options
    @options ||= { args: [] }
  end

  # Initialize on first call and then return Logger-object
  # @return [Logger]
  def logger
    @@logger ||= Logger.new($stdout)
  end

  # @return Logger - The application-logger object
  def self.logger
    @@logger
  end

  # Run the application's outer loop
  # @return [Integer]  0 on success -N on failures/fatal, +N on errors
  def run
    _cmd = built_in_command( options[:args] )
    _cmd ||= options[:command] ? CommandRunner.new(options[:command]) : 0
    if _cmd.class == CommandRunner
      _cmd.run do |item|
        puts "%s:\n  %s\n\n" % [ item.class, item.desc ] if item.is_a?(UseCase)
      end
    else
      _cmd
    end
  end

  private
  def built_in_command _args
    if _args.any?
      _commands = _args.to_a
      _command = Array(_commands)[0]
      _param = case _command.to_sym
        when :loaded
          'loaded_files'
        when :commands
          'available_commands'
        else
          Application.logger.error "Command not found '#{_command}' ... try: --help"
          nil
      end
      CommandRunner.new("ApplicationInfo,'#{_param}'") if _param
    end
  end

  # @param [Array] args The arguments for running the application
  # @return Array - the parsed options
  def parse_options(*args)
    _opts = OptionParser.new(args) do |opts|

      opts.banner = <<-USAGE
        Usage:
          #{$0} [command|options]
        Commands:
          'commands' - list all available commands
          'loaded'   - list loaded modules/classes
        Options:
      USAGE
      opts.banner.gsub!(/^\s{6}/,"")

      opts.on("-q", "--quiet", "Log-level FATAL") do |v|
        options[:quiet] = v
      end

      opts.on("-v", "--verbose", "Log-level INFO") do |v|
        options[:verbose] = v
      end

      opts.on("-c", "--command param1,param2,param3", Array, "execute a command") do |list|
        options[:command] = list
      end

      ARGV.each do |arg|
        options[:args] += [arg]
      end

    end
    _opts.parse!(args)
  end

  # Called on initializer after parsing the arguments.
  # Loglevel is set according to options -v or -q
  def set_log_level
    logger.level = options[:quiet] ? Logger::FATAL : Logger::WARN
    logger.level = Logger::INFO if options[:verbose]
    logger.info("Logger.level set to #{logger.level}")
    raise OptionsError.new("Option mismatch - you can't provide -v and -q at the same time") if options[:quiet] && options[:verbose]
  end

end