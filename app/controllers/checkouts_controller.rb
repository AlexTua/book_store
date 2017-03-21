class CheckoutsController < ApplicationController
  include Wicked::Wizard

  before_action :authenticate_user!
  before_action :check_empty_cart

  steps :address, :delivery, :payment, :confirm, :complete

  def show
    @order = current_order
    set_current_step
    if step == :complete && params[:skip]
      CheckoutMailer.complete_email(current_user, @order).deliver_now
      session.delete(:order_id)
    end
    render_wizard
  end

  def update
    @order = current_order
    case step
    when :address
      CheckoutAddressService.new(@order, params).create_or_update_address
      render_addresses_forms
    when :delivery
      render_delivery_form
    when :payment
      CheckoutPaymentService.new(@order, params).create_or_update_card
      render_wizard @order.credit_card
    when :confirm
      @order.confirm
      render_wizard @order
    end
  end

  private

  def render_addresses_forms
    if @order.get_address("billing").errors.any? || @order.get_address("shipping").errors.any?
      render_wizard 
    else
      render_wizard @order
    end
  end 

  def render_delivery_form
    if params[:delivery]
      @order.delivery_id = params[:delivery]
      render_wizard @order
    else
      render_wizard
    end
  end 

  def set_current_step
    unless params[:skip]
      steps.reverse.each do |stp|
        jump_to(stp, skip: true) unless has_completed?(@order, stp)
      end
    end 
  end

  def has_completed?(order, step)
    case step
    when :address
      order.get_address("billing").try(:persisted?)
    when :delivery
      order.delivery_id?
    when :payment
      order.credit_card.try(:persisted?)
    when :confirm
      order.in_queuen?
    end
  end

  def check_empty_cart
    redirect_to cart_path, alert: "Cart is empty" unless current_order.order_items.any? 
  end
end
