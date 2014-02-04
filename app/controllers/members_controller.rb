class MembersController < ApplicationController
  load_and_authorize_resource
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
    add_breadcrumb "List Members", members_path
  end

  # GET /members/1
  # GET /members/1.json
  def show
    add_breadcrumb "List Members", members_path
    add_breadcrumb "Show Members", member_path(@member)
  end

  # GET /members/new
  def new
    @member = Member.new
    add_breadcrumb "List Members", members_path
    add_breadcrumb "Create Member", new_member_path
  end

  # GET /members/1/edit
  def edit
    add_breadcrumb "List Members", members_path
    add_breadcrumb "Show Member", member_path(@member)
    add_breadcrumb "Edit Member", edit_member_path(@member)
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    if @member.save
      if params[:member][:image].present?
        render :crop
      else
        redirect_to @member, notice: "Member was successfully created."
      end
    else
      render :new
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    if @member.update(member_params)
       if params[:member][:image].present?
         render :crop
       else
         redirect_to @member, notice: 'Member was successfully updated.'
       end
     else
       render :new
     end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:email, :password, :password_confirmation, :phone, :cellphone, 
        :facebook, :rg, :cpf, :entry_date, :address, :login, :name, :role_ids, :roles, :twitter, 
        :github, :gplus, :linkedin, :crop_x, :crop_y, :crop_w, :crop_h, :image)
    end
end
