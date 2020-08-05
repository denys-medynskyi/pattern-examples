class OperationCommand
  attr_accessor :a, :b

  def initialize(a , b)
    @a = a
    @b = b
  end
end

class AddCommand < OperationCommand
  def call
    a + b
  end
end

class SubstractCommand < OperationCommand
  def call
    a - b
  end
end

class Calculator
  attr_reader :strategy

  STRATEGIES = {
    'add' => AddCommand,
    'substract' => SubstractCommand
  }

  def initialize(action)
    @strategy = STRATEGIES.fetch(action)
  end

  def call(a, b)
    strategy.new(a, b).call
  end
end

calculator = Calculator.new('add')
p calculator.call(2, 2)

calculator = Calculator.new('substract')
p calculator.call(2, 2)
