class HomePageController < ApplicationController
  def index
    @categories = Category.all
  end

  def documentation
  end
end
