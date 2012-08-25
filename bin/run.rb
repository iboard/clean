# = RUN
# This runs the 'Application' and can be called by
#   `ruby bin/run.rb .....`
require File.expand_path('../../config/boot', __FILE__ )
app = Application.new(*ARGV)
app.run
