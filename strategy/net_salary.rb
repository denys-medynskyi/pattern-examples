# def net_salary(amount, country)
#   taxes = case country
#   when "Ukraine"
#     (amount * 0.05) + 313
#   when "Poland"
#     amount * 0.3
#   end

#   amount - taxes
# end

# p net_salary(1000, "Poland")  # => 700.0
# p net_salary(1000, "Ukraine")  # => 637.0

class UkraineTaxes
  def self.taxes(amount)
    (amount * 0.05) + 313
  end
end

class PolandTaxes
  def self.taxes(amount)
    amount * 0.3
  end
end

class Taxes
  def initialize
    @strategies = {}
    @strategies['Ukraine'] = UkraineTaxes
    @strategies['Poland'] = PolandTaxes
  end

  def net_salary(amount, country)
    strategy = @strategies[country]

    amount - strategy.taxes(amount)
  end
end

p Taxes.new.net_salary(1000, "Poland") # => 700.0

