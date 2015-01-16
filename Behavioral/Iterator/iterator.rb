# The Array Iterator class
class ArrayIterator
  def initialize(array)
    @array = array
    @index = 0
  end

  # if there is a next element, return true. Otherwise, false
  def next?
    @index < @array.length
  end

  # returns the next element on the array
  def next_element
    index = @index
    increment_index
    @array[index]
  end

  def increment_index
    @index += 1
  end
end

# Two examples: one for an internal and the other for an external iterator
class Iterator
  attr_reader :array

  def initialize
    @array = %w(one two three)
  end

  def internal_example
    array.each do |element|
      puts "array element from internal iterator: #{element}"
    end
  end

  def external_example
    external_iter = ArrayIterator.new(@array)
    while external_iter.next?
      puts "array element from external iterator: #{external_iter.next_element}"
    end
  end
end

iterator = Iterator.new
iterator.internal_example
iterator.external_example
