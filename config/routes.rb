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
  end

  namespace :admin do
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
