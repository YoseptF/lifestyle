module SessionsHelper
  def log_in(user)
    session[:id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:id])
  end

  def current_user?(user)
    user == current_user
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    reset_session
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  def render_category
    render category_path(Category.find(session[:forwarding_category]))
    session.delete(:forwarding_category)
  end

  def store_category(category)
    session[:forwarding_category] = category.id
  end

  def only_logged_in
    redirect_to root_path unless current_user
  end

  def only_not_logged_in
    redirect_to root_path if current_user
  end
end
