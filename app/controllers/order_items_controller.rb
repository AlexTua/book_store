class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    if @order.valid?
      @order.save 
      session[:order_id] = @order.id
      cahnge_book_quantity(-@order_item.quantity)
    end
  end

  def update
    @order_item = current_order.order_items.find(params[:id])
    if @order_item.quantity > params[:order_item][:quantity].to_i  
      update_order_items(1)
    elsif @order_item.book.in_stock?
      update_order_items(-1)
    else
      redirect_to cart_path, alert: "Item is out of stock."
    end
  end

  def destroy
    @order_item = current_order.order_items.find(params[:id])
    cahnge_book_quantity(@order_item.quantity)
    @order_item.destroy
    redirect_to cart_path, notice: "Item deleted."
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :book_id)
  end

  def cahnge_book_quantity(int)
    @order_item.book.quantity += int
    @order_item.book.save
  end

  def update_order_items(int)
    cahnge_book_quantity(int)
    @order_item.update(order_item_params) 
    redirect_to cart_path, notice: "Item updated."
  end
end
