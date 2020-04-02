class TableBuilder
  attr_reader :rows

  def initialize
    @rows = []
  end

  def add_row(data)
    rows << data

    self
  end

  def build
    rows.join('->')
  end
end

table = TableBuilder.new

p table
  .add_row(['User Names'])
  .add_row(['Denys'])
  .add_row(['Petro'])
  .build


