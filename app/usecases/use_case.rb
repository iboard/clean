# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
# @since 25.08.12
#
class UseCase

  attr_reader :params, :description

  # @return a (one-line) description for this UseCase
  def desc
    "Abstract UseCase - define/overwrite method :execute in concrete class"
  end

  # The abstract BaseCommand stores params in instance-var
  def initialize(*params)
    @params = *params
  end

  # call method execute on UseCases
  # @return [UseCase.execute]
  def run
    Application.logger.info "Executing #{self.class.to_s} (UseCase)"
    _r = execute
    Application.logger.info "Returned from #{self.class.to_s} => #{_r.inspect}"
    _r
  end

  protected
  # Override this method in subclasses
  def execute
    raise NotImplementedError.new('run is an abstract method in BaseCommand. Please override.')
  end

end