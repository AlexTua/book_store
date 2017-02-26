class Book < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :authors

  validates :title, :price, :quantity, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  scope :sorted_by, ->(category) { where(category: category) }
  scope :latest, -> { order(created_at: :desc) }
  scope :title_asc, -> { order(title: :asc) }
  scope :title_desc, -> { order(title: :desc) }
  scope :low_price, -> { order(price: :asc) }
  scope :high_price, -> { order(price: :desc) }
end
