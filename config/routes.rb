Rails.application.routes.draw do

  root 'user#timeline'

  # get 'homepage' => 'home#index', as: :home

  get 'sign_in' => 'session#new', as: :sign_in
  post 'sign_in' => 'session#create'
  get 'sign_out' => 'session#delete', as: :sign_out

  get 'sign_up' => 'user#new', as: :new_user
  post 'sign_up' => 'user#create', as: :users
  get ':name' => 'user#show', as: :user

  get 'posts/all' => 'posts#index', as: :posts
  get 'posts/new' => 'posts#new', as: :new_post
  get 'posts/:id' => 'posts#show', as: :post
  post 'posts/all' => 'posts#create'
  get 'posts/:id/edit' => 'posts#edit', as: :edit_post
  patch 'posts/:id' => 'posts#update'
  delete 'posts/:id' => 'posts#delete'

  get 'user/edit-photo/:id' => 'user#edit_photo', as: :edit_photo
  patch ':id'=> 'user#update_photo'

  get 'user/:name/follow' => 'user#follow', as: :follow
  patch 'user/:name/follow' => 'user#follow'
  get 'user/:name/unfollow' => 'user#unfollow', as: :unfollow
  patch 'user/:name/unfollow' => 'user#unfollow'

  get 'user/:name/block' => 'user#block', as: :block
  patch 'user/:name/block' => 'user#block'
  get 'user/:name/unblock' => 'user#unblock', as: :unblock
  patch 'user/:name/unblock' => 'user#unblock'

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
