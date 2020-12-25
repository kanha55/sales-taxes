class NumberHelper
  def self.currency_to_s(number)
    sprintf("%.2f", number)
  end

  def self.round_tax(number)
    (number * 20).ceil / 20.0
  end

  def self.is_number?(string)
    true if Float(string) rescue false
  end
end