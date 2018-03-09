RSpec.describe NillyVanilly::Inspect, type: :model do
  it "returns array of models/columns" do
    expect(subject.results.first).to eq([true, "Post", "title"])
  end
end
