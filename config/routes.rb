Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :admin do
      resources :employees do
        resources :attendances, only: [:create, :update]
      end
    end

  end
  devise_for  :users,
                path: '',
                path_names: {
                  sign_in: 'login',
                  sign_out: 'logout',
                  registration: 'signup'
              },
              controllers: {
                sessions: 'sessions',
                registrations: 'registrations'
              }
end
