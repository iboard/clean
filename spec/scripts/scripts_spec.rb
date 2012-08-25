# -*- encoding : utf-8 -*-"
#
# @author Andi Altendorfer <andreas@altendorfer.at>
# @since 25.08.12
#
require "rspec"

describe "Tests the implementation from within OS" do
  it "should runs an application" do
    system("ruby", File.expand_path("../../../bin/run.rb",__FILE__)).should be_true
  end
end