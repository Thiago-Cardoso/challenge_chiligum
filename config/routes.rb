Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :informations, only: %i[show]
  	end
  end
end