class CategoriesController < ApplicationController
  def index
    @featured = Article.featured
    @categories = Category.by_priority
  end

  def show
    @category = Category.includes(articles: :image_attachment).find(params[:id])
  end
end
