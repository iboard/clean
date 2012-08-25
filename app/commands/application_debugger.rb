# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
# @since 25.08.12
#
class ApplicationDebugger < BaseCommand

  # Run the ApplicationDebugger
  # If first param is not known it raises an OptionError
  def run
    case params.first
    when 'modules'
      ApplicationLoader.loaded_ruby_files
    else
      raise OptionsError.new( "Debugger command #{params.first} not found." )
    end
  end

end