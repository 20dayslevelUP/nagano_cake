Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

#管理者側ルーティング
namespace :admin do
  root to: "orders#index" #管理者側TOPページ（行けるか不安）
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:index, :show, :update] do
    resource :order_ditails, only: [:update]
  end
end


#顧客側ルーティング
scope module: :public do

resources :items, only: [:index, :show]
resources :cart_items, only: [:index, :create, :update, :destroy]

resources :orders, only: [:new, :create, :index, :show]

resources :customers, only: [:show, :edit, :update]

resources :addresses, only: [:index, :create, :edit, :update, :destroy]

root to: "homes#top"
get "about" => "homes#about", as: "about"
end

end