require_relative '../queue.rb'

describe "CustomQueue" do
  let(:q) { CustomQueue.new(4) }
  let(:ordinary1) { Element.new("ajeng") }
  let(:priority1) { Element.new("harry", 1) }
  let(:ordinary2) { Element.new("ron") }
  let(:priority2) { Element.new("hermione", 1) }

  it "should be able to be initialized with a size" do
    expect(q.class.name).to eq("CustomQueue")
  end

  it "should have size" do
    expect(q.size).to eq(4)
  end

  it "should have elements" do
    expect(q.elements).to eq([])
  end

  it "should show the size and the elements of the Queue when printed" do
    expect(q.to_s).to eq("size: 4, elements: []")
  end

  describe "enqueue" do
    context "with normal state" do
      it "should be able to add new element with enqueue method" do
        q.enqueue(ordinary1)
        q.enqueue(priority1)
        expect(q.to_s).to eq("size: 4, elements: [ajeng, harry]")
      end
    end

    context "with overflow state" do
      it "should not be able to add new element with enqueue method" do
        q.enqueue(ordinary1)
        q.enqueue(priority1)
        q.enqueue(ordinary2)
        q.enqueue(priority2)
        expect(q.enqueue(5)).to eq("queue overflow, can't add new element")
      end
    end
  end

  describe "dequeue" do
    context "with normal state" do
      before :each do
        q.enqueue(ordinary1)
        q.enqueue(priority1)
        q.enqueue(ordinary2)
        q.enqueue(priority2)
      end

      it "should be able to remove a priority element with dequeue method" do
        expect(q.dequeue).to eq(priority1)
      end

      it "should be able to remove an ordinary element with dequeue method" do
        q.dequeue
        q.dequeue
        expect(q.dequeue).to eq(ordinary1)
      end

      it "should be able to remove an element with dequeue method" do
        q.dequeue
        expect(q.to_s).to eq("size: 4, elements: [ajeng, ron, hermione]")
      end
    end

    context "with underflow state" do
      it "should not be able to remove any element with dequeue method" do
        expect(q.dequeue).to eq("queue underflow, can't remove any element")
      end
    end
  end

  describe "head" do
    before :each do
      q.enqueue(ordinary1)
      q.enqueue(priority1)
      q.enqueue(ordinary2)
      q.enqueue(priority2)
    end

    it "should be able to look up the head element" do
      expect(q.head).to eq(ordinary1)
    end

    it "should be able to look up the head element without removing it from the queue" do
      q.head
      expect(q.to_s).to eq("size: 4, elements: [ajeng, harry, ron, hermione]")
    end
  end

  describe "tail" do
    before :each do
      q.enqueue(ordinary1)
      q.enqueue(priority1)
      q.enqueue(ordinary2)
      q.enqueue(priority2)
    end

    it "should be able to look up the tail element" do
      expect(q.tail).to eq(priority2)
    end

    it "should be able to look up the tail element without removing it from the queue" do
      q.tail
      expect(q.to_s).to eq("size: 4, elements: [ajeng, harry, ron, hermione]")
    end
  end
end
