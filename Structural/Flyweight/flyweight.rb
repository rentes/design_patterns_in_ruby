# The Flyweight class
class Lamp
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

# The Tree Branch class
class TreeBranch
  def initialize(branch_number)
    @branch_number = branch_number
  end

  def hang(lamp)
    puts "Hang #{lamp.color} lamp on branch #{@branch_number}"
  end
end

# The Flyweight Factory class
class LampFactory
  def initialize
    @lamps = {}
  end

  def find_lamp(color)
    if @lamps.key?(color)
      # if the lamp already exists, reference it instead of creating a new one
      lamp = @lamps[color]
    else
      lamp = Lamp.new(color)
      @lamps[color] = lamp
    end
    lamp
  end

  def total_number_of_lamps_made
    @lamps.size
  end
end

# The Christmas Tree class
class ChristmasTree
  attr_reader :lamp_factory

  def initialize
    @lamp_factory = LampFactory.new
    @lamps_hung = 0
  end

  def hang_lamp(color, branch_number)
    TreeBranch.new(branch_number).hang(@lamp_factory.find_lamp(color))
    @lamps_hung += 1
  end
end

christmas_tree = ChristmasTree.new
christmas_tree.hang_lamp('red', 1)
christmas_tree.hang_lamp('blue', 1)
christmas_tree.hang_lamp('yellow', 1)
christmas_tree.hang_lamp('red', 2)
christmas_tree.hang_lamp('blue', 2)
christmas_tree.hang_lamp('yellow', 2)
christmas_tree.hang_lamp('red', 3)
christmas_tree.hang_lamp('blue', 3)
christmas_tree.hang_lamp('yellow', 3)
christmas_tree.hang_lamp('red', 4)
christmas_tree.hang_lamp('blue', 4)
christmas_tree.hang_lamp('yellow', 4)
christmas_tree.hang_lamp('red', 5)
christmas_tree.hang_lamp('blue', 5)
christmas_tree.hang_lamp('yellow', 5)
christmas_tree.hang_lamp('red', 6)
christmas_tree.hang_lamp('blue', 6)
christmas_tree.hang_lamp('yellow', 6)
christmas_tree.hang_lamp('red', 7)
christmas_tree.hang_lamp('blue', 7)
christmas_tree.hang_lamp('yellow', 7)
puts "Made #{christmas_tree.lamp_factory.total_number_of_lamps_made} " \
  'total lamps'
