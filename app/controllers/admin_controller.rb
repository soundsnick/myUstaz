class AdminController < ApplicationController

  def index
    if admin
      @admin = User.find_by(id: session[:auth]['id'])
    else
      redirect_to login_path, notice: 'Авторизуйтесь'
    end
  end
end