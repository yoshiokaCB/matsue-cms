class Admin::SiteStructuresController < ApplicationController
  before_action :set_admin_site_structure, only: [:show, :edit, :update, :destroy]

  # GET /admin/site_structures
  # GET /admin/site_structures.json
  def index
    # @admin_site_structures = Admin::SiteStructure.all
    # parent_id = params[:category_id] || 0
    site_structure = Admin::SiteStructure.where(id: params[:category_id]).first
    parent_id      = site_structure.present? ? site_structure.category.id : 0
    @admin_site_structures = Admin::SiteStructure.where(parent_id: parent_id)
  end

  # GET /admin/site_structures/1
  # GET /admin/site_structures/1.json
  def show
  end

  # GET /admin/site_structures/new
  def new
    @admin_site_structure = Admin::SiteStructure.new
  end

  # GET /admin/site_structures/1/edit
  def edit
  end

  # POST /admin/site_structures
  # POST /admin/site_structures.json
  def create
    @admin_site_structure = Admin::SiteStructure.new(admin_site_structure_params)

    respond_to do |format|
      if @admin_site_structure.save
        format.html { redirect_to @admin_site_structure, notice: 'Site structure was successfully created.' }
        format.json { render :show, status: :created, location: @admin_site_structure }
      else
        format.html { render :new }
        format.json { render json: @admin_site_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/site_structures/1
  # PATCH/PUT /admin/site_structures/1.json
  def update
    respond_to do |format|
      if @admin_site_structure.update(admin_site_structure_params)
        format.html { redirect_to @admin_site_structure, notice: 'Site structure was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_site_structure }
      else
        format.html { render :edit }
        format.json { render json: @admin_site_structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/site_structures/1
  # DELETE /admin/site_structures/1.json
  def destroy
    @admin_site_structure.destroy
    respond_to do |format|
      format.html { redirect_to admin_site_structures_url, notice: 'Site structure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_site_structure
      @admin_site_structure = Admin::SiteStructure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_site_structure_params
      params.require(:admin_site_structure).permit(
          :page_id,
          :category_id,
          :parent_id,
          :category_primary,
          :children_pages_count,
          :children_categories_count,
          :routes,
          :sort
      )
    end
end
