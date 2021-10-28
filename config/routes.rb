Rails.application.routes.draw do
  devise_for :users, controllers: {   registrations: 'users/registrations',
                                      sessions: 'users/sessions' }
  
  root to:'homes#top'
  get "home/about" => "homes#about"
  resources :books
  resources :users, only:[:index, :show, :edit, :update]
end
