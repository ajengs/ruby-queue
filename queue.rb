require './element'

class CustomQueue
  attr_accessor :size, :elements

  def initialize(size)
    @size = size
    @elements = Array.new
  end

  def to_s
    "size: #{@size}, elements: [#{ @elements.map { |e| e.name }.join(', ') }]"
  end

  def enqueue(element)
    unless overflow?
      @elements.push(element)
    else
      "queue overflow, can't add new element"
    end
  end

  def dequeue
    unless underflow?
      out_index = @elements.index { |e| e.priority == 1 }
      out_index = out_index.nil? ? 0 : out_index
      @elements.delete_at(out_index)
    else
      "queue underflow, can't remove any element"
    end
  end

  def head
    @elements.first
  end

  def tail
    @elements.last
  end

  private
    def overflow?
      @elements.size >= @size
    end

    def underflow?
      @elements.empty?
    end
end
