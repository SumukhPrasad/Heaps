require 'csv'

class HeapsController < ApplicationController
	before_action :authenticate_user!
  def show
		csv_text = Form.find_by!(:id => params[:id]).file.download
    
    @csv = CSV.parse(csv_text.gsub(/\"/,''), :headers => true, :col_sep => "\t")

    @row=@csv.first
	end

  def edit
  end
end
