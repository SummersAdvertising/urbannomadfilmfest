class StaticPageController < ApplicationController
  layout "index", only: [:index]
  def index
  	@news = News.order('created_at DESC').page(params[:page])
  end
  def intro 	
  end
end
