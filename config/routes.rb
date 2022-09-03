Rails.application.routes.draw do
  root "sections#index"
  resources :sections do
    get 'subs', on: :member
    resources :books
  end
end
