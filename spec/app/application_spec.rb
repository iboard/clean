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

  it "initialize Logger" do
    @app.logger.info("Hello Tests").should be_true
  end

  describe "Interpret options" do

    it "defaults log-level to WARN" do
      app = Application.new()
      app.logger.level.should == Logger::WARN
    end

    it "sets log-level to FATAL only on --quiet" do
      app = Application.new("-q")
      app.logger.level.should == Logger::FATAL
    end

    it "sets log-level to INFO on --verbose" do
      app = Application.new("-v")
      app.logger.level.should == Logger::INFO
    end

    it "raises an exception if -v and -q is given at the same time" do
      expect { Application.new '-vq'  }.to raise_error OptionsError
    end

  end
end