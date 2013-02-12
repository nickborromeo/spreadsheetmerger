require 'spec_helper'

describe Report do
  describe ".open_report" do
    let(:file_path) { Rails.root.join('spec','support','files') }
    let(:report) { Report.new }
    context "with valid file extension" do
      it "can open CSV file" do
        file = file_path+"Report1.csv"
        report.should_receive(:open_report).with(file).and_return(Csv)
        report.open_report(file).should eq(Csv)
      end
      it "can open XLS file" do
        file = file_path+"Report1.xls"
        report.should_receive(:open_report).with(file).and_return(Excel)
        report.open_report(file).should eq(Excel)
      end
      it "can open XLS file" do
        file = file_path+"Report1.xlsx"
        report.should_receive(:open_report).with(file).and_return(Excelx)
        report.open_report(file).should eq(Excelx)
      end
    end
    
    context "with invalid file extension" do
      it "should raise an error" do
        file = file_path+"Report1.doc"
        report.should_receive(:open_report).with(file).and_raise("Unkown file type")
        expect {report.open_report(file)}.to raise_error
      end
    end
  end
end
