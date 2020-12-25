class TaxCalculation
  include InputCsvHelper
  include OutputCsvHelper

  def run
    receipt = read_input
    write_output(receipt)
  end
end
