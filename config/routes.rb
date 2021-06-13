Rails.application.routes.draw do

  namespace :api do 
    namespace :v1 do
      resources :shelves do 
        resources :books  
      end
    end
  end
end
