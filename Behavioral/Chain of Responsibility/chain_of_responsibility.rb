# Logger Super class
class Logger
  ERR = 3
  NOTICE = 5
  DEBUG = 7
  @mask = nil
  @next_element = nil

  attr_writer :next_element

  def initialize(mask)
    @mask = mask
  end

  def message(message, priority)
    write_message(message) if priority <= @mask
    @next_element.message(message, priority) unless @next_element.nil?
  end
end

# Stdout logger class
class StdoutLogger < Logger
  def initialize(mask)
    super(mask)
  end

  def write_message(message)
    puts 'Sending to stdout: ' + message
  end
end

# Email logger class
class EmailLogger < Logger
  def initialize(mask)
    super(mask)
  end

  def write_message(message)
    puts 'Sending via e-mail: ' + message
  end
end

# Stderr logger class
class StderrLogger < Logger
  def initialize(mask)
    super(mask)
  end

  def write_message(message)
    puts 'Sending to stderr: ' + message
  end
end

# Build the chain of responsibility
class ChainOfResponsibility
  def create_chain
    logger = StdoutLogger.new(Logger::DEBUG)
    logger1 = EmailLogger.new(Logger::NOTICE)
    logger.next_element = (logger1)
    logger2 = StderrLogger.new(Logger::ERR)
    logger1.next_element = (logger2)
    logger
  end
end

chain = ChainOfResponsibility.new.create_chain
chain.message('Entering function y.', Logger::DEBUG)
chain.message('Step1 completed.', Logger::NOTICE)
chain.message('An error has occurred.', Logger::ERR)
