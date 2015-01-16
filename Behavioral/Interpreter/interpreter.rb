# The context class
class Context
  attr_accessor :input
  attr_accessor :output

  def initialize(roman_integer)
    @input = String.new(roman_integer)
    @output = 0
  end
end

# The Expression class
class Expression
  def interpret(context)
    input = context.input
    return if input.length == 0
    interpret_nine(context) if input.start_with?(nine)
    interpret_four(context) if input.start_with?(four)
    interpret_five(context) if input.start_with?(five)
    interpret_one(context)
  end

  def interpret_nine(context)
    context.output = (context.output + (9 * multiplier))
    context.input = (context.input.slice(2..-1))
  end

  def interpret_four(context)
    context.output = (context.output + (4 * multiplier))
    context.input = (context.input.slice(2..-1))
  end

  def interpret_five(context)
    context.output = (context.output + (5 * multiplier))
    context.input = (context.input.slice(1..-1))
  end

  def interpret_one(context)
    while context.input.start_with?(one)
      context.output = (context.output + (1 * multiplier))
      context.input = (context.input.slice(1..-1))
    end
  end

  def one
  end

  def four
  end

  def five
  end

  def nine
  end

  def multiplier
  end
end

# Class for Thousand Units
class ThousandExpression < Expression
  def one
    'M'
  end

  def four
    ' '
  end

  def five
    ' '
  end

  def nine
    ' '
  end

  def multiplier
    1000
  end
end

# Class for Hundred Units
class HundredExpression < Expression
  def one
    'C'
  end

  def four
    'CD'
  end

  def five
    'D'
  end

  def nine
    'CM'
  end

  def multiplier
    100
  end
end

# Class for Dozens Units
class DozenExpression < Expression
  def one
    'X'
  end

  def four
    'XL'
  end

  def five
    'L'
  end

  def nine
    'XC'
  end

  def multiplier
    10
  end
end

# Class for Units
class OneExpression < Expression
  def one
    'I'
  end

  def four
    'IV'
  end

  def five
    'V'
  end

  def nine
    'IX'
  end

  def multiplier
    1
  end
end

roman = 'MCMXXVIII'
context = Context.new(roman)
tree = []
tree.push(ThousandExpression.new)
tree.push(HundredExpression.new)
tree.push(DozenExpression.new)
tree.push(OneExpression.new)

tree.each do |expression|
  expression.interpret(context)
end

puts "#{roman} = #{context.output}"
