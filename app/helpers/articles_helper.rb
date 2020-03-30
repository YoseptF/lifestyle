module ArticlesHelper
  def deck_for(article)
    strip_tags(article.text)[0..130] + '...'
  end

  def first_title(category)
    category.articles.take.title[0..30] + '...'
  end

  def first_image(category)
    url_for(category.articles.take.image)
  end
end
