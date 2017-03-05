class OrderItem < ApplicationRecord
  before_save { self[:unit_price] = unit_price }

  belongs_to :order
  belongs_to :book

  default_scope { order(created_at: :desc) }

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :order_id, :book_id, :unit_price, presence: true

  def unit_price
    if persisted?
      self[:unit_price]
    else
      book.price
    end
  end

  def total_price
    unit_price * quantity
  end
end
