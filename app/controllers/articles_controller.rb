class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def index
    @featured = Article.featured
    @categories = Category.by_priority
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
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
