class ReceiptItem
  include TaxHelper

  attr_accessor :quantity, :product_name, :price

  def initialize(quantity, product_name, price)
    self.quantity = quantity.to_i
    self.product_name = product_name.strip
    self.price = price.to_f
  end

  def to_a
    [quantity, product_name, NumberHelper.currency_to_s(total)]
  end

  def tax_value
    @tax_value ||= get_tax_rate(product_name) * price
    NumberHelper.round_tax(@tax_value)
  end

  def total
    price + tax_value
  end
end
