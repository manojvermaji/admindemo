Rails.application.routes.draw do
  resources :avtars
  resources :personal_details
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  resources :posts
  resources :users
  resources :shares
  resources :comments
  resources :likes
  resources :shares do
    resources :likes#, only: [:create]
    delete 'likes/destroy', on: :collection, action: :destroy
  end
  
  resources :shares do
    member do
      post 'share' 
    end
  end
  
  post 'shares/:id/share/:user_id', to: 'shares#share'
  
  resources :images, only: [:create, :index, :show]
  # resources :jobs #, only: [:create, :index, :show, :update, :destroy]

  resources :jobs do
    collection do
      get 'search_job'
    end
  end

  resources :hollydays
  resources :employees

  # resources :employee_attendance
  post '/employee_attendances', to: 'employee_attendance#create'
  post 'employee_attendance/calculate_hours'

end




# resources :shares, only: [:index, :show, :create]
# post 'shares/:id/share/:user_id', to: 'shares#share'