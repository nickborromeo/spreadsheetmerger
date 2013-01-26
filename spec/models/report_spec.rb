require 'spec_helper'

describe Report do
  describe ".open_report" do
    context "with valid file extension" do
      it "can open CSV file"
      it "can open XLS file"
      it "can open XLSX file"
    end
    
    context "with invalid file extension" do
      it "should raise an error"
    end
  end
end
