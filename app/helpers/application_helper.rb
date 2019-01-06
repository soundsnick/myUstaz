module ApplicationHelper

  private
  def auth
    session[:auth]
  end

  def admin
    auth && session[:auth]['role_id'] == 1
  end

  def moderator
    auth && session[:auth]['role_id'] == 2 || admin
  end

end
