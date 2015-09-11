# The Abstract Phone class
class Phone
  attr_accessor :phone_model, :factory_type

  def initialize(phone_model, factory_type)
    @phone_model = phone_model
    @factory_type = factory_type
  end

  def construct
  end

  def to_s
    "Phone Model: #{@phone_model} built in factory: #{@factory_type}"
  end
end

# The Expensive Phone type class
class ExpensivePhone < Phone
  def initialize(factory_type)
    super('expensive', factory_type)
    construct
  end

  def construct
    puts 'Building expensive phone'
  end
end

# The Cheap Phone type class
class CheapPhone < Phone
  def initialize(factory_type)
    super('cheap', factory_type)
    construct
  end

  def construct
    puts 'Building cheap phone'
  end
end

# The Open Source Phone type class
class OpenSourcePhone < Phone
  def initialize(factory_type)
    super('open source', factory_type)
    construct
  end

  def construct
    puts 'Building open source phone'
  end
end

# The Expensive Phone Factory
class ExpensivePhoneFactory
  def build_phone(phone_model)
    if phone_model == 'expensive'
      phone = ExpensivePhone.new('expensive')
    elsif phone_model == 'cheap'
      phone = CheapPhone.new('expensive')
    elsif phone_model == 'open source'
      phone = OpenSourcePhone.new('expensive')
    end
    phone
  end
end

# The Open Source Phone Factory
class OpenSourcePhoneFactory
  def build_phone(phone_model)
    if phone_model == 'expensive'
      phone = ExpensivePhone.new('open source')
    elsif phone_model == 'cheap'
      phone = CheapPhone.new('open source')
    elsif phone_model == 'open source'
      phone = OpenSourcePhone.new('open source')
    end
    phone
  end
end

# The Cheap Phone Factory
class CheapPhoneFactory
  def build_phone(phone_model)
    if phone_model == 'expensive'
      phone = ExpensivePhone.new('cheap')
    elsif phone_model == 'cheap'
      phone = CheapPhone.new('cheap')
    elsif phone_model == 'open source'
      phone = OpenSourcePhone.new('cheap')
    end
    phone
  end
end

# The Abstract Phone Factory
class PhoneFactory
  def initialize
  end

  def build_phone(phone_model)
    # factory type should be read from configuration
    # or other data source, but for this example, it is set to 'open source'
    factory_type = 'open source'
    if factory_type == 'cheap'
      phone = CheapPhoneFactory.new.build_phone(phone_model)
    elsif factory_type == 'expensive'
      phone = ExpensivePhoneFactory.new.build_phone(phone_model)
    elsif factory_type == 'open source'
      phone = OpenSourcePhoneFactory.new.build_phone(phone_model)
    end
    phone
  end
end

phone_factory = PhoneFactory.new
puts phone_factory.build_phone('open source')
puts phone_factory.build_phone('cheap')
puts phone_factory.build_phone('expensive')
