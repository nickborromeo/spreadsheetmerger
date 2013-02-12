require 'spec_helper'

describe Report do
  describe ".open_report" do
    let(:file_path) { Rails.root.join('spec','support','files') }
    context "with valid file extension" do
      it "can open CSV file" do
        # file = file_path+"Report1.csv"
        # Report.open_report(file).should be_a(Csv)
      end
      it "can open XLS file" do
        # file = file_path + "Report1.xls"
        # Report.open_report(file).should be_an(Excel)
      end
      it "can open XLS file"
    end
    
    context "with invalid file extension" do
      it "should raise an error"
    end
  end
end
