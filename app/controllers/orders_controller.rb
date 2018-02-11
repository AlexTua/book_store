class OrdersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    # @orders = SortOrdersService.new(params[:sort_type], current_user.orders).sort_orders
    @orders = current_user.orders.send(choose_sort)
  end

  def show
  end

  def continue_shopping
    session[:order_id] = params[:id]
    redirect_to category_path(1)
  end

  private

  def choose_sort
    params[:sort_type] || :all
  end
end
