# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
# @since 25.08.12
#
class UseCase

  attr_reader :params

  # The abstract BaseCommand stores params in instance-var
  def initialize(*params)
    @params = *params
  end

  # Override this method in subclasses
  def run
    raise NotImplementedError.new('run is an abstract method in BaseCommand. Please override.')
  end
end