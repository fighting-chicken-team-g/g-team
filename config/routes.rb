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
    resources :end_users, only: [:index, :show, :edit, :update]
    resources :foods, only: [:new, :index, :show, :edit, :create, :update]
    resources :orders, only: [:index, :show, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :deliveries, only: [:index, :edit]
  end

  scope module: :public do
    root 'homes#top'
    get 'homes/about' => 'homes#about'
    get 'end_users/withdraw_confirm' => 'end_users#withdraw_confirm', as: 'withdraw_confirm'
    patch 'end_users/withdraw' => 'end_users#withdraw', as: 'withdraw'
    get '/end_users/mypage' => 'end_users#show'
    get 'end_users/infomation/edit' => 'end_users#edit', as: 'edit_end_users'
    patch 'end_users/update' => 'end_users#update'
    patch 'carts/:id' => 'carts#update', as: 'update'
    resources :foods, only: [:index, :show]
    resources :carts, only: [:index]
    get '/orders/completed' => 'orders#completed'
    post '/orders/confirm' => 'orders#confirm'
    resources :orders, only: [:index, :show, :new, :create]
    resources :deliveries, only: [:index, :edit, :create, :destroy, :update]
    resources :carts, only: [:index, :create] do
      collection do
        delete 'destroy_all'
      end
    end
    delete 'carts/:id' => 'carts#destroy', as: 'destroy'
  end

  devise_scope :admin do
    post 'admins/sign_in', to: 'admin/sessions#sign_in'
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end



