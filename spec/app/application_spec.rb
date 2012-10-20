require File.expand_path('../../spec_helper', __FILE__)

describe Application do

  before(:all) do
    @app = Application.new
  end

  it "returns 0 on success => Application.new().run() == 0" do
    @app.run.should == 0
  end

  it "loads ruby files => config/boot.rb, app/*rb" do
    @app.loaded_ruby_files.should include( ["Boot", "config/boot.rb"] )
    @app.loaded_ruby_files.should include( ["Application", "app/application.rb"] )
    @app.loaded_ruby_files.should include( ["ApplicationLoader", "app/application_loader.rb"] )
  end

  it "initialize Logger => logger = @application.logger" do
    @app.logger.info("Hello Tests").should be_true
  end

  it "reports running app => @application = Application.application" do
    Application.application.should == @app
  end

  describe "Interpret options => bin/run.rb --help" do

    it "defaults log-level to WARN" do
      app = Application.new()
      app.logger.level.should == Logger::WARN
    end

    it "sets log-level to FATAL on --quiet, -q" do
      app = Application.new("-q")
      app.logger.level.should == Logger::FATAL
    end

    it "sets log-level to INFO on --verbose, -v" do
      app = Application.new("-v")
      app.logger.level.should == Logger::INFO
    end

    it "raises an exception if -v and -q is given at the same time" do
      expect { Application.new '-vq'  }.to raise_error OptionsError
    end

    it "lists available commands commands" do
      app = ApplicationInfo.new('available_commands')
      app.run.to_s.should =~ /ApplicationInfo/
    end
  end
end