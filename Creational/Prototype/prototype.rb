# The Prototype class
class Prototype
  def clone
  end
end

# The Concrete Prototype 1 class
class ConcretePrototype1 < Prototype
  def clone
    ConcretePrototype1.new
  end

  def to_s
    'concrete prototype 1'
  end
end

# The Concrete Prototype 2 class
class ConcretePrototype2 < Prototype
  def clone
    ConcretePrototype2.new
  end

  def to_s
    'concrete prototype 2'
  end
end

# The Concrete Prototype 3 class
class ConcretePrototype3 < Prototype
  def clone
    ConcretePrototype3.new
  end

  def to_s
    'concrete prototype 3'
  end
end

# The Factory class which will give new cloned objects
class Factory
  attr_reader :prototypes

  def initialize
    @prototypes = { proto1: ConcretePrototype1.new,
                    proto2: ConcretePrototype2.new,
                    proto3: ConcretePrototype3.new }
  end

  def make_object(proto_name)
    new_prototype = @prototypes[proto_name].clone
    puts "New cloned object: #{new_prototype.object_id} (#{new_prototype})"
  end
end

factory = Factory.new
puts 'Original Hash of prototypes:'
puts "#{factory.prototypes.values}"
factory.make_object(:proto1)
factory.make_object(:proto2)
factory.make_object(:proto3)
