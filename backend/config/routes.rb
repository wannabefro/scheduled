Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'api/v1/sessions' }
  root to: 'static#index'
  namespace :api do
    get :csrf, to: 'v1/csrf#index'
    namespace :v1 do
    end
  end
end
