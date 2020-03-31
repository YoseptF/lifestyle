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

  def upvote(article, category)
    store_location
    store_category(category)
    @vote = Vote.find_by(user_id: current_user.id, article_id: article.id)

    if @vote
      link_to article_vote_path(article_id: article.id, id: @vote.id), method: :delete do
        raw '<i class="fas fa-arrow-down"></i>'
      end
    else
      link_to article_votes_path(article_id: article.id), method: :post do
        raw '<i class="fas fa-arrow-up"></i>'
      end
    end
  end
end
