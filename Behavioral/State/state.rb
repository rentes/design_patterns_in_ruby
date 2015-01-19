# The State Like class
class StateLike
  def write_name(_context, _name)
  end
end

# The State Lower Case Class
class StateLowerCase < StateLike
  def write_name(context, name)
    puts name.downcase
    context.state(StateMultipleUpperCase.new)
  end
end

# The State Multiple Upper Case Class
class StateMultipleUpperCase < StateLike
  def initialize
    @count = 0
  end

  def write_name(context, name)
    puts name.upcase
    @count += 1
    context.state(StateLowerCase.new) if @count > 1
  end
end

# The State Context class
class StateContext
  attr_writer :state

  def initialize
    state(StateLowerCase.new)
  end

  def state(new_state)
    @state = (new_state)
  end

  def write_name(name)
    @state.write_name(self, name)
  end
end

sc = StateContext.new
sc.write_name('Monday')
sc.write_name('Tuesday')
sc.write_name('Wednesday')
sc.write_name('Thursday')
sc.write_name('Friday')
sc.write_name('Saturday')
sc.write_name('Sunday')
