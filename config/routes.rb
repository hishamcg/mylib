Learn::Application.routes.draw do

  get "/user" ,:to => 'mylib#welcome' , as:'welcome'
  match "/mylib/check" , as:'check'
  get "/mylib/user" , as:"user"
  get "/mylib/signup", as:'signup'
  get "mylib/logout" , as:'logout'
  post "mylib/create" , as:'users'
  get "mylib/hello" , to: 'mylib#hello', as:"hello" 
 # get "mylib/fiction" , as: "fiction"
 # get "mylib/triller" , as: "triller"
 # get "mylib/romance" , as: "romance"
  get "category/:category_name" , to: 'mylib#category', as: "category"
  get "mylib/proceedtopay" , as: "proceedtopay"
  get "mylib/admin" ,as:"admin"
  get "mylib/edit/:id",to:'mylib#edit' , as: "edit"
  put "mylib/update/:id" ,to:"mylib#update", as: "book"
  delete "mylib/destroy/:id" ,to: "mylib#destroy" ,as:"destroy"
  get "/mylib/addnewbook" ,as: 'addnewbook'
  post "mylib/newbook" ,as: 'books'
  get "mylib/search" ,as: 'search'
 # get "mylib/wrong" ,as:"wrong"
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :productsnN

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
