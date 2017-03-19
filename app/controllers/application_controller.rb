class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def current_order
    return Order.new unless Order.exists?(session[:order_id])
    Order.find(session[:order_id])
  end
   
  private 

  def save_user_to_order
    @order = current_order
    if @order.persisted?
      @order.user = current_user
      @order.save
    end
  end

  def save_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
