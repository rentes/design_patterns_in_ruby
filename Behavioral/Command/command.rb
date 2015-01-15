class Command
  # The command interface
  def execute
  end
end

class Switch
  # The invoker class
  def initialize
    @history = Array.new
  end

  def store_and_execute (command)
    command.execute
    @history.push(command)
  end
end

class Light
  # The receiver class
  def turn_on
    puts 'The light is on'
  end

  def turn_off
    puts 'The light is off'
  end
end

class Flip_Up_Command < Command
  def initialize (the_light)
    the_light.turn_on
  end
end

class Flip_Down_Command < Command
  def initialize (the_light)
    the_light.turn_off
  end
end

class Press_Switch
  # The client class
  def initialize
    @lamp = Light.new
    @switch_up = Flip_Up_Command.new(@lamp)
    @switch_down = Flip_Down_Command.new(@lamp)
    @switch = Switch.new
  end

  def switch (command)
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

press_switch = Press_Switch.new
puts 'Switch ON test.'
press_switch.switch('ON')
puts 'Switch OFF test.'
press_switch.switch('OFF')
puts 'Invalid Command test.'
press_switch.switch('****')
