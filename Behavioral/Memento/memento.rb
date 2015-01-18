# The memento pattern is implemented with three objects:
# the originator, a caretaker and a memento.
class Originator
  # The class could also contain additional data that is not part of the
  # state saved in the memento..
  attr_accessor :state

  def set(state)
    puts "Originator: Setting state to #{state}"
    @state = state
  end

  def save_to_memento
    puts 'Originator: Saving to Memento'
    Memento.new(@state)
  end

  def restore_from_memento(memento)
    @state = memento.state
    puts "Originator: State after restoring from Memento: #{@state}"
  end

  # The Memento class
  class Memento
    attr_accessor :state

    def initialize(state)
      @state = state
    end
  end
end

# The Caretaker class
class CareTaker
  saved_states = []
  originator = Originator.new
  originator.set('State 1')
  originator.set('State 2')
  saved_states.push(originator.save_to_memento)
  originator.set('State 3')
  # We can request multiple mementos, and choose which one to roll back to.
  saved_states.push(originator.save_to_memento)
  originator.set('State 4')
  originator.restore_from_memento(saved_states.pop(1)[0])
end
