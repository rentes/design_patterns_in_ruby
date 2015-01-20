# The Car Element Visitor class
class CarElementVisitor
  def visit(_visitor)
  end
end

# The Car Element class
class CarElement
  def accept(_visitor)
  end
end

# Class Wheel
class Wheel < CarElement
  attr_reader :name

  def initialize(name)
    @name = (name)
  end

  def accept(visitor)
    visitor.visit(self)
  end
end

# The Engine class
class Engine < CarElement
  def accept(visitor)
    visitor.visit(self)
  end
end

# The Body class
class Body < CarElement
  def accept(visitor)
    visitor.visit(self)
  end
end

# The Car class
class Car < CarElement
  attr_accessor :elements

  def initialize
    @elements = []
    @elements.push(Wheel.new('front left'))
    @elements.push(Wheel.new('front right'))
    @elements.push(Wheel.new('back left'))
    @elements.push(Wheel.new('back right'))
    @elements.push(Body.new)
    @elements.push(Engine.new)
  end

  def accept(visitor)
    @elements.each do |element|
      element.accept(visitor)
    end
    visitor.visit(self)
  end
end

# The Car Element Print Visitor
class CarElementPrintVisitor < CarElementVisitor
  def visit(component)
    if component.respond_to?('name')
      puts "Visiting #{component.class} #{component.name}"
    else
      puts "Visiting #{component.class}"
    end
  end
end

# The Car Element Do Visitor
class CarElementDoVisitor < CarElementVisitor
  def visit(component)
    if component.respond_to?('name')
      puts "Do another Visiting #{component.class} #{component.name}"
    else
      puts "Do another Visiting #{component.class}"
    end
  end
end

car = Car.new
car.accept(CarElementPrintVisitor.new)
car.accept(CarElementDoVisitor.new)
