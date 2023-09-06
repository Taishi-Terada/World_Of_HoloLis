Rails.application.routes.draw do
    root to: 'public/homes#top'
    get "/about" => "public/homes#about", as: "about"
    
  scope module: :public do
    get 'customers/my_page' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    patch 'customers' => 'customers#update'
  	get 'customers/quit' => 'customers#quit'
  	patch 'customers/out' => 'customers#out'
  	  
  	resources :posts,only: [:create, :destroy]
    resources :post_comments,only: [:index, :create, :destroy] 
    resources :post_bookmarks,only: [:index, :create, :destroy]
    resources :vtuber_informations, only:[:index, :show] do
      collection do
        get :search
      end
    end
    resources :vtuber_communities, only:[:index, :show] do
      collection do
        get :search
      end
    end
    resources :like_vtuber_communities,only: [:create, :destroy]
  end
  
  namespace :admin do
    root to: 'homes#top'
    resources :customers, only:[:index, :show, :edit, :update] do
      collection do
        get ':id/comment' => "customers#comment", as: "comment"
      end
    end
    resources :posts, only:[:destroy]
    resources :post_comments, only:[:destroy]
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
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
