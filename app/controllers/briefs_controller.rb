class BriefsController < ApplicationController
  before_filter :get_category

 def index
 	@briefs = @category.briefs.order( 'date DESC' )
 end

  # GET /briefs/1
  # GET /briefs/1.json
  def show
    @brief = Brief.find(params[:id])
    seek_flag = false    
    
    @briefs = @category.briefs.where( :status => "enable" ).order( "date DESC" )
    
    @briefs.each do | br |
    	@next = br
    	@prev = br if @prev.nil?    	
    	
    	if br.id == @brief.id
	    	seek_flag = true
	    	next
    	end
    	
    	break if seek_flag
    	
    	@prev = br
    	
    end
    
    @next = @briefs.first if @next.id == @brief.id
    @prev = @briefs.last if @prev.id == @brief.id
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @brief }
    end
  end
  
private
  def get_category
  	@category = Category.where( "id = '#{params[ :category_id ]}' OR namehash = '#{params[ :category_id ]}'" ).first
  end
  
end
