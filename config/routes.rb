Nuedu::Application.routes.draw do

  resources :announcements

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users , path_names: {sign_in: "login", sign_out: "logout"}, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  get "welcome/index"
  root "welcome#index"

  get 'become/:role' => "roles#add_role", as: "add_role"
  get 'abandom/:role' => "roles#remove_role", as: "remove_role"

  get 'account', to: 'account#show', as: 'account'

  get 'videos/:id/play', to:'videos#play', as: 'play_video'
  get 'videos/:id/watched', to: 'videos#watched'
  post 'exams/:id/finish', to: 'exams#finish', as: 'finish_exam'

  resources :courses, only: [:index, :show] do
    member do
      get 'enroll'
      get 'intro'
      get 'announcements'
    end
    resources :steps , only: [:index, :show] do
      resources :exams

      resources :videos do
        resources :exams
      end
    end
  end
  resources :reviews


  namespace :teacher do
    get 'account', to: 'account#show', as: 'account'

    resources :courses do
      resources :announcements
      resources :attachments
      resources :steps do
        resources :attachments
        resources :videos do
          new do
            get  :save
          end
          resources :exams do
            resources :questions
            resources :answers
          end
        end
        resources :exams do
          resources :questions
          resources :answers
        end
      end

      member do
        get 'publish'
        get 'draft'
        patch 'categories'
        get 'select_categories'
      end
    end
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
