class Review < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :hotel, optional: true
  belongs_to :restaurant, optional: true

end

