# -*- encoding : utf-8 -*-"
class ExampleUsecase  < UseCase

  def desc
    "ExampleUsecase - prints it's source and parameters --command=\"ExampleUsecase,'param1','param2'\""
  end

  def execute
    puts header
    system( "cat '#{__FILE__}' | sed 's/^/>  /'" )
    puts inspect_params
    0
  end


  protected
  def inspect_params
    puts "\n\nCalled with params: #{params.to_json}"
  end

  def header
    "\nUSECASE EXAMPLE\n" + "="*"usecase example".length + "\n#{__FILE__}\n\n"
  end

end