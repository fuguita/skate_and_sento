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
      end
      member do
        get 'posts'
        patch 'update'
        patch 'withdraw'
      end
    end
        get 'users/:id/information/edit' => "users#edit", as: 'edit_information_user'

    resources :sentos

    resources :parks, only: [:index, :show] do
      member do
        get 'reviews'
      end
    end


  end



  namespace :admin do
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
