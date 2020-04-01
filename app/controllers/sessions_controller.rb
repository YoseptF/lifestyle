class SessionsController < ApplicationController
  before_action :only_not_logged_in, only: %i[new create]
  before_action :only_logged_in, only: %i[destroy]
  def new; end

  def create
    @user = User.find_by(name: params[:session][:name])

    if @user
      log_in @user
      flash[:success] = "Welcome #{@user.name}"
      redirect_to root_path
    else
      flash.now[:warning] = "the user doesn't exist"
      render :new
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
