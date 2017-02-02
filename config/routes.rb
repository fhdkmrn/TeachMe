Rails.application.routes.draw do
  resources :courses
  resources :feedbacks
  get 'user/show'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'signup', to: 'users#create', :as => :user
  post 'signup', to: 'users#new'
  get 'dashboard', to: 'main#dashboard', :as => :dashboard
  get 'search', to: 'main#search', :as => :search

  resources :sessions, only: [:create, :destroy]
  # resources :users

  root to: "users#show"

  get 'requests', to: 'requests#index'
  resources :requests
  get 'request/:id', to: 'requests#show', as: :request_path
  get 'course_requests/:id', to: 'requests#by_course', as: :course_requests
  get :send_acceptance_mail, to: 'requests#send_acceptance_mail', as: :send_acceptance_mail
  get "requests/send_acceptance_mail", to: 'requests#send_acceptance_mail'
  get :send_acceptance_info, to: 'requests#send_acceptance_info', as: :send_acceptance_info
  get 'request/confirm/:request/:user', to: "requests#confirmRequest"

  get 'users/edit', to: 'users#edit', as: :edit_user
  patch 'signup.:id', to: 'users#update'
  patch 'users/signup/:id', to: 'users#update', as: :update_user

  get 'users/my_profile', to: 'users#profile'
  get 'users/:id', to: 'users#others', as: :user_path
  get :star, to: 'courses#star', as: :star
  get :unstar, to: 'courses#unstar', as: :unstar
  get "search_course", to: 'courses#search'

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
