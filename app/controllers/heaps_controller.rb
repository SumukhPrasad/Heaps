require 'csv'

class HeapsController < ApplicationController
	before_action :authenticate_user!
  def show
		csv_text = Form.find_by!(:id => params[:id]).file.download
    
    @csv = CSV.parse(csv_text.gsub(/\"/,''), :headers => true, :col_sep => "\t")

    @current=params[:page].to_i
    @nextpage = @current < @csv.length ? params[:page].to_i+1 : 0
    @prevpage = @current > 0 ? params[:page].to_i-1 : 0

    @row=@csv[@current-1]
    @total=@csv.length

	end

  def edit
  end
end
