class AppController < ApplicationController
  # binding.pry
  def index
    @posts = Post.all
    @categories = CategorySubject.all.limit(5)
    @universities = University.all.limit(5)
  end

  def categorySubject
    if @category = CategorySubject.find_by(id: params[:id])
      @categories = CategorySubject.all.limit(5)
      @universities = University.all.limit(5)
      @subjects = Subject.where(category_subject_id: params[:id])
    else
      redirect_to '/404'
    end
  end

  def university
    if @university = University.find_by(id: params[:id])
      @teachers = Teacher.where(university_id: params[:id])
    else
      redirect_to '/404'
    end
  end

  def teacher
    unless auth
      redirect_to login_path
    else
      if @teacher = Teacher.find_by(id: params[:id])
        @rate = Cost.find_by('teacher_id = ? and user_id = ?', params[:id], session[:auth]['id'])
        @cost = Cost.where(teacher_id: params[:id]).average(:value)
        if @cost == nil
          @cost = 0
        else
          @cost = @cost.round(1)
        end
        @tags  = Tag.all
        @commentaries = Commentary.where(teacher_id: params[:id], status: 1)
      else
        redirect_to '/404'
      end
    end
  end

  def rate
    if Cost.find_by('teacher_id = ? and user_id = ?', params[:teacher], session[:auth]['id'])
      @c = Cost.find_by('teacher_id = ? and user_id = ?', params[:teacher], session[:auth]['id'])
      @c.value = params[:val]
      @c.save
      redirect_back(fallback_location: root_path)
    else
      @c = Cost.new
      @c.teacher_id = params[:teacher]
      @c.user_id = session[:auth]['id']
      @c.value = params[:val]
      @c.save
      redirect_back(fallback_location: root_path)
    end
  end
end