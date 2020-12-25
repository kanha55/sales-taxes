module InputCsvHelper
  include CsvHelper

  def read_input
    receipt = Receipt.new

    # Read csv file and remove header row
    data_rows = read_file(input_file)
    data_rows.shift

    data_rows.each do |item|
      next if item.empty? || item.length != 3 || item.map(&:strip).any?(&:empty?)
      next unless NumberHelper.is_number?(item[0]) && NumberHelper.is_number?(item[2])

      receipt_item = ReceiptItem.new(item[0], item[1], item[2])
      receipt.push_item(receipt_item)
    end

    receipt
  end

  private

  def input_file
    @input_file ||= Dir.pwd + '/input.csv'
  end
end
