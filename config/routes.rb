Rails.application.routes.draw do
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
