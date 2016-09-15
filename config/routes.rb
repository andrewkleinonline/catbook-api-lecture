Rails.application.routes.draw do
  # catbook.com/api/v1/cats
  namespace :api do
    module :v1 do
      resources :cats
      resources :hobbies
    end
  end
end
