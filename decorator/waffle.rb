class Waffle
  attr_reader :waffle

  def initialize
    @waffle = 'This is a waffe'
  end

  def serve
    puts waffle
  end
end

def StrawberryWaffle
  attr_reader :waffle, :topping

  def initialize(waffle)
    @waffle = waffle
    @topping = 'strawberry'
  end

  def serve
    puts waffle
    puts "and #{topping}"
  end
end

#

class WaffleDecorator
  attr_reader :waffle, :topping

  def initialize(waffle)
    @waffle = waffle
  end

  def serve
    waffle.serve
    puts "topping with #{topping}"
  end

  def topping
    raise NotImplementedError
  end
end

class StrawberryWaffle < WaffleDecorator
  def topping
    'strawberry'
  end
end

class BlueberryWaffle < WaffleDecorator
  def topping
    'blueberry'
  end
end

plain_waffle = Waffle.new
strawberry_waffle = StrawberryWaffle.new(plain_waffle)
blueberry_strawberry_waffle = BlueberryWaffle.new(strawberry_waffle)
blueberry_strawberry_waffle.serve
