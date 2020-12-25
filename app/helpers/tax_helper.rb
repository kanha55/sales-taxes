module TaxHelper
  def get_tax_rate(product_name)
    tax_rate = 0
    product_name = product_name.downcase

    tax_rate += IMPORTED_RATE if imported?(product_name)
    return tax_rate if exempted?(product_name)

    tax_rate + NORMAL_RATE
  end

  private

  IMPORTED_RATE = 0.05
  NORMAL_RATE = 0.1

  def medical_product_keywords
    @medical_product_keywords ||= File.read(Dir.pwd + '/app/helpers/medical_product_keywords.txt').split("\n")
  end

  def food_keywords
    @food_keywords ||= File.read(Dir.pwd + '/app/helpers/food_keywords.txt').split("\n")
  end

  def imported?(product_name)
    product_name.include?('import')
  end

  def exempted?(product_name)
    return true if book?(product_name)
    return true if food?(product_name)
    return true if medical_product?(product_name)
    false
  end

  def book?(product_name)
    product_name.include?('book')
  end

  def food?(product_name)
    food_keywords.any? do |key_word|
      product_name.include?(key_word)
    end
  end

  def medical_product?(product_name)
    medical_product_keywords.any? do |key_word|
      product_name.include?(key_word)
    end
  end
end
