class Element
  attr_accessor :name, :priority

  def initialize(name, priority = 0)
    @name = name
    @priority = priority == 1 ? 1 : 0
  end
end
