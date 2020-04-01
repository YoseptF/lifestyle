class VotesController < ApplicationController
  before_action :only_logged_in
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
    @vote = Vote.find_by(user_id: current_user.id, article_id: params[:article_id])

    if @vote.delete
      flash[:success] = 'downvoted!'
    else
      flash[:danger] = 'something went wrong'
    end
    redirect_back_or root_path
  end
end
