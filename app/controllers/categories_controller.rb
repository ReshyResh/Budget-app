class CategoriesController < ApplicationController
  def index
    redirect_to users_path unless user_signed_in?
    return unless user_signed_in?

    @categories = current_user.categories.includes(:transactions).all
    @sum = @categories.sum(:total)
  end

  def create
    @category = current_user.categories.new(create_params)
    respond_to do |format|
      format.html do
        if @category.save
          flash[:notice] = 'Category was successfully added.'
        else
          flash[:alert] = "Failed to save category - #{@category.errors.full_messages.first}"
        end
        redirect_to root_path
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice] = 'Category deleted!'
    else
      flash[:alert] = "Failed to remove category - #{@category.errors.full_messages.first}"
    end
    redirect_to root_path
  end

  private

  def create_params
    params.permit(:name, :description, :picture)
  end
end
