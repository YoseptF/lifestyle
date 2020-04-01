class ArticlesController < ApplicationController
  before_action :only_logged_in, only: %i[new]
  def new
    @article = Article.new
    @categories = Category.all.map { |category| [category.name, category.id] }
  end

  def index
    @featured = Article.featured
    @categories = Category.by_priority
  end

  def create
    @article = current_user.articles.build(article_params)
    @categories = Category.all.map { |category| [category.name, category.id] }

    if @article.save
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = Article.includes(:image_attachment, :author).find_by(id: params[:id])
  end

  def article_params
    params.require(:article).permit(
      :author_id,
      :title,
      :text,
      :image
    )
  end
end
