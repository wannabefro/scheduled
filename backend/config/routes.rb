Rails.application.routes.draw do
  devise_for :users, controller: { sessions: 'api/v1/sessions' }
  namespace :api do
    namespace :v1 do
      get :csrf, to: 'csrf#index'
    end
  end
end
