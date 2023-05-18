Rails.application.routes.draw do
  namespace :admin do
    root 'homes#top'
  end

  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'end_users/index'
    get 'end_users/show'
    get 'end_users/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'foods/index'
    get 'foods/new'
    get 'foods/show'
    get 'foods/edit'
  end

  scope module: :public do
    root 'homes#top'
  end

  namespace :public do
    get 'deliveries/index'
    get 'deliveries/edit'
  end
  namespace :public do
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'end_users/show'
    get 'end_users/edit'
  end
  get 'end_users/show'
  get 'end_users/edit'
  namespace :public do
    get 'carts/index'
  end
  namespace :public do
    get 'foods/index'
    get 'foods/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  devise_for :end_users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
