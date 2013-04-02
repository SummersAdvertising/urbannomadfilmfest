class Admin::BriefsController < ApplicationController
  before_filter :require_is_admin
  before_filter :get_category
  
  layout 'admin'
  def index
  	@categories = Category.all
  	
    @briefs = @category.briefs.order('date DESC').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @brief }
    end
  end

  # GET /brief/1
  # GET /brief/1.json
  def show
    @brief = Brief.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @brief }
    end
  end

  # GET /brief/1/edit
  def edit
    @brief = Brief.find(params[:id])
    @photo = BriefPhoto.new
  end

  #create photo
  def createPhoto
    @brief = Brief.find(params[:brief_id])
    @photo = @brief.brief_photos.new(params[:brief_photo])
    
    respond_to do |format|
      if @photo.save
        #format.html { redirect_to photos.path } #index.html.erb
        format.json { render json: @photo, status: :created, location: @photo }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end
  
  def destroyPhoto
    @photo = BriefPhoto.find(params[:id])
    #File.delete("/public" + @photo.image) #carrierwave will handle this.
    @photo.destroy

    respond_to do |format|
          #format.html { redirect_to :controller => 'photos', :action => 'index' }
          format.js
          format.json { head :no_content }
      end
  end

  # POST /brief
  # POST /brief.json
  def create
    @brief = @category.briefs.build(params[:brief])
    @brief.new_create = true

    respond_to do |format|
      if @brief.save
        format.html { redirect_to edit_admin_category_brief_path(@category, @brief, :locale => I18n.locale), notice: 'Brief was successfully created.' }
        format.json { render json: @brief, status: :created, location: @brief }
      else
        format.html { render action: "new" }
        format.json { render json: @brief.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /brief/1
  # PUT /brief/1.json
  def update
    @brief = Brief.find(params[:id])

    respond_to do |format|
      if @brief.update_attributes(params[:brief])
        format.html { redirect_to admin_category_brief_path(@category, @brief, :locale => I18n.locale), notice: 'Brief was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @brief.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brief/1
  # DELETE /brief/1.json
  def destroy
    @brief = Brief.find(params[:id])
    @brief.destroy

    respond_to do |format|
      format.html { redirect_to admin_category_briefs_path( @category ) }
      format.json { head :no_content }
    end
  end
  
private
  def get_category
  	@category = Category.where( "id = '#{params[ :category_id ]}' OR namehash = '#{params[ :category_id ]}'" ).first
  end
  
end

