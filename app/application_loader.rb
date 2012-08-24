# -*- encoding : utf-8 -*-"
#
# = Module ApplicationLoader
# Find files in SOURCE_PATHS and autoload camelized filename as modules.
# Class Application includes this module and so, loads all files without calling
# an extra method.
module ApplicationLoader

  # Defines paths from where to load ruby-files
  SOURCE_PATHS = %w(config app)

  # The application root path. Remove this from any path to reference relative filenames.
  ROOT_PATH = File.expand_path('../..', __FILE__)
  @loaded_files = []

  # @return [Array]- List of successfully loaded files
  def self.loaded_ruby_files
    @loaded_files
  end

  # Load ClassMethods to Application
  # Raises an exception if base is not the Application
  def self.included(base)
    raise "ApplicationLoader can be included in class Application only." unless base == Application
    base.send(:include, ClassMethods)
    SOURCE_PATHS.each do |root|
      search_and_autoload_files(File.expand_path("../../#{root}",__FILE__))
    end
  end

  # @param [String] root - where to start
  def self.search_and_autoload_files(root)
    Dir.new( root ).each do |file|
      path = File.join( root, file )
      unless file[0] == '.'
        if File.file?( path )
          load_file(path)
        # @todo enable when first subdirectory is defined
        # elsif File.directory?(path)
        #   search_and_autoload_files(path)
        end
      end
    end
  end

  # define Application-class methods here
  module ClassMethods
    # @return [Array] - An array of [Module, File-path] of loaded models (path is relative to ROOT_PATH)
    def loaded_ruby_files
      ::ApplicationLoader::loaded_ruby_files
    end
  end


  protected
  # @param [String] term convert some_thing_different => SomeThingDifferent
  def self.camelize_string(term)
    _first_char = term[0].upcase
    _string     = term[1..-1]
    _first_char + _string.gsub( /(_)([a-z])([a-z]*)/ ) { |args| args[1].upcase + args[2..-1] }
  end

  # @param [String] path
  def self.load_file(path)
    name = camelize_string( File.basename(path).gsub(/\.rb\Z/, '') )
    autoload name, path
    @loaded_files += [ [ name, path.gsub(/\A#{ROOT_PATH}/, '').gsub(/\A\//,'') ] ]
  end

end