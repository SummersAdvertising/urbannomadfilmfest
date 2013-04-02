class StaticPageController < ApplicationController
  layout false, only: [:index]
  def index
  	@category = Category.where( :namehash => 'full' ).first
  	# get film list
  	@briefs = @category.briefs.order( "date DESC" ).all
  
	  	  
  
  end
  def intro 	
  end
end
