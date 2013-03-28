Urbannomadfilmfest::Application.routes.draw do

  scope "(:locale)/" do
  	resources :briefs
  	
	match "/admin/createAdmin" => "admin#createAdmin", :via => :post
	match "/admin/loginCheck" => "admin#loginCheck", :via => :post
	match "/admin/update" => "admin#update", :via => :put
	
	namespace :admin do
		get '/' => 'admin#showAdmins'    
		get "sign_up", "log_in", "log_out", "edit"
		
		match 'showAdmins' => 'admin#showAdmins' 
		
		resources :categories, :except => [:new, :edit, :destroy] do
			resources :briefs, :except => :new do
			  match 'uploadPhoto' => 'briefs#createPhoto', :via => [:post]
			  match 'deletePhoto/:id' => 'briefs#destroyPhoto', :via => [:delete]
			end
		end
	end
	
	root :to => "static_page#index"
  	
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
