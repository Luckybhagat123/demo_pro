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
  get  '/list_followers_and_followings', to: "user#list_followers_and_followings"
  patch '/block_follow_user', to: "user#block_follow_user" 
  get '/search_follower', to: "user#search_follower"
  get '/search_following', to: "user#search_following"


  resources :explore_locations, only: [:index, :show]
  get '/hotels_list/:explore_location_id', to: "hotels#hotels_list", :as => "hotels_list"
  get '/single_hotel/:explore_location_id/:id', to: "hotels#single_hotel", :as => "single_hotel"
  get 'list_hotel_reviews/:hotel_id', to: "review#list_hotel_reviews", :as => "list_hotel_reviews"
  delete 'destroy_hotel_review/:hotel_id/:id', to: "review#destroy_hotel_review", :as => "destroy_hotel_review"
  get 'list_restaurant_reviews/:restaurant_id', to: "review#list_restaurant_reviews", :as => "list_restaurant_reviews"
  post 'restaurant_review/:restaurant_id', to: "review#restaurant_review", :as => "restaurant_review"
  post 'hotel_review/:hotel_id', to: "review#hotel_review", :as => "hotel_review"

  
  get '/restaurants_list/:explore_location_id', to: "restaurants#restaurants_list", :as => "restaurants_list"
  get '/single_restaurant/:explore_location_id/:id', to: "restaurants#single_restaurant", :as => "single_restaurant"
  get '/hotel_rating/:explore_location_id/:id', to: "hotels#hotel_rating", :as => "hotel_rating"


  resources :review
end









