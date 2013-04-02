class StaticPageController < ApplicationController
  layout false, only: [:index]
  def index
  
  	# get film list
  	@briefs = Brief.order( "date DESC" ).all
  
	  	  
  
  end
  def intro 	
  end
end
