TextoRails3::Application.routes.draw do |map|
  # Profile
  resource :profiles
  namespace :profiles do
    resources :textos, :only => [:index,:destroy]
    resources :comments, :only => [:destroy]
  end


  devise_for :users, :admin
  
  resources :admins, :only => [:index]
  #  resources :textos, :controller => "admins/texto"
  #end
  
  namespace :admins do
  	
  	resources :textos do
  	  member do
  	    get :approve
  	  end
  	end
  	
  	resources :comments, :only => [:index, :destroy]
  
  end
  
  


  resources :textos do
    resources :comments
    
    member do
      get :vote_up, :vote_down, :favorite
    end
    
    collection do 
      get :add_field, :random
    end
  end
  match 'textos/best_by/:group_by' => 'textos#best_by', :as => 'best_textos_by'
  match 'textos/worst_by/:group_by' => 'textos#worst_by', :as => 'worst_textos_by'

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
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
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
  #       get :recent, :on => :collection
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
  root :to => "textos#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
