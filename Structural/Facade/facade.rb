# The Subsystem Class A class
class CarModel
  def model
    puts ' CarModel - model'
  end
end

# The Subsystem Class B class
class CarEngine
  def engine
    puts ' CarEngine - engine'
  end
end

# The Subsystem Class C class
class CarBody
  def body
    puts ' CarBody - body'
  end
end

# The Subsystem Class D class
class CarAccessories
  def accessories
    puts ' CarAccessories - accessories'
  end
end

# The Car Facade class
class CarFacade
  attr_reader :model, :engine, :body, :accessories

  def initialize
    @model = CarModel.new
    @engine = CarEngine.new
    @body = CarBody.new
    @accessories = CarAccessories.new
  end

  def create_complete_car
    puts '******* Creating a Car ********'
    @model.model
    @engine.engine
    @body.body
    @accessories.accessories
    puts '**** Car creation complete ****'
  end
end

facade = CarFacade.new
facade.create_complete_car
