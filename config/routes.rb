WebAppRails::Application.routes.draw do

  root :to => 'assignments#index'
  get 'login' => 'users#login'
  get 'logout' => 'sessions#destroy', as: :signout  


  # OMNIAUTH
  get '/auth/github/callback', to: 'sessions#create'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure' => redirect('/')
  get '/signin' => redirect('/auth/github')
  # get '/signout', to: 'sessions#destroy', as: :signout

  post '/homeworks/rspec', to: 'homeworks#rspec'

  resources :plans
  resources :mockups
  resources :assignments

  
  
  # get 'github-oauth' => 'assignments#index'
  # get 'callback' => 'users#callback'
  # # get 'github-oauth' => 'assignments#index'

  # GRIDDLER
  # mount using default path
  # mount_griddler
  # mount using a custom path
  # mount_griddler('/email/incoming')
  # the "get off my lawn", DIY approach:
  #post '/email_processor' => 'griddler/emails#create'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
