# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
# @since 25.08.12
#
class CommandRunner

  # @param [Array] command - The arguments given after --command=command-name,arg1,arg2....
  def initialize(command)
    Application.logger.info("INITIALIZE CommandRunner.new(#{command.inspect})")
    @command = command
  end

  # Evals "command-name.new(arg1,arg2,....)"
  def run
    command = @command.first
    _command = nil
    params = @command[1..-1]
    Application.logger.info("Evaluate >>#{command}.new(#{params.join(',')})<<")
    _command = eval( "#{command}.new(#{params.join(',')})")
    _command.run
  end
end