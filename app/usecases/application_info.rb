# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
#
# --command=ApplicationDebugger,'"loaded_files"'
#   will call .loaded_files(). Add new usecases to the 'private'-block of this class
class ApplicationInfo < UseCase

  def desc
    "--command='ApplicationInfo,\"loaded_files|available_commands\"'"
  end

  # Run the ApplicationDebugger
  # If first param is not known it raises an OptionError
  def execute
    begin
      self.send(params.first.to_sym)
    rescue NoMethodError, NameError
      raise OptionsError.new( "Debugger command #{params.first} not found." )
    end
  end

  protected
  def loaded_files
    ApplicationLoader.loaded_ruby_files
  end

  def available_commands
    ApplicationLoader.loaded_ruby_files.map { |_class,_file|
      begin
        _c = eval(_class).new
        _c.is_a?(UseCase) ? _c : nil
      rescue
        nil
      end
    }.compact.reject{|r| r == 'BaseCommand'}
  end

end