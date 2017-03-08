class Address < ApplicationRecord
  belongs_to :order

  validates :first_name, :last_name, :address_name, :city, :zip, :country, :phone, presence: true
end
