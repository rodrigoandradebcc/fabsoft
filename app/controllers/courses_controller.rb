class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy, :registered_students]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
    add_breadcrumb "List Courses", courses_path
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    add_breadcrumb "List Courses", courses_path
    add_breadcrumb "Show Course", course_path(@course)
  end

  # GET /courses/new
  def new
    @members = Member.includes(:roles).where("roles.name = 'membro'")
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
    @members = Member.includes(:roles).where("roles.name = 'membro'")
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course }
      else
        format.html { render action: 'new' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def register
    @course = Course.find(params[:id])
    if current_user.present? && current_user.role?("estudante") 
      @course.users << current_user
      @course.update_attributes(users: @course.users)
      redirect_to root_path, notice: "Course was successfully updated."
    else
      redirect_to root_path, alert: "Course wasn't successfully updated."
    end
  end


  def registered_students
    # Recover from db, students that had been registered in that course.
    add_breadcrumb "List Courses", courses_path
    add_breadcrumb "List Students", registered_students_courses_path(@course)
    @students = User.includes(:courses).where("courses.id = '#{@course.id}' && type = 'Student'")
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  def current_courses
    @courses = Course.all
    add_breadcrumb "List Courses", courses_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :workload, :specification, :start_date, :end_date, :maximum_capacity, :minimum_capacity, :image, :url,:user_ids => [])
    end
end
