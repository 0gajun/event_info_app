Rails.application.routes.draw do

  get 'places/new'

  get 'places/create'

  get 'places/edit'

  get 'places/update'

  get 'places/index'

  resources :users, only: [:new, :create, :edit, :update, :index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :event_infos, only: [:new ,:create, :edit, :update, :show, :index, :destroy]
  resources :places, only:[:new, :create, :edit, :update, :index, :destroy]
  resources :categories, only:[:new, :create, :edit, :update, :index, :destroy]

  root 'sessions#new'

  match '/json/EventTableApi',        to: 'json#event_table_api',         via: 'get'
  match '/json/DescriptionTableApi',  to: 'json#description_table_api',   via: 'get'
  match '/json/CategoryTableApi',     to: 'json#category_table_api',      via: 'get'
  match '/json/PlaceTableApi',        to: 'json#place_table_api',         via: 'get'
  match '/json/RevisionApi',          to: 'json#revision_api',            via: 'get'
  match '/my_page',           to: 'users#show',             via: 'get'
  match '/about',             to: 'static_pages#about',     via: 'get'
  match '/create_user',       to: 'users#new',              via: 'get'
  match '/signout',           to: 'sessions#destroy',       via: 'delete'
  match '/register_eventinfo',to: 'event_infos#new',         via: 'get'
  match '/event_info/approve',to: 'event_infos#approve',    via: 'post'
  match '/event_info/reject', to: 'event_infos#reject',     via: 'post'
  match '/event_info/rebuild',to: 'event_infos#rebuild',    via: 'post'
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
