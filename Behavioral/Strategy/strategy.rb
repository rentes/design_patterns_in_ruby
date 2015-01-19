# The classes that implement a concrete strategy should implement this
# The Context class uses this to call the concrete strategy
class Strategy
  def execute(_a, _b)
  end
end

# Implements the algorithm using the strategy interface
# Class for adding numbers
class Add < Strategy
  def execute(a, b)
    puts 'Called Add\'s execute'
    a + b
  end
end

# Class for subtracting numbers
class Subtract < Strategy
  def execute(a, b)
    puts 'Called Substract\'s execute'
    a - b
  end
end

# Class for multiplying numbers
class Multiply < Strategy
  def execute(a, b)
    puts 'Called Multiply\'s execute'
    a * b
  end
end

# Configured with a Concrete Strategy object and maintains
# a reference to a Strategy object
class Context
  attr_accessor :strategy

  def initialize(strategy)
    @strategy = (strategy)
  end

  def execute_strategy(a, b)
    @strategy.execute(a, b)
  end
end

# Three contexts following different strategies
context = Context.new(Add.new)
result_a = context.execute_strategy(3, 4)

context = Context.new(Subtract.new)
result_b = context.execute_strategy(3, 4)

context = Context.new(Multiply.new)
result_c = context.execute_strategy(3, 4)

puts "Result A: #{result_a}"
puts "Result B: #{result_b}"
puts "Result C: #{result_c}"
