Rails.application.routes.draw do


  devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
  }

  scope module: :public do
        root to: "homes#top"
        get 'homes/about' => "homes#about", as: 'about'
    resources :users, except: [:new, :edit, :create, :index, :show, :destroy, :update] do
      collection do
        get 'my_page'
        get 'unsubscribe'
        get 'park_favorites'
        get 'sento_favorites'
        patch 'update'
        patch 'withdraw'
      end
      member do
        get 'posts'
      end
    end
        resources :park_favorites, only: [:create, :destroy]
        resources :sento_favorites, only: [:create, :destroy]
        get 'users//information/edit' => "users#edit", as: 'edit_information_user'
    resources :sentos, only: [:index, :show] do
      member do
        get 'reviews'
      end
      collection do
        get 'sento_tags'
      end
    end
    resources :parks, only: [:index, :show] do
      member do
        get 'reviews'
      end
    end
    resources :posts, only: [:create, :index, :edit, :update, :destroy] do
      resource :likes, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    get 'search' => "searches#search", as: 'search'
  end

  namespace :admin do
    resources :users, only: [:show, :index, :edit, :update, :destroy] do
      member do
        get 'posts'
      end
    end
    resources :posts, only: [:index, :show, :destroy] do
      resources :post_comments, only: [:destroy]
    end
    resources :sentos, only: [:new, :create, :index, :show, :edit, :update]
    resources :parks, only: [:new, :create, :index, :show, :edit, :update]
    resources :sento_tags, only: [:index,:create, :edit, :update]
  end

end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

