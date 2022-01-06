class TransactionsController < ApplicationController
  def index
    redirect_to login_path unless user_signed_in?
    return unless user_signed_in?

    @category = Category.includes(:transactions).find(params[:category_id])
    return unless @category

    if current_user.id == @category.user_id
      @sum = current_user.categories.includes(:transactions).all.sum(:total)
    else
      redirect_to unauthorized_path
    end
  end

  def create
    @category = Category.find(params[:category_id])
    @transaction = @category.transactions.new(create_params)
    respond_to do |format|
      format.html do
        if @transaction.save
          flash[:notice] = 'Transaction was successfully added.'
        else
          flash[:alert] = "Failed to save transaction - #{@transaction.errors.full_messages.first}"
        end
        redirect_to category_transactions_path(params[:category_id])
      end
    end
  end

  def destroy
    @transaction = Transaction.find(params[:id])
    if @transaction.destroy
      flash[:notice] = 'Transaction deleted!'
    else
      flash[:alert] = "Failed to remove Transaction - #{@transaction.errors.full_messages.first}"
    end
    redirect_to category_transactions_path(params[:category_id])
  end

  private

  def create_params
    params.permit(:name, :transaction_number, :total)
  end
end
