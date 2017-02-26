class HomePageController < ApplicationController
  def index
    @category = Category.home_page_category(params)
    @latest_books = Book.sorted_by(@category).latest.take(3)
  end

  def documentation
  end
end
