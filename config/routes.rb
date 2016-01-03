Rails.application.routes.draw do

  get 'sessions/new'

  get 'users/new'

#  get 'static_pages/about'
  get 'home' => 'static_pages#home'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'terms_and_conditions' => 'static_pages#terms_and_conditions'
  get 'test1' => 'users#test1'
  get 'rake' => 'users#rake'
#  get 'static_pages/help'
  get 'help' => 'static_pages#help'
  get 'signup' => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :contacts, only: [:new, :create]
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :clients,          only: [:new, :create, :destroy, :show, :index, :edit, :update]
  resources :banks,          only: [:new, :create, :show, :index, :destroy, :edit, :update]
  resources :accountingfirms,          only: [:new, :create, :show, :index, :destroy, :edit]
  resources :bankcontacts,          only: [:new, :create, :show, :index, :destroy]
  resources :confirmations,          only: [:new, :create, :show, :index, :destroy]
  resources :attachments,          only: [:new, :create, :show, :index, :destroy]
 
  resources :attached_files, only: [:index, :new, :create, :destroy]
  
  patch '/bankaccounts/:id' => 'useractions#answer_with_comments'

  patch '/confirmations/:id' => 'confirmations#update'


  get 'confirmations/:id/check_by_auditor' => 'confirmations#check_by_auditor', as: 'check_by_auditor'
  get 'confirmations/:id/check_by_bank' => 'confirmations#check_by_bank', as: 'check_by_bank'

  get 'users/bankcontactupdate/:id' => 'users#bankcontactupdate', as: 'bankcontactupdate'
  get 'users/clientcontactupdate/:id' => 'users#clientcontactupdate', as: 'clientcontactupdate'

  get 'bankuser/new' => 'users#new_bankuser' 

  get 'test'=>'tests#scheduler'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'confirmations#index'
   

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
