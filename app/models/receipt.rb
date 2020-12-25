class Receipt
  def items
    @items ||= []
  end

  def push_item(item)
    raise 'item must be a ReceiptItem' unless item.is_a?(ReceiptItem)
    items.push(item)
  end

  def total_taxes
    items.inject(0) { |sum, item| item.tax_value + sum }
  end

  def total_taxes_string
    NumberHelper.currency_to_s(total_taxes)
  end

  def total_without_taxes
    items.inject(0) { |sum, item | item.price + sum }
  end

  def total_with_taxes
    total_taxes + total_without_taxes
  end

  def total_with_taxes_string
    NumberHelper.currency_to_s(total_with_taxes)
  end
end
