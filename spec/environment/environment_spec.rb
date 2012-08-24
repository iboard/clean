require File.expand_path( '../../spec_helper',__FILE__)

describe "Test Environment" do

  it "runs rspec tests" do
    true.should be_true
    false.should_not be_true
  end
  
end
