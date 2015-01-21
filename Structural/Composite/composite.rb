# The Component class
class Graphic
  def print
  end
end

# The Composite class
class CompositeGraphic < Graphic
  attr_accessor :child_graphics

  def initialize
    @child_graphics = []
  end

  def print
    @child_graphics.each(&:print)
  end

  # Adds the graphic to the composition
  def add(graphic)
    @child_graphics.push(graphic)
  end

  # Removes the graphic from composition
  def remove(graphic)
    @child_graphics.delete(graphic)
  end
end

# The Leaf class
class Ellipse < Graphic
  def print
    puts 'Ellipse'
  end
end

# Initialize four ellipses
ellipse_1 = Ellipse.new
ellipse_2 = Ellipse.new
ellipse_3 = Ellipse.new
ellipse_4 = Ellipse.new

# Initialize three composite graphics
graphic = CompositeGraphic.new
graphic_1 = CompositeGraphic.new
graphic_2 = CompositeGraphic.new

# Composes the graphics
graphic_1.add(ellipse_1)
graphic_1.add(ellipse_2)
graphic_1.add(ellipse_3)

graphic_2.add(ellipse_4)

graphic.add(graphic_1)
graphic.add(graphic_2)

# Prints the complete graphic (four times the string 'Ellipse')
graphic.print
