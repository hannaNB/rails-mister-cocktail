Rails.application.routes.draw do
  # root to: 'cocktails#index'
  resources :cocktails do
    resources :doses, only: [:new, :create] do
      #get 'dose', to: 'cocktails#dose', as: :dose
    end
  end
  # resources :ingredients
  resources :doses, only: [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

