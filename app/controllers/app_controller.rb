class AppController < ApplicationController

  def index
    @topTeacher = Teacher.joins(:rates, :university).group('teachers.id').order('avg(rates.value) DESC').limit(1).take()
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
    if @teacher = Teacher.find_by(id: params[:id])
      @rate = auth ? Rate.find_by('teacher_id = ? and user_id = ?', params[:id], session[:auth]['id']).value : 0
      @tags  = Tag.all
      @commentaries = Commentary.where(teacher_id: params[:id], status: 1)
    else
      redirect_to '/404'
    end
  end

  def rate
    if auth
      if Rate.find_by('teacher_id = ? and user_id = ?', params[:teacher], session[:auth]['id'])
        @c = Rate.find_by('teacher_id = ? and user_id = ?', params[:teacher], session[:auth]['id'])
        @c.value = params[:val]
        @c.save
        redirect_back(fallback_location: root_path)
      else
        @c = Rate.new
        @c.teacher_id = params[:teacher]
        @c.user_id = session[:auth]['id']
        @c.value = params[:val]
        @c.save
        redirect_back(fallback_location: root_path)
      end
    else
      redirect_to login_path, notice: 'Авторизуйтесь для выполнения действия'
    end
  end

  def rating
    @averageQuery = Teacher.joins(:department, :university, 'LEFT OUTER JOIN rates ON rates.teacher_id = teachers.id').group('id').order('avg(rates.value) ASC')
    @average = @averageQuery.limit(5)
  end

  def search_api
    @search = Teacher.where("teachers.name LIKE :name OR teachers.surname LIKE :name", {:name => "%#{params[:search]}%"}).limit(2)
    render json: @search, :include => {:university => {only: [:name, :id]}, :rates => {only: :value}, :subjects => {only: [:id, :name]}, :department => {only: [:id, :name]}}
  end

  def search
    @title = "Результаты поиска"
    search = params[:search]
    show = params[:show]
    if search && search.length > 0
      @title = "Результаты поиска по запросу: #{search}"
    end
    department = Integer(params[:department]) rescue false
    subject = Integer(params[:subject]) rescue false
    @filter_department = nil
    @filter_subject = nil
    @filter_sort = nil
    @query = Teacher.joins(:university, :department, 'LEFT OUTER JOIN rates ON rates.teacher_id = teachers.id').where("teachers.name LIKE :name OR teachers.surname LIKE :name", {:name => "%#{search}%"}).group('teachers.id')
    if (department && subject)
      @query = Teacher.joins(:university, :department, :subjects, 'LEFT OUTER JOIN rates ON rates.teacher_id = teachers.id').where("(teachers.name LIKE :name OR teachers.surname LIKE :name) AND subjects.id = :subject AND department_id = :department", {:name => "%#{search}%", :subject => subject, :department => department}).group('teachers.id')
      @filter_department = Department.find_by(id: department)
      @filter_subject = Subject.find_by(id: subject)
    elsif(department)
      @query = Teacher.joins(:university, :department, :subjects, 'LEFT OUTER JOIN rates ON rates.teacher_id = teachers.id').where("(teachers.name LIKE :name OR teachers.surname LIKE :name) AND teachers.department_id = :department", {:name => "%#{search}%", :department => department}).group('teachers.id')
      @filter_department = Department.find_by(id: department)
    elsif(subject)
      @query = Teacher.joins(:university, :department, :subjects, 'LEFT OUTER JOIN rates ON rates.teacher_id = teachers.id').where("(teachers.name LIKE :name OR teachers.surname LIKE :name) AND subjects.id = :subject", {:name => "%#{search}%", :subject => subject}).group('teachers.id')
      @filter_subject = Subject.find_by(id: subject)
    end
    sort = Integer(params[:sort]) rescue false
    if sort
      sort_query = case sort
                   when 0
                     'avg(rates.value) DESC'
                   when 1
                     'avg(rates.value) ASC'
                   when 2
                     'teachers.surname ASC'
                   else
                     'avg(rates.value) DESC'
                   end
      @query = @query.order(sort_query)
      @filter_sort = case sort
                     when 0
                       'по рейтингу (убывание)'
                     when 1
                       'по рейтингу (возрастание)'
                     when 2
                       'по алфавиту'
                     else
                       nil
                     end
    end
    @search = @query.limit(10)
    if_number = Integer(show) rescue false
    if show && if_number.is_a?(Integer) || show == 'all'
      show = if_number.is_a?(Integer) ? if_number : show
      show = show == 'all' ? nil : show
      @search = @query.limit(show)
    end
    show = show ? show : 10
    @isAll = show >= @query.length ? true : false
    @departments = Department.all
    @subjects = Subject.all
  end

  def news
    @title = "Новости"
    @news = Post.all
    if params[:query]
      @news = Post.where('title LIKE :query', {:query => "%#{params[:query]}%"})
    end
  end
end