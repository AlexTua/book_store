module CategoriesHelper
  def sort_title
    Book::SORT_TITLES[choose_sort.to_sym]
  end

  private

  def choose_sort
    params[:sort_type] || :title_asc
  end
end
