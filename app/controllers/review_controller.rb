class ReviewController < ApplicationController
  before_action :authenticate_user, except: [:list_hotel_reviews, :destroy_review, :list_restaurant_reviews, :destroy_hotel_review]
  before_action :find_hotel, only: [:hotel_review, :list_hotel_reviews, :destroy_review, :destroy_hotel_review]
  before_action :find_restaurant, only: [:restaurant_review, :destroy_hotel_review]
  include JwtToken


  def list_hotel_reviews
    render json: ReviewSerializer.new(@hotel&.reviews)
  end

  def list_restaurant_reviews
    render json: ReviewSerializer.new(@restaurant&.reviews)
  end


  def hotel_review
    @review = @current_user.reviews.build(review_params)
    @review.hotel_id = @hotel.id
    if @review.save
      rating = @hotel.reviews.average(:rating)&.to_f&.round(1)
      @hotel.update_column(:average_rating,rating)
      render json: ReviewSerializer.new(@review)
    else
      render json: {error: review.errors.full_messages}
    end
  end

  def restaurant_review
    @review = @current_user.reviews.build(review_params)
    @review.restaurant_id = @restaurant.id
    if @review.save
      rating = @restaurant.reviews.average(:rating)&.to_f&.round(1)
      @restaurant.update_column(:average_rating, rating)
      render json: ReviewSerializer.new(@review)
    else
      render json: { error: @review.errors.full_messages }
    end
  end


  def destroy_hotel_review
    if @hotel.present?
      review = @hotel.reviews.find_by(id: params[:id])
      review.destroy
      render json: {message: "Hotel review destoyed successfully"}
    elsif @restaurant.present?
      review = @restaurant.reviews.find_by(id: params[:id])
      review.destroy
      render json: {message: "Restaurant review destoyed successfully"}
    else
      render json: {message: "Try again"}
    end
  end

  private
  def find_hotel
    @hotel = Hotel.find_by(id: params[:hotel_id])
  end


  def find_restaurant
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
  end
    
  def review_params
    params.permit(:rating, :desciption, :user_id)
  end
end


