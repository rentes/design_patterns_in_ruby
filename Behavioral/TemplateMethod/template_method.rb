# Abstract Class
class AbstractClass
  def template_method
    puts 'Abstract Class template_method called'
    primitive_operation_1
    primitive_operation_2
  end

  def primitive_operation_1
  end

  def primitive_operation_2
  end
end

# A Concrete example number 1
class Concrete1 < AbstractClass
  def primitive_operation_1
    puts 'Concrete 1 primitive_operation_1 called'
  end

  def primitive_operation_2
    puts 'Concrete 1 primitive_operation_2 called'
  end
end

# A Concrete example number 2
class Concrete2 < AbstractClass
  def primitive_operation_1
    puts 'Concrete 2 primitive_operation_1 called'
  end

  def primitive_operation_2
    puts 'Concrete 2 primitive_operation_2 called'
  end
end

class1 = Concrete1.new
class2 = Concrete2.new

class1.template_method
class2.template_method
