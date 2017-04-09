module ApplicationHelper
  def categories_list
    Category.all
  end

  def cart_size
    current_order.order_items.size
  end

  def price_in_currency(price)
    number_to_currency(price, unit: '€')
  end

  def change_class(key)
    case key
    when 'notice' then 'success'
    when 'alert' then 'danger'
    else key
    end
  end
end
