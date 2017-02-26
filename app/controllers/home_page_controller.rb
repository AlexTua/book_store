class HomePageController < ApplicationController
  def index
    @category = if params.include?(:category)
                  Category.find(params[:category])
                else
                  Category.find_by_title(Category::HOME_GATEGORY)
                end
  end

  def documentation
  end
end
