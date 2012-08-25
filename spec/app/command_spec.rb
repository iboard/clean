# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
# @since 25.08.12
#
require "rspec"
require File.expand_path('../../spec_helper', __FILE__)

describe BaseCommand do

  it "should raises an exception if abstract BaseCommand calls run" do
    expect { Application.new( '-q', '--command=BaseCommand,1' ).run }.to raise_error NotImplementedError
  end

  describe "BaseCommands's derivations" do

    it "runs DebugApplication" do
      Application.new('-q', '--command=ApplicationDebugger,"loaded_files"').run.should include( ['Boot', 'config/boot.rb'] )
    end

    it "raises an exception if Debugger-command not found" do
      expect { Application.new('-v', '--command=ApplicationDebugger,"unkown_command"').run}.to raise_exception(OptionsError)
    end

  end

end