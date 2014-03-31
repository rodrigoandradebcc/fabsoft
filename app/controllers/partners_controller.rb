class PartnersController < ApplicationController
  before_action :set_partner, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /partners
  # GET /partners.json
  def index
    @partners = Partner.all
    add_breadcrumb "List Partners", partners_path
  end

  # GET /partners/1
  # GET /partners/1.json
  def show
    add_breadcrumb "List Partners", partners_path
    add_breadcrumb "Show Partners", partner_path(@partner)
  end

  # GET /partners/new
  def new
    @partner = Partner.new
    add_breadcrumb "List Partners", partners_path
    add_breadcrumb "Create Partners", new_partner_path
  end

  # GET /partners/1/edit
  def edit
    add_breadcrumb "List Partners", partners_path
    add_breadcrumb "Show Partner", partner_path(@partner)
    add_breadcrumb "Edit Partner", edit_partner_path(@partner)
  end

  # POST /partners
  # POST /partners.json
  def create
    @partner = Partner.new(partner_params)

    if @partner.save
      if params[:partner][:image].present?
        render :crop
      else
        redirect_to @partner, notice: 'partner was successfully created.'
      end
    else
      render :new
    end
  end

  # PATCH/PUT /partners/1
  # PATCH/PUT /partners/1.json
  def update
   if @partner.update(partner_params)
       if params[:partner][:image].present?
         render :crop
       else
         redirect_to @partner, notice: 'partner was successfully updated.'
       end
     else
       render :new
     end
  end

  # DELETE /partners/1
  # DELETE /partners/1.json
  def destroy
    @partner.destroy
    respond_to do |format|
      format.html { redirect_to partners_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partner
      @partner = Partner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def partner_params
      params.require(:partner).permit(:name, :description, :url, :crop_x, :crop_y, :crop_w, :crop_h, :image)
    end
end
