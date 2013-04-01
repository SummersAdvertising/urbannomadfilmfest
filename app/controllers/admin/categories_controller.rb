class Admin::CategoriesController < ApplicationController
	def index
		@category = Category.where( :namehash => "full" ).first
	
		respond_to do | format |
			format.html{ redirect_to admin_category_briefs_path(@category, :locale => I18n.locale) }
		end
	end
end
