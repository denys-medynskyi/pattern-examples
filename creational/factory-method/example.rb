class Cake
  attr_accessor :ingredient

  def bake
    create_cake
    summary
  end

  private

  def create_cake
    fail NotImplementedError
  end

  def summary
    puts "Cake with #{ingredient} is baked"
  end
end

class ChocolateCake < Cake
  def create_cake
    @ingredient = 'chocolate'
  end
end

class CheeseCake < Cake
  def create_cake
    @ingredient = 'cheese'
  end
end

ChocolateCake.new.bake
CheeseCake.new.bake
