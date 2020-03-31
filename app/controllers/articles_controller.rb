class ArticlesController < ApplicationController
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
      p 'done'
      redirect_to article_path(@article)
    else
      p 'not done'
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
