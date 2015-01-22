# The 'Implementor' class
class DrawingAPI
  def draw_circle(_x, _y, _radius)
  end
end

# The 'Concrete Implementor' class 1/2
class DrawingAPI1 < DrawingAPI
  def draw_circle(x, y, radius)
    puts "API1.circle at #{x.to_f}:#{y.to_f} radius #{radius.to_f}"
  end
end

# The 'Concrete Implementor' class 2/2
class DrawingAPI2 < DrawingAPI
  def draw_circle(x, y, radius)
    puts "API2.circle at #{x.to_f}:#{y.to_f} radius #{radius.to_f}"
  end
end

# The 'Abstraction' class
class Shape
  attr_reader :drawing_api

  def initialize(drawing_api)
    @drawing_api = drawing_api
  end

  # low-level
  def draw
  end

  # high-level
  def resize_by_percentage(_percentage)
  end
end

# The 'Refined Abstraction' class
class CircleShape < Shape
  attr_reader :x, :y, :radius

  def initialize(x, y, radius, drawing_api)
    super(drawing_api)
    @x = x
    @y = y
    @radius = radius
  end

  # low-level i.e. Implementation specific
  def draw
    @drawing_api.draw_circle(@x, @y, @radius)
  end

  # high-level i.e. Abstraction specific
  def resize_by_percentage(percentage)
    @radius *= percentage
  end
end

# The 'Client'
shapes = []
shapes.push(CircleShape.new(1, 2, 3, DrawingAPI1.new))
shapes.push(CircleShape.new(5, 7, 11, DrawingAPI2.new))
shapes.each do |shape|
  shape.resize_by_percentage(2.5)
  shape.draw
end
