Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :user, only: [:create, :index, :show]
  put '/update', to: 'user#update'
  post '/auth/login', to: 'authentication#login'
  get '/birthday_details', to: 'user#birthday_details'
  get '/gen_pdf', to: 'user#gen_pdf'
  post '/verify_otp', to: 'user#verify_otp'
  post '/forget_password', to: 'user#forget_password'
  put '/reset_password', to: 'user#reset_password'
  post '/users/:id/follow', to: "user#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "user#unfollow", as: "unfollow_user"
  get  '/show_followers', to: "user#show_followers"
  patch '/block_follow_user', to: "user#block_follow_user" 
end
