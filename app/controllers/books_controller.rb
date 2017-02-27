class BooksController < ApplicationController
  def index
    @sorted_books = SortBooksService.new(params).sort_books
    @sort_title = SortBooksService.new(params).choose_title
  end
end
