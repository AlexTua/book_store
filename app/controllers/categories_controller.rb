class CategoriesController < ApplicationController
  load_and_authorize_resource

  def show
    save_location
    @sorted_books = @category.books ? @category.books.send(choose_sort) : Book.send(choose_sort)
    @sorted_books = @sorted_books.page(params[:page]).decorate
  end

  private

  def choose_sort
    params[:sort_type] || :title_asc
  end
end
