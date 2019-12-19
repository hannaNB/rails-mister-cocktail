Rails.application.routes.draw do
  get 'reviews/new'
  # root to: 'cocktails#index'
  resources :cocktails do
    resources :doses, only: [:new, :create] do
      #get 'dose', to: 'cocktails#dose', as: :dose
    end
    resources :reviews, only: [:new, :create] do
    end
  end
  # resources :ingredients
  resources :doses, only: [:destroy]
  resources :reviews, only: [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

