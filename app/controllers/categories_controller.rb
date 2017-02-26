class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    if params.include?(:sort_with)
      @sorted_books = @category.books.send(params[:sort_with]).all
    else
      @sorted_books = @category.books.title_asc
    end
  end
end
