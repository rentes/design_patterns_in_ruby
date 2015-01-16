require 'singleton'

# The SimpleLogger class that uses Singleton pattern
# The only instance is returned on the SimpleLogger.instance line below
class SimpleLogger
  include Singleton

  attr_accessor :level
  attr_accessor :log

  ERROR = 1
  WARNING = 2
  INFO = 3

  def initialize
    @log = []
    @level = WARNING
  end

  def write_log(msg)
    @log.push(msg)
  end

  def error(msg)
    write_log(msg) if @level >= ERROR
  end

  def warning(msg)
    write_log(msg) if @level >= WARNING
  end

  def info(msg)
    write_log(msg) if @level >= INFO
  end
end

logger = SimpleLogger.instance

puts "logger level is #{logger.level}"

logger.info('A sample INFO message')
logger.warning('A sample WARNING message')
logger.error('A sample ERROR message')

puts logger.log
