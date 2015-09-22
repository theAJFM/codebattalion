Rails.application.routes.draw do
  get 'profile/index'

  get 'submissions/index'

  get 'error/404'

  get 'welcome/index'
  get 'login' => 'login#index'
  get 'signup' => 'signup#index'
  get 'problems' => 'problems#index'
  get 'problems/:id' => 'problems#single'
  get 'leaderboard' => 'leaderboard#index'
  post 'login/create'
  get 'logout' => 'login#destroy'
  post 'signup/create'
  get 'create_problem' => 'problems#create'
  post 'problems/submit_result'
  get 'submission_res' => 'problems#submit_result'
  post 'problems/new'
  post 'search' => 'problems#search'
  get 'submissions/:id' => 'submissions#index', as: 'submissions'
  get 'profile/:id' => 'profile#index', as: 'profile'
  get 'edit_profile' => 'profile#edit'
  post 'editprof' => 'profile#editprof', as: 'editprof'
  get 'change_pass' => 'profile#change_pass'
  post 'editpass' => 'profile#editpass', as: 'editpass'
  get 'edit/:id' => 'problems#edit', as: 'edit'
  get 'list_of_created' => 'problems#list'
  post 'problems/editprob'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
