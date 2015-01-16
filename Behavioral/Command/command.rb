# The command interface
class Command
  def execute
  end
end

# The invoker class
class Switch
  def initialize
    @history = []
  end

  def store_and_execute(command)
    command.execute
    @history.push(command)
  end
end

# The receiver class
class Light
  def turn_on
    puts 'The light is on'
  end

  def turn_off
    puts 'The light is off'
  end
end

# The class that encapsulates the light turn on
class FlipUpCommand < Command
  def initialize(the_light)
    the_light.turn_on
  end
end

# The class that encapsulates the light turn off
class FlipDownCommand < Command
  def initialize(the_light)
    the_light.turn_off
  end
end

# The client class
class PressSwitch
  def initialize
    @lamp = Light.new
    @switch_up = FlipUpCommand.new(@lamp)
    @switch_down = FlipDownCommand.new(@lamp)
    @switch = Switch.new
  end

  def switch(command)
    cmd = command.strip.upcase
    if cmd == 'ON'
      @switch.store_and_execute(@switch_up)
    elsif cmd == 'OFF'
      @switch.store_and_execute(@switch_down)
    else
      puts 'Argument \'ON\' of \'OFF\' is required.'
    end
  end
end

press_switch = PressSwitch.new
puts 'Switch ON test.'
press_switch.switch('ON')
puts 'Switch OFF test.'
press_switch.switch('OFF')
puts 'Invalid Command test.'
press_switch.switch('****')
