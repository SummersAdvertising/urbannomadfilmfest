class StaticPageController < ApplicationController
  layout false, only: [:index]
  def index
  	@category = Category.where( :namehash => 'full' ).first
  	# get film list
  	@briefs = @category.briefs.order( "date DESC" ).all
  
	  	  
  
  end
  def show
  	@page = params[ :page ]
  	
  	respond_to do | format |
  		format.html{ render :template => "static_page/schedule" }
  	end
  	
  end
end
