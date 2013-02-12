class Report < ActiveRecord::Base

  belongs_to :user

  def self.open_report(file)
    case File.extname(file)
    when ".csv" then Csv.new(file)
    when ".xls" then Excel.new(file)
    else raise "Unknown file type: "#{file}"
    end
  end
end
