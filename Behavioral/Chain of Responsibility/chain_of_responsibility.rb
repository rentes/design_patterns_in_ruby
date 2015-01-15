class Logger
  ERR = 3
  NOTICE = 5
  DEBUG = 7
  @mask
  @next_element

  def initialize (mask)
    @mask = mask
  end

  def set_next (log)
    @next_element = log
  end

  def message(message, priority)
    if priority <= @mask
      write_message(message)
    end
    if @next_element != nil
      @next_element.message(message, priority)
    end
  end
end

class Stdout_Logger < Logger
  def initialize(mask)
    super(mask)
  end

  def write_message(message)
    puts 'Sending to stdout: ' + message
  end
end

class Email_Logger < Logger
  def initialize(mask)
    super(mask)
  end

  def write_message(message)
    puts 'Sending via e-mail: ' + message
  end
end

class Stderr_Logger < Logger
  def initialize(mask)
    super(mask)
  end

  def write_message(message)
    puts 'Sending to stderr: ' + message
  end
end

class Chain_of_Responsibility
  # Build the chain of responsibility
  def create_chain
    logger = Stdout_Logger.new(Logger::DEBUG)
    logger1 = Email_Logger.new(Logger::NOTICE)
    logger.set_next(logger1)
    logger2 = Stderr_Logger.new(Logger::ERR)
    logger1.set_next(logger2)
    logger
  end
end

chain = Chain_of_Responsibility.new.create_chain
chain.message('Entering function y.', Logger::DEBUG)
chain.message('Step1 completed.', Logger::NOTICE)
chain.message('An error has occurred.', Logger::ERR)
