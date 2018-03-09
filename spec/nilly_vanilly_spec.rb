RSpec.describe NillyVanilly, type: :model do
  describe "model with one column" do
    it "stores class methods" do
      expect(Post.nillify_attributes).to eq [:title]
    end

    it "stores nil for empty string" do
      post = Post.create! :title => ""
      expect(post.title).to be_nil
    end
  end

  describe "model with two columns" do
    it "stores class methods" do
      expect(Comment.nillify_attributes).to eq [:author, :author_email]
    end
  end
end
