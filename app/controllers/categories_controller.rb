class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @sorted_books = SortBooksService.new(params, @category).sort_books
    @sort_title = SortBooksService.new(params).choose_title
  end
end
