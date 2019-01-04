module ApplicationHelper

  private
  def auth
    session[:auth]
  end

  def admin
    auth && session[:auth]['role_id'] == 1
  end

end
