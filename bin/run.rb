#!/usr/bin/env ruby
# = RUN
# This runs the 'Application' and can be called by
#   `ruby bin/run.rb .....`
require File.expand_path('../../config/boot', __FILE__ )
app = Application.new(*ARGV)
rc=app.run
p app unless rc.is_a?(Fixnum)
