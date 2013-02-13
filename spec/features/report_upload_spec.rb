require 'spec_helper'

describe "Report Upload" do
  let(:user) { FactoryGirl.create(:user) }
  let(:report_file_path) { Rails.root.join('spec','support','files') }

  before(:each) do
    sign_in_with(user.email, user.password)
  end

  context "with invalid file types" do 
    it "does not accept blank file names" do 
      visit users_path
      attach_file(:first_report, report_file_path + "Report1.doc" )
      click_button "Import"
      page.should have_content("Unknown File Type")
    end
  end

  context "with valid file types" do 
    it "can upload csv files" do
      visit users_path
      attach_file(:first_report, report_file_path + "Report1.csv")
      click_button "Import"
      page.should have_content("File Uploaded")
    end

    it "can upload xls files" do
      visit users_path
      attach_file(:first_report, report_file_path + "Report1.xls")
      click_button "Import"
      page.should have_content("File Uploaded")
    end

    it "can upload xlsx files" do
      visit users_path
      attach_file(:first_report, report_file_path + "Report1.xlsx")
      click_button "Import"
      page.should have_content("File Uploaded")
    end
  end
  
  context "when report uploaded" do
    it "shows the report headers" do
      visit users_path
      attach_file(:first_report, report_file_path + "Report1.xls")
      click_button "Import"
      page.should have_content("Case #")
    end
  end
end
