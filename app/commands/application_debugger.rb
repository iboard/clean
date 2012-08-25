# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
#
# --command=ApplicationDebugger,'"loaded_files"'
#   will call .loaded_files(). Add new commands to the 'private'-block of this class
class ApplicationDebugger < BaseCommand

  # Run the ApplicationDebugger
  # If first param is not known it raises an OptionError
  def run
    begin
      self.send(params.first.to_sym)
    rescue NoMethodError, NameError
      raise OptionsError.new( "Debugger command #{params.first} not found." )
    end
  end

  private
  def loaded_files
    ApplicationLoader.loaded_ruby_files
  end

end