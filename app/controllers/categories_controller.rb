class CategoriesController < ApplicationController
  def index
    @featured = Article.featured
    @categories = Category.by_priority
  end

  def show
    @category = Category.find_by(id: params[:id])
  end
end
