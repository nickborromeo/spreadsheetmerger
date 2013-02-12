class Report < ActiveRecord::Base

  belongs_to :user

  def self.import(file)
    report = open_report(file)
  end

  def self.open_report(file)
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: "#{file.original_filename}"
    end
  end
end
