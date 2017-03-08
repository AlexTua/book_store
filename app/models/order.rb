class Order < ApplicationRecord
  before_save { self[:subtotal] = subtotal }

  has_many :order_items, dependent: :destroy
  has_many :addresses
  belongs_to :user

  def subtotal
    order_items.collect(&:total_price).sum
  end
end
