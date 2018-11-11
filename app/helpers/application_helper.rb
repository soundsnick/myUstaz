module ApplicationHelper

  private
  def auth
    session[:auth]
  end
end
