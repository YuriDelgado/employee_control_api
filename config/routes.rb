Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :reports do
      resources :employee_attendances, only: :index
    end
    namespace :admin do
      resources :employees do
        resources :attendances, only: [:create, :update]
      end
      namespace :reports do
        resources :employees_attendances, only: [:index, :show]
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
