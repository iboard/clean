# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
#
# --command=ApplicationDebugger,'"loaded_files"'
#   will call .loaded_files(). Add new usecases to the 'private'-block of this class
class ApplicationInfo < UseCase

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

  def available_commands
    ApplicationLoader.loaded_ruby_files.map { |_class,_file|
      begin
        eval("#{_class}").new.is_a?(UseCase) ? _class + " (#{_file})" : nil
      rescue
        nil
      end
    }.compact.reject{|r| r == 'BaseCommand'}.sort
end

end