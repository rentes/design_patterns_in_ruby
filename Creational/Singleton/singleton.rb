require 'singleton'

class SimpleLogger
  include Singleton

  attr_accessor :level
  attr_accessor :log

  ERROR = 1
  WARNING = 2
  INFO = 3

  def initialize
    @log = Array.new
    @level = WARNING
  end

  def write_log(msg)
    @log.push(msg)
  end

  def error(msg)
    if @level >= ERROR
      write_log(msg)
    end
  end

  def warning(msg)
    if @level >= WARNING
      write_log(msg)
    end
  end

  def info(msg)
    if @level >= INFO
      write_log(msg)
    end
  end
end

logger = SimpleLogger.instance

puts "logger level is #{logger.level}"

SimpleLogger.instance.info('A sample INFO message')
SimpleLogger.instance.warning('A sample WARNING message')
SimpleLogger.instance.error('A sample ERROR message')

puts SimpleLogger.instance.log
