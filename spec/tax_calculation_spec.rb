require Dir.pwd + '/spec/spec_helper.rb'


describe :sales_taxes_calculation do
  # Generate dynamic test casese based on csv files
  Dir[Dir.pwd + "/spec/test_cases/*.input.csv"].each do |file|
    file_name = File.basename(file).gsub('.input.csv', '')

    it "execute #{file_name.gsub('_', ' ')}" do
      FileUtils.cp(file, Dir.pwd + '/input.csv')
      TaxCalculation.new.run
      expect(read_file(Dir.pwd + '/output.csv')).to eq(read_file(Dir.pwd + "/spec/test_cases/#{file_name}.output.csv"))
    end
  end
end