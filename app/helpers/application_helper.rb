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

  def editor
    auth && session[:auth]['role_id'] == 3 || admin
  end
end
