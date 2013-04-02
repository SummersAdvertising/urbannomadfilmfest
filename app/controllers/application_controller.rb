class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :location
  
  def default_url_options(options={})  
    { :locale => I18n.locale }
  end
  
  def location
    
    I18n.t :missing, :default => '{Not here}'
    
  	if params[ :locale ]
  		I18n.locale = params[ :locale ]
  	end
  
  end

  def require_is_admin
  	unless(session[:admin])
  		redirect_to admin_log_in_path
  	end
  end

end
