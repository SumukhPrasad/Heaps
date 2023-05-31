class StaticController < ApplicationController
  def index
    @forms = Form.all
  end
end
