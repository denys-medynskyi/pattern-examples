def net_salary(amount, country)
  taxes = case country
    when "Ukraine"
      (amount * 0.05) + 313
    when "U.S."
      (amount * 0.2) + 100
    when "Poland"
      amount * 0.3
    else
      0
    end

  amount - taxes
end

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
    strategy = @strategies.fetch(country)

    amount - strategy.taxes(amount)
  end
end

p Taxes.new.net_salary(1000, "Ukraine") # => 700.00
