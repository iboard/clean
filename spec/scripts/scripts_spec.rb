# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
# @since 25.08.12
#
require "rspec"

describe "Tests the implementation from within OS" do

  before(:all) do
    @executeable = File.expand_path("../../../bin/run.rb",__FILE__)
  end

  it "should run an application" do
    system("ruby", @executeable).should be_true
  end

  it "should list commands" do
    _x = system("ruby #{@executeable} commands > /tmp/should_list_commands")
    File.read("/tmp/should_list_commands").should =~ /ApplicationInfo/
    File.unlink("/tmp/should_list_commands")
  end

  it "should list loaded files" do
    _x = system("ruby #{@executeable} loaded > /tmp/should_list_commands")
    File.read("/tmp/should_list_commands").should =~ /Boot/
    File.unlink("/tmp/should_list_commands")
  end

  it "should run the example usecase" do
    _x = system("ruby #{@executeable} --command='ExampleUsecase,\"FirstParameter\"' > /tmp/should_list_commands")
    puts "X=#{_x.inspect}."
    File.read("/tmp/should_list_commands").should =~ /ExampleUsecase/
    File.read("/tmp/should_list_commands").should =~ /FirstParameter/
    File.unlink("/tmp/should_list_commands")
  end
end