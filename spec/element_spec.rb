require_relative '../element.rb'

describe "Element" do
  let(:element) { Element.new("ajeng") }

  it "should be able to be initialized with a name" do
    expect(element.class.name).to eq("Element")
  end

  it "should have name" do
    expect(element.name).to eq("ajeng")
  end

  describe "priority" do
    it "should have priority 0 if not initialized" do
      expect(element.priority).to eq(0)
    end

    it "should have priority 1 if stated" do
      ajeng = Element.new("ajeng", 1)
      expect(ajeng.priority).to eq(1)
    end

    it "should have priority = 0 if initialized with other than 1" do
      ajeng = Element.new("ajeng", 2)
      expect(ajeng.priority).to eq(0)
    end
  end
end
