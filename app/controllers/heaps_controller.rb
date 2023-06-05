require 'csv'

class HeapsController < ApplicationController
	before_action :authenticate_user!
  def show
		csv_text = Form.find_by!(:id => params[:id]).file.download
    
    @csv = CSV.parse(csv_text.gsub(/\"/,''), :headers => true, :col_sep => "\t")

    @nextpage = params[:page].to_i < @csv.length ? params[:page].to_i+1 : 0
    @prevpage = params[:page].to_i > 0 ? params[:page].to_i-1 : 0

    @row=@csv[params[:page].to_i-1]
    puts @csv.length
	end

  def edit
  end
end
