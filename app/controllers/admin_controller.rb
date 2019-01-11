class AdminController < ApplicationController

  before_action :set_variables

  def set_variables
    @admin_page = true
  end

  def if_admin
    if admin
      @admin = User.find_by(id: session[:auth]['id'])
    else
      redirect_to login_path, notice: 'Авторизуйтесь'
    end
  end

  def if_moderator
    if moderator
      @admin = User.find_by(id: session[:auth]['id'])
    else
      redirect_to login_path, notice: 'Авторизуйтесь'
    end
  end

  def if_editor
    if editor
      @admin = User.find_by(id: session[:auth]['id'])
    else
      redirect_to login_path, notice: 'Авторизуйтесь'
    end
  end

  def if_param(param)
    unless params[param]
      redirect_back fallback_location: admin_path, notice: 'Ошибка'
    end
  end

  def index
    if_admin
  end

  def users
    if_moderator
    @users = User.where(role_id: 0)
  end

  def administrators
    if_admin
    @users = User.where('NOT role_id=0')
    render 'users'
  end

  def news
    if_editor
    @news = Post.all
  end

  def user_delete
    if_admin
    if_param[:id]
    if @user = User.find_by(id: params[:id])
      @user.destroy
      redirect_back fallback_location: admin_path, notice: 'Пользователь успешно удален'
    else
      redirect_back fallback_location: admin_path, notice: 'Произошла ошибка'
    end
  end

  def post_delete
    if_editor
    if_param(:id)
    if @post = Post.find_by(id: params[:id])
      @post.destroy
      redirect_back fallback_location: admin_path, notice: 'Запись успешно удалена'
    else
      redirect_back fallback_location: admin_path, notice: 'Произошла ошибка'
    end
  end
end