Rails.application.routes.draw do

  root to: 'products#index'

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  resources :orders, only: [:create, :show]

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, only: [:index, :new, :create]
  end

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

# Routes
#            Prefix Verb   URI Pattern                   Controller#Action
#              root GET    /                             products#index
#          products GET    /products(.:format)           products#index
#           product GET    /products/:id(.:format)       products#show
#          category GET    /categories/:id(.:format)     categories#show
#     add_item_cart POST   /cart/add_item(.:format)      carts#add_item
#  remove_item_cart POST   /cart/remove_item(.:format)   carts#remove_item
#              cart GET    /cart(.:format)               carts#show
#            orders POST   /orders(.:format)             orders#create
#             order GET    /orders/:id(.:format)         orders#show
#        admin_root GET    /admin(.:format)              admin/dashboard#show
#    admin_products GET    /admin/products(.:format)     admin/products#index
#                   POST   /admin/products(.:format)     admin/products#create
# new_admin_product GET    /admin/products/new(.:format) admin/products#new
#     admin_product DELETE /admin/products/:id(.:format) admin/products#destroy
