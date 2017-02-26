class Category < ApplicationRecord
  has_many :books
  
  validates :title, presence: true, uniqueness: true

  HOME_GATEGORY = "Mobile development"

  def self.home_page_category(params)
    return Category.find(params[:category]) if params.include?(:category)
    Category.find_by_title(Category::HOME_GATEGORY)
  end
end
