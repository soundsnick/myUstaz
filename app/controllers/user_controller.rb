class UserController < ApplicationController
  require 'digest'

  def login
    if auth
      redirect_to root_path
    else
      if params[:username] && params[:password]
        require 'uri'
        require 'net/http'
        require 'json'
        url = URI("https://dl.iitu.kz/login/token.php?username=#{params[:username]}&password=#{params[:password]}&service=MYUSTAZ")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        request = Net::HTTP::Get.new(url)
        request["x-api-key"] = ENV["SYGIC_API_KEY"]
        request["cache-control"] = 'no-cache'
        response = http.request(request)
        data = JSON.parse(response.body)
        if data['errorcode'] != "invalidlogin"
          if @user = User.find_by(dl_username: params[:username])
            session[:auth] = @user
          else
            @user = User.new
            @user.dl_username = params[:username]
            @user.role = 0
            @user.save
            session[:auth] = @user
          end
          redirect_to root_path, notice: 'Добро пожаловать'
        else
          redirect_to login_path, notice: 'Неверный логин или пароль'
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

  def logout
    session[:auth] = nil
    redirect_back fallback_location: root_path
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
    if auth
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
    else
      redirect_to login_path, notice: 'Авторизуйтесь для совершения этого действия'
    end
  end

end