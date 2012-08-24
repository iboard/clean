# -*- encoding : utf-8 -*-

require File.expand_path('../application_loader', __FILE__)


# = Application
# The Application class handles the outer-application-loop and loading
# of ruby-files
# @author Andreas Altendorfer <andreas@altendorfer.at>
class Application

  include ApplicationLoader

  # Run the application's outer loop
  # @return [Integer]  0 on success -N on failures/fatal, +N on errors
  def run
    0
  end

end