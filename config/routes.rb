Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    authenticated :user do
      root 'groups#index', as: :authenticated_root
    end

    unauthenticated do
      root to: 'users#index', as: :unauthenticated_root
    end
  end

  resources :users, only: [:index] do
    resources :groups, only: %i[index show new create destroy] do
      resources :expenses, only: %i[index show new create destroy]
    end
  end
end
