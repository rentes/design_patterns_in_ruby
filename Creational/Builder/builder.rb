# The Builder class
class Builder
  def run_builder_task_1
  end

  def run_builder_task_2
  end
end

# Builder 1 class
class Builder1 < Builder
  def run_builder_task_1
    puts 'Builder1: task 1'
  end

  def run_builder_task_2
    puts 'Builder1: task 2'
  end
end

# Builder 2 class
class Builder2 < Builder
  def run_builder_task_1
    puts 'Builder2: task 3'
  end

  def run_builder_task_2
    puts 'Builder2: task 4'
  end
end

# The Director class
class Director
  def create_builder(type)
    if type == 1
      builder = Builder1.new
    else
      builder = Builder2.new
    end
    builder.run_builder_task_1
    builder.run_builder_task_2
    builder
  end
end

director = Director.new
director.create_builder(1)
director.create_builder(2)
