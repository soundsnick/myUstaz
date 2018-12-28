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

  def search_api
    @title = "Результаты поиска по запросу: #{params[:search]}"
    @search = Teacher.where("name LIKE :name OR surname LIKE :name", {:name => "%#{params[:search]}%"}).limit(2)
    render json: @search, :include => {:university => {only: [:name, :id]}, :costs => {only: :value}}
  end

  def search
    @title = "Результаты поиска по запросу: #{params[:search]}"
    @search = Teacher.where("name LIKE :name OR surname LIKE :name", {:name => "%#{params[:search]}%"})
  end

  def subject_page
    if @subj = Subject.find_by(id: params[:id])
      @title = @subj.name
      @search = Teacher.where(subject_id: params[:id])
      render 'search'
    else
      redirect_to '/404'
    end
  end

  def commentaryAdd
    if auth
      @d = Commentary.where("user_id = :user AND teacher_id = :teacher", {:user => session[:auth]['id'].to_s, :teacher => params[:teacher]})
      if @d.count > 0
        @c = @d.take
        @c.text = params[:text]
        @c.status = 0
        @c.save
        @response = "Ваш отзыв отредактирован и будет опубликован после модерации"
        render 'moderating'
      else
        @c = Commentary.new
        @c.user_id = session[:auth]['id']
        @c.status = 0
        @c.text = params[:text]
        @c.teacher_id = params[:teacher]
        @c.save
        @response = "Ваш отзыв принят и будет опубликован после модерации"
        render 'moderating'
      end
    else
      redirect_to login_path, notice: 'Авторизуйтесь чтобы добавить комментарий'
    end
  end

  def tagAdd
    if params[:tag] && params[:teacher]
      @tag =  Taguser.where('teacher_id = ? AND user_id = ? AND tag_id = ?', params[:teacher], session[:auth]['id'], params[:tag])
      if @tag.count == 0
        @tag = Taguser.new
        @tag.teacher_id = params[:teacher]
        @tag.user_id = session[:auth]['id']
        @tag.tag_id = params[:tag]
        @tag.save
        redirect_back(fallback_location: root_path)
      else
        @tag.take.destroy
        redirect_back(fallback_location: root_path)
      end
    else
      redirect_back(fallback_location: root_path)
    end
  end

end