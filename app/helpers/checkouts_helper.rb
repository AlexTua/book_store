module CheckoutsHelper
  def has_error?(type, field)
    address = get_address(type)
    address.errors.include?(field) if address
  end

  def error_message(type, field)
    address = get_address(type)
    address.errors.messages[field][0] if address
  end

  private

  def get_address(type)
    if params[:billing].try(:[], :address_type) == "both" && type == "billing"
      return @order.addresses.first
    end
    @order.addresses.select { |address| address.address_type == type}[0]
  end
end
