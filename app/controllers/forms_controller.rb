class FormsController < ApplicationController
	before_action :authenticate_user!
  	def show
		@form = Form.find_by!(:id => params[:id])
	end

	def new
		@form = current_user.forms.new
	end
	
	def create
		@form = current_user.forms.new(form_params)

		if @form.save!
			@form.create_heap(accepted_indices: "", waitlisted_indices: "", rejected_indices: "")
			redirect_to root_path
		else
			render :new, status: :unprocessable_entity
		end
	end

	def destroy
		@form = Form.find_by!(:id => params[:id])
		@form.destroy
	
		redirect_to root_path, status: :see_other
	end

  private
    def form_params
      params.require(:form).permit(:name, :file)
    end
end
