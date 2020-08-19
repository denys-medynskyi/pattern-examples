class Decorator
  def initialize(object)
    @object = object
  end

  def call
    @object.call
  end
end

class CreateUserWithLogging < Decorator
  def call
    super
    warn @object.inspect
  end
end

class CreateUser
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def call
    puts 'create user call'
  end
end

create_user = CreateUser.new('Denys', 'Medynskyi')
logger = CreateUserWithLogging.new(create_user).call
