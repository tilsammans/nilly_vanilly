require 'spec_helper'

describe NillyVanilly::Inspect do
  it "returns array of models/columns" do
    subject.results.first.should == [true, "Post", "title"]
  end
end
