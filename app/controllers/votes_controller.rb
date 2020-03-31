class VotesController < ApplicationController
  def create
    @vote = Vote.new(article_id: params[:article_id], user_id: current_user.id)

    if @vote.save
      flash[:success] = 'upvoted!'
      redirect_back_or root_path
    else
      flash[:danger] = 'you already voted for this'
      redirect_to root_path
    end
  end

  def destroy
    p params
    @vote = Vote.find_by(user_id: current_user.id, article_id: params[:article_id])

    if @vote.delete
      flash[:success] = 'downvoted!'
      redirect_back_or root_path
    else
      flash[:danger] = 'something went wrong'
    end
  end
end
