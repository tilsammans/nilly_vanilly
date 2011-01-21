require 'spec_helper'

describe NillyVanilly do
  describe "model with one column" do
    it "stores class methods" do
      Post.nillify_attributes.should == [:title]
    end

    it "stores nil for empty string" do
      post = Post.create! :title => ""
      post.title.should be_nil
    end
  end
  
  describe "model with two columns" do
    it "stores class methods" do
      Comment.nillify_attributes.should == [:author, :author_email]
    end
  end
end
