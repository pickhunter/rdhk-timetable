Rails.application.routes.draw do
  get 'batches/index'

  get 'batches/showbatchtt/:id' => 'batches#showbatchtt'
  get 'timeslots/yearindex'

  get 'timeslots/index'
  post 'timeslots/update'
  get 'timeslots/returnbatches'
   get 'timeslots/returnrembatches'
   get 'timeslots/returnrooms'
   get 'timeslots/yearmakeindex'
   get 'timeslots/yearshowindex'
   get 'teachers/showteachertt/:id' => 'teachers#showteachertt'
   get 'rooms/showroomtt/:id' => 'rooms#showroomtt'

  get 'batch_subjects/index'
  get 'batch_subjects/yearindex'


  patch 'batch_subjects/:id' => 'batch_subjects#update' , :as => 'edit_batch_subject'
  get 'batch_subjects/:id' => 'batch_subjects#show'

  get 'subjects/index'

  get 'home/index'
  # resources :batch_subjects , only: [:show, :index , :edit , :update]
  resources :bookings
  resources :departments
  resources :departments
  resources :time_tables
  resources :departments
  resources :teachers do resources:subjects end
  resources :rooms
  resources :slots
  get 'login' => 'sessions#new'
   post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
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
