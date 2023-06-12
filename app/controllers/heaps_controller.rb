require 'csv'

class HeapsController < ApplicationController
	before_action :authenticate_user!
  def show
    @form=Form.find_by!(:id => params[:id])
		csv_text = @form.file.download
    
    @csv = CSV.parse(csv_text.gsub(/\"/,''), :headers => true, :col_sep => "\t")

    @current=params[:page].to_i
    @nextpage = @current < @csv.length ? params[:page].to_i+1 : 0
    @prevpage = @current > 0 ? params[:page].to_i-1 : 0

    @row=@csv[@current-1]
    @total=@csv.length

	end

  def accept
    @current=params[:page].to_i
    Form.find_by!(:id => params[:id]).heap.accept(:index => @current)
	end
	helper_method :accept

  def waitlist
    @current=params[:page].to_i
    Form.find_by!(:id => params[:id]).heap.waitlist(:index => @current)
	end
	helper_method :waitlist

  def reject
    @current=params[:page].to_i
    Form.find_by!(:id => params[:id]).heap.reject(:index => @current)
	end
	helper_method :reject

  def edit
  end
end
