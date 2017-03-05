class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order.save
    @order_item = @order.order_items.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    redirect_to cart_path, notice: "Item updated."
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    redirect_to cart_path, notice: "Item deleted."
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :book_id)
  end
end