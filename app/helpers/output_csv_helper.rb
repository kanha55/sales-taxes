module OutputCsvHelper
  include CsvHelper

  def write_output(receipt)
    raise 'receipt must be a Receipt type' unless receipt.is_a?(Receipt)
    data = output_array(receipt)
    write_file(data, output_file)
  end

  private

  def output_file
    @output_file ||= Dir.pwd + '/output.csv'
  end

  def output_array(receipt)
    output = []
    output += receipt.items.map(&:to_a)
    output << ["Sales Taxes: #{receipt.total_taxes_string}"]
    output << ["Total: #{receipt.total_with_taxes_string}"]
  end
end
