class ReportsController < ApplicationController

  def import
    begin
      @headers = Report.import(params[:first_report])
    rescue
      redirect_to root_url, notice: "Unknown File Type"
    else
      redirect_to root_url, notice: "File Uploaded"
    end
  end

end
