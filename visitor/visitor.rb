module Visitable
  def accept(visitor)
    # Visitor.new.visit(order)
    visitor.visit(self)
  end
end

class Product
  attr_accessor :name, :price

  def initialize(name:, price:)
    @name = name
    @price = price
  end
end

class Tax
  include Visitable

  attr_accessor :price

  def initialize(price:)
    @price = price
  end

  def name
    'Tax'
  end
end

# abstract class
class Visitor
  def visit(subject)
    raise NotImplementedError.new
  end
end

# concrete class
class Printer < Visitor
  def visit(subject)
    puts "#{subject.name}: #{subject.price}"
  end
end

# usage

product = Product.new(name: 'laptop', price: 50)
tax = Tax.new(price: 10)

product.accept(Printer.new)
tax.accept(Printer.new)
