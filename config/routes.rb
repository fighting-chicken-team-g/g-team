Rails.application.routes.draw do
    devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  devise_for :end_users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  namespace :admin do
    get 'homes/top' => 'homes#top'
    resources :end_users, only: [:index, :show, :edit]
    resources :foods, only: [:new, :index, :show, :edit]
    resources :orders, only: [:show]
    resources :genres, only: [:index, :edit]
    resources :deliveries, only: [:index, :edit]
  end

  scope module: :public do
    root 'homes#top'
    get 'homes/about' => 'homes#about'
    resource :end_users, only: [:show, :edit]
    resources :foods, only: [:index, :show]
    resources :carts, only: [:index]
    resources :orders, only: [:index, :show]
    resources :deliveries, only: [:index, :edit]
  end

  devise_scope :admin do
    post 'admins/sign_in', to: 'admin/sessions#sign_in'
  end
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
