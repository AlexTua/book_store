class Category < ApplicationRecord
  has_and_belongs_to_many :books
  
  validates :title, presence: true, uniqueness: true

  HOME_GATEGORY = "Mobile development".freeze

  def self.home_page_category(params)
    return Category.find(params[:category_id]) if params.include?(:category_id)
    Category.find_by_title(Category::HOME_GATEGORY)
  end
end
