# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
# @since 25.08.12
#
class CommandRunner

  # @param [Array] command - The arguments given after --command=command-name,arg1,arg2....
  def initialize(args)
    Application.logger.info("INITIALIZE CommandRunner.new(#{args.inspect})")
    @args = args
  end

  # Evals "command-name.new(arg1,arg2,....)"
  def run(&block)
    if @args
      @args = @args.split(",") if @args.class == String
      command = @args.first
      params = @args[1..-1]
      Application.logger.info("Evaluate >> #{command}.new(#{params.join(',')})")
      _command = eval( "#{command}.new(#{params.join(',')})")
      _rc = _command.run
      if block_given? && _rc.respond_to?(:each)
        _rc.each do |r|
          yield(r)
        end
      end
    end
  end

end