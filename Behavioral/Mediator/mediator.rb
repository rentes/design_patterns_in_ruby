# The Colleague class
class Colleague
  def send_message(_mediator, _message)
  end

  def receive_message(_message)
  end
end

# The Concrete Colleague class
class ConcreteColleague < Colleague
  attr_accessor :name

  def initialize(name)
    @name = (name)
  end

  def send_message(mediator, message)
    mediator.distribute_message(self, message)
  end

  def receive_message(message)
    puts "#{name} received #{message}"
  end
end

# The Mediator class
class Mediator
  def distribute_message(_sender, _message)
  end

  def register(_colleague)
  end
end

# The Concrete Mediator class
class ConcreteMediator < Mediator
  def initialize
    @colleague_list = []
  end

  def distribute_message(sender, message)
    @colleague_list.each do |colleague|
      colleague.receive_message(message) if colleague != sender
    end
  end

  def register(colleague)
    @colleague_list.push(colleague)
  end
end

# list of participants
colleague_a = ConcreteColleague.new('ColleagueA')
colleague_b = ConcreteColleague.new('ColleagueB')
colleague_c = ConcreteColleague.new('ColleagueC')
colleague_d = ConcreteColleague.new('ColleagueD')

# first mediator
mediator1 = ConcreteMediator.new
# participants register to the mediator
mediator1.register(colleague_a)
mediator1.register(colleague_b)
mediator1.register(colleague_c)
# participant A sends out a message
colleague_a.send_message(mediator1, 'MessageX from ColleagueA')

# second mediator
mediator2 = ConcreteMediator.new
# participants register to the mediator
mediator2.register(colleague_b)
mediator2.register(colleague_d)
# participant B sends out a message
colleague_b.send_message(mediator2, 'MessageY from ColleagueB')
