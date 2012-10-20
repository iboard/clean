# -*- encoding : utf-8 -*-"
#
# = boot.rb
# require all files to load
require 'optparse'
require 'logger'
require 'json'


# Files to load ...
files = [
  File.expand_path('../../app/application_loader', __FILE__),
  File.expand_path('../../app/exceptions/options_error', __FILE__),
  File.expand_path('../../app/usecases/command_runner', __FILE__),
  File.expand_path('../../app/usecases/use_case', __FILE__),
  File.expand_path('../../app/usecases/application_info', __FILE__),
  File.expand_path('../../app/application', __FILE__),
]

# Merge all other files in
Dir.glob( File.join( File.expand_path('../../app/',__FILE__), '**/*rb' ) ).each do |file|
  files << file unless files.include?( file )
end

# Load the files
files.each do |file|
  require file
end
