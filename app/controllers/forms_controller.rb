class FormsController < ApplicationController
  def show
		@form = Form.find_by!(:id => params[:id])
	end

	def new
		@form = current_user.forms.new
	end
	
	def create
		@form = current_user.forms.new(form_params)

		if @form.save!
			redirect_to forms_path(@form.id)
		else
			render :new, status: :unprocessable_entity
		end
	end

  private
    def form_params
      params.require(:form).permit(:name, :file)
    end
end
