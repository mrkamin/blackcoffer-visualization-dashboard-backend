Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
# config/routes.rb
namespace :api do
  resources :data_entries, only: [:index, :show]
end

end
