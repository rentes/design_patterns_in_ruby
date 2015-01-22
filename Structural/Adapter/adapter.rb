# Object Adapter Pattern

# The Client class
class Client
  attr_reader :target

  def initialize(target)
    @target = target
  end

  def make_request
    puts 'Client: calling the target\'s method A'
    @target.a
  end
end

# The Target class
class Target
  def a
  end
end

# The Adaptee class
class Adaptee
  def b
    puts 'Adaptee: method B called'
  end
end

# The Adapter class
class Adaptor < Target
  attr_reader :adaptee

  def initialize
    @adaptee = Adaptee.new
  end

  def a
    @adaptee.b
  end
end

adaptor = Adaptor.new
client = Client.new(adaptor)
client.make_request
