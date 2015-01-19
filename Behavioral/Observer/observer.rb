# The Abstract Subject class
class AbstractSubject
  def register(_listener)
  end

  def unregister(_listener)
  end

  def notify_listeners(_event)
  end
end

# The Listener class
class Listener
  attr_writer :name

  def initialize(name, subject)
    @name = (name)
    subject.register(self)
  end

  def notify(event)
    puts "#{@name} received event #{event}"
  end
end

# The Subject class
class Subject < AbstractSubject
  def initialize
    @listeners = []
  end

  def user_action
    puts 'Enter something to do: '
    gets
  end

  # Implement abstract Class Abstract Subject
  def register(listener)
    @listeners.push(listener)
  end

  def unregister(listener)
    @listeners.delete(listener)
  end

  def notify_listeners(event)
    @listeners.each do |listener|
      listener.notify(event)
    end
  end
end

# make a subject object to spy on
subject = Subject.new

# register two listeners to monitor it
Listener.new('listener A', subject)
Listener.new('listener B', subject)

# simulated event
subject.notify_listeners('event 1')

# obtains event from user input
action = subject.user_action
subject.notify_listeners(action)
