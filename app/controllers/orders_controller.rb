class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = SortOrdersService.new(params[:sort_type], current_user).sort_orders
  end

  def show
    @order = Order.find(params[:id])
  end
end
