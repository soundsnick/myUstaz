class UserController < ApplicationController
  require 'digest'

  def login
    if auth
      redirect_to root_path
    else
      if params[:email] && params[:password]
        if @user = User.find_by(email: params[:email])
          if @user.password == params[:password]
            session[:auth] = @user
            redirect_to root_path, notice: 'Добро пожаловать'
          else
            redirect_to login_path, notice: 'Неправильный пароль'
          end
        else
          redirect_to login_path, notice: 'Неправильная электронная почта'
        end
      else
        redirect_to login_path, notice: 'Заполните все поля'
      end
    end
  end

  def login_page
    if auth
      redirect_to root_path
    else
      render 'login'
    end
  end

  def register_page
    if auth
      redirect_to root_path
    else
      render 'register'
    end
  end

  def register
    if auth
      redirect_to root_path
    else
      if params[:name] && params[:surname] && params[:adress] && params[:phone] && params[:sex] && params[:email] && params[:password] && params[:confirm]
        unless User.find_by(email: params[:email])
          if params[:password] == params[:confirm]
            @user = User.new
            @user.name = params[:name]
            @user.surname = params[:surname]
            @user.adress = params[:adress]
            @user.phone = params[:phone]
            @user.sex = params[:sex]
            @user.email = params[:email]
            @user.password = params[:password]
            @user.avatar = 'noavatar.png'
            @user.save
            session[:auth] = @user
          else
            redirect_to register_path, notice: 'Пароли не совпадают'
          end
        else
          redirect_to register_path, notice: 'Электронная почта уже зарегистрирована'
        end
      else
        redirect_to register_path, notice: 'Заполните все поля'
      end
    end
  end

  def logout
    session[:auth] = nil
    redirect_to root_path
  end

  def search
    @search = Teacher.where("name like ? or surname like ?", params[:search], params[:search])
  end

end