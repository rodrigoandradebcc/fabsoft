class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
    add_breadcrumb "List Projects", projects_path
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    add_breadcrumb "List Projects", projects_path
    add_breadcrumb "Show Projects", project_path(@project)
  end

  # GET /projects/new
  def new
    @project = Project.new
    add_breadcrumb "List Projects", projects_path
    add_breadcrumb "Create Project", new_project_path
  end

  # GET /projects/1/edit
  def edit
    add_breadcrumb "List Projects", projects_path
    add_breadcrumb "Show Project", project_path(@project)
    add_breadcrumb "Edit Project", edit_project_path(@project)
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    if @project.save
      if params[:project][:image].present?
        render :crop
      else
        redirect_to @project, notice: 'Project was successfully created.'
      end
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
     if @project.update(project_params)
       if params[:project][:image].present?
         render :crop
       else
         redirect_to @project, notice: 'Project was successfully updated.'
       end
     else
       render :new
     end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :description, :image, :url, :crop_x, :crop_y, :crop_w, :crop_h)
    end
end
