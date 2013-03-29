class StaticPageController < ApplicationController
  layout false, only: [:index]
  def index
  
  	# get film list
  	@briefs = Brief.order( "updated_at DESC" ).all
  
	  	  
  
  end
  def intro 	
  end
end
