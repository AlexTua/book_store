class HomePageController < ApplicationController
  def index
    @category = Category.home_page_category(params)
    @latest_books = @category.books.latest.take(3)
  end
end
