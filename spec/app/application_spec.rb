require File.expand_path('../../spec_helper', __FILE__)

describe Application do

  before(:all) do
    @app = Application.new
  end

  it "returns 0 on success" do
    @app.run.should == 0
  end

  it "loads ruby file" do
    @app.loaded_ruby_files.should include( ["Boot", "config/boot.rb"] )
    @app.loaded_ruby_files.should include( ["Application", "app/application.rb"] )
    @app.loaded_ruby_files.should include( ["ApplicationLoader", "app/application_loader.rb"] )
  end

end