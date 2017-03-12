class OrderItemsController < ApplicationController
  after_action :save_user_to_order

  def create
    @order = current_order
    @order.save unless @order.persisted?
    @order_item = @order.order_items.new(order_item_params)
    if @order.valid?
      @order.save 
      session[:order_id] = @order.id
    end
  end

  def update
    @order = current_order
    @order_item = current_order.order_items.find(params[:id])
    if @order_item.quantity > params[:order_item][:quantity].to_i  
      update_order_item(1)
    elsif @order_item.book.in_stock?
      update_order_item(-1)
    else
      redirect_to cart_path, alert: "Item is out of stock."
    end
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order.save
    redirect_to cart_path, notice: "Item deleted."
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :book_id)
  end

  def update_order_item(int)
    @order_item.book.quantity += int
    @order_item.book.save
    @order_item.update(order_item_params) 
    @order.save
    redirect_to cart_path, notice: "Item updated."
  end

  def save_user_to_order
    unless @order.user
      @order.user = current_user
      @order.save
    end
  end
end
