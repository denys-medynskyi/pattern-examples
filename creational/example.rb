class Cake
  attr_accessor :ingredient

  def bake
    add_ingredient
    summary
  end

  private

  def add_ingredient
    fail NotImplementedError
  end

  def summary
    puts "Cake with #{ingredient} is baked"
  end
end

class ChocolateCake < Cake
  def add_ingredient
    @ingredient = 'chocolate'
  end
end

class CheeseCake < Cake
  def add_ingredient
    @ingredient = 'cheese'
  end
end

ChocolateCake.new.bake
CheeseCake.new.bake
