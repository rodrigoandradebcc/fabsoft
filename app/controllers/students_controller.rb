class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
    add_breadcrumb "List Students", students_path
  end

  # GET /students/1
  # GET /students/1.json
  def show
    add_breadcrumb "List Students", students_path
    add_breadcrumb "Show Students", student_path(@student)
  end

  # GET /students/new
  def new
    @student = Student.new
    add_breadcrumb "List Students", students_path
    add_breadcrumb "Create Student", new_student_path
  end

  # GET /students/1/edit
  def edit
    add_breadcrumb "List Students", students_path
    add_breadcrumb "Show Student", student_path(@student)
    add_breadcrumb "Edit Student", edit_student_path(@student)
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    if @student.roles.empty?
      @student.roles << Role.where(name: "estudante")
    end
    if @student.save
      if params[:student][:image].present?
        render :crop
      else
        redirect_to @student, notice: "Student was successfully created."
      end
    else
      render :new
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    if @student.update(student_params)
       if params[:student][:image].present?
         render :crop
       else
         redirect_to @student, notice: 'Student was successfully updated.'
       end
     else
       render :new
     end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:email, :password, :password_confirmation, :login, :name,
      	:roles, :crop_x, :crop_y, :crop_w, :crop_h, :image, :institution, :semester, :role_ids => [])
    end
end
