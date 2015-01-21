# Defines the functionality of Coffee implemented by decorator
class Coffee
  attr_accessor :cost, :ingredients

  def cost
  end

  def ingredients
  end
end

# Extension of a simple coffee without any extra ingredients
class SimpleCoffee < Coffee
  attr_accessor :cost, :ingredients

  def initialize
    @cost = 1.0
    @ingredients = 'Coffee'
  end

  def cost
    1
  end

  def ingredients
    'Coffee'
  end
end

# The following classes contain the decorators for all Coffee classes
# including the decorator classes themselves

# The Coffee Decorator class
class CoffeeDecorator < Coffee
  attr_accessor :decorated_coffee, :ingredient_separator

  def initialize(decorated_coffee)
    @decorated_coffee = decorated_coffee
    @ingredient_separator = ', '
  end

  def cost
    @decorated_coffee.cost
  end

  def ingredients
    @decorated_coffee.ingredients
  end
end

# Decorator Milk that mixes milk with coffee
class Milk < CoffeeDecorator
  def initialize(decorated_coffee)
    super(decorated_coffee)
  end

  def cost
    @decorated_coffee.cost + 0.5
  end

  def ingredients
    @decorated_coffee.ingredients + @ingredient_separator + 'Milk'
  end
end

# Decorator Whip that mixes whip with coffee
class Whip < CoffeeDecorator
  def initialize(decorated_coffee)
    super(decorated_coffee)
  end

  def cost
    @decorated_coffee.cost + 0.7
  end

  def ingredients
    @decorated_coffee.ingredients + @ingredient_separator + 'Whip'
  end
end

# Decorator Sprinkles that mixes sprinkles with coffee
class Sprinkles < CoffeeDecorator
  def initialize(decorated_coffee)
    super(decorated_coffee)
  end

  def cost
    @decorated_coffee.cost + 0.2
  end

  def ingredients
    @decorated_coffee.ingredients + @ingredient_separator + 'Sprinkles'
  end
end

c = SimpleCoffee.new
puts "Cost: #{c.cost}; Ingredients: #{c.ingredients}"

c = Milk.new(SimpleCoffee.new)
puts "Cost: #{c.cost}; Ingredients: #{c.ingredients}"

c = Sprinkles.new(Milk.new(SimpleCoffee.new))
puts "Cost: #{c.cost}; Ingredients: #{c.ingredients}"

c = Whip.new(Sprinkles.new(Milk.new(SimpleCoffee.new)))
puts "Cost: #{c.cost}; Ingredients: #{c.ingredients}"

# Note that you can also stack more than one decorator of the same type
c = Sprinkles.new(Whip.new(Sprinkles.new(Milk.new(SimpleCoffee.new))))
puts "Cost: #{c.cost}; Ingredients: #{c.ingredients}"
