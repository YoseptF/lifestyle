class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(name: params[:session][:name])

    if @user
      log_in @user
      redirect_to root_path
    else
      flash[:warning] = "the user doesn't exist"
      redirect_to new_session_path
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:name)
  end
end
