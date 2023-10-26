Rails.application.routes.draw do
    root to: 'public/homes#top'
    get "/about" => "public/homes#about", as: "about"

  scope module: :public do
    get 'customer/:id' => 'customers#show', as: "user"
  	get 'customers/quit' => 'customers#quit'
  	patch 'customers/out' => 'customers#out'

    resources :customers, only: [:edit, :update] do
      member do
        get :post_bookmarks
        get :post_comments
      end

      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end

  	resources :posts,only: [:show, :create, :destroy] do
  	  resource :post_bookmarks,only: [:create, :destroy]
  	  resources :post_comments,only: [:create, :destroy]
  	end
    resources :vtuber_informations, only:[:index, :show] do
      collection do
        get :search
      end
    end
    resources :vtuber_communities, only:[:index, :show] do
      collection do
        get :search
        get :tagsearch
      end
      resource :like_vtuber_communities,only: [:create, :destroy]
    end
  end

  namespace :admin do
    root to: 'homes#top'
    resources :customers, only:[:index, :show, :edit, :update] do
      collection do
        get ':id/comment' => "customers#comment", as: "comment"
      end
    end
    resources :posts, only:[:show, :destroy]
    resources :post_comments, only:[:index, :destroy]
    resources :vtuber_informations, only:[:new, :index, :show, :create, :edit, :destroy, :update]
    resources :news, only:[:create, :destroy]
    resources :vtuber_communities, only:[:index, :show] do
      collection do
        get :search
      end
    end
  end

  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions',
  passwords: 'public/passwords'
}

  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
