class CategoriesController < ApplicationController
    def index
        unless user_signed_in?
            redirect_to login_path
        end
        if user_signed_in?
            @categories = current_user.categories.includes(:transactions).all
        end
    end

    def create
    @category = current_user.categories.new(create_params)
    respond_to do |format|
      format.html do
        if @category.save
          flash[:notice] = 'Category was successfully added.'
        else
          flash[:alert] = "Failed to save category - #{@food.errors.full_messages.first}"
        end
        redirect_to root_path
      end
    end
  end

  private

  def create_params
    params.permit(:name, :description)
  end

end
