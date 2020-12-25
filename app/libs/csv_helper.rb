module CsvHelper
  require 'csv'

  def read_file(file_name)
    raise 'File not found' unless File.file?(file_name)
    CSV.read(file_name)
  end

  def write_file(data, file_name)
    raise 'data must be an array' unless data.is_a?(Array)
    CSV.open(file_name, 'w') do |csv|
      data.each do |row|
        raise 'Row item must be an array' unless row.is_a?(Array)
        csv << row
      end
    end
  end
end
