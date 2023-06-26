class Hotel < ApplicationRecord
  belongs_to :explore_location

  belongs_to :user, optional: true
  has_many :reviews, dependent: :destroy

  before_create :set_average_rating

  def set_average_rating
    self.average_rating = 0
  end
end


