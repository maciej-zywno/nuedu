Nuedu::Application.routes.draw do

  # mount RailsEmailPreview::Engine, at: 'emails'
  comfy_route :cms_admin, :path => '/cms_admin'


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
  get 'exams/:id/show', to: 'exams#show', as: 'show_exam'

  resources :courses, only: [:index, :show] do
    resources :forums, only: [] do
        resources :topics do
          resources :posts
        end
    end

    member do
      get 'enroll'
      get 'intro'
      get 'announcements'
      get 'forum'
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


    resources :courses, except: [:show] do
      resources :forums, only: [:show] do
          new do
            get  :attach
          end

        resources :topics do
          resources :posts
        end
      end
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

  comfy_route :cms, :path => '/', :sitemap => false
end
