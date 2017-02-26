class HomePageController < ApplicationController
  def index
    @category = Category.home_page_category(params)
  end

  def documentation
  end
end
