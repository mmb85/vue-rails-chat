Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'

  namespace 'api' do
    namespace 'v1' do
      resources :rooms
      resources :messages
      resources :users
    end
  end
end
