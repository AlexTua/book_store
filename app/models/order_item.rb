class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :book

  default_scope { order(created_at: :desc) }

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :order_id, :book_id, presence: true
  validate :book_quantity, on: :create
  
  def total_price
    book.price * quantity
  end

  private

  def book_quantity
    if book.quantity < quantity
      errors.add(:order_item, "is out of stock")
    end
  end
end
