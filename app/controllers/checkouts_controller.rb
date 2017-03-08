class CheckoutsController < ApplicationController
  include Wicked::Wizard

  steps :address, :delivery

  def show
    @order = current_order
    render_wizard
  end

  def update
    @order = current_order
    case step
    when :address
      create_addresses
      render_wizard @order
    end
  end

  private

  def shipping_address_params
    params.require(:shipping).permit(:first_name, :last_name, :address_name, :city, :zip, :country, :phone, :address_type)
  end

  def billing_address_params
    params.require(:billing).permit(:first_name, :last_name, :address_name, :city, :zip, :country, :phone, :address_type)
  end

  def create_addresses
    @order.addresses.new(billing_address_params)
    unless params[:billing][:address_type] == "both"
      @order.addresses.new(shipping_address_params)
    end
  end
end
