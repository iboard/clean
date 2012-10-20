# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
# @since 25.08.12
#
require "rspec"
require File.expand_path('../../spec_helper', __FILE__)

describe UseCase do

  it "should raise an exception if abstract UseCase calls run" do
    expect { Application.new( '-q', '--command=UseCase,1' ).run }.to raise_error NotImplementedError
  end

  describe "Basic, abstract UseCase's derivations" do

    it "raises an exception if command not found => '-v', '--command=ApplicationInfo,\"unkown_command\"'" do
      expect { Application.new('-v', '--command=ApplicationInfo,"unkown_command"').run}.to raise_exception(OptionsError)
    end

    it "runs ApplicationInfo => '-q', '--command=ApplicationInfo,\"loaded_files\"'" do
      Application.new('-q', '--command=ApplicationInfo,"loaded_files"').run.should include( ['Boot', 'config/boot.rb'] )
    end

    it "runs ApplicationInfo => '-q', '--command=ApplicationInfo,\"available_commands\"'" do
      Application.new('-q', '--command=ApplicationInfo,"available_commands"').run.map{|c| c.class}.should include( ApplicationInfo, ExampleUsecase, UseCase )
    end

    it "lists description of UseCases" do
      UseCase.new().desc.should =~ /^Abstract UseCase - define\/overwrite method :execute/
    end

  end

end