Rails.application.routes.draw do
  
  resources :users do
    resources :attendances, only: [:create, :update]
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
