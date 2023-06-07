class ExploreLocation < ApplicationRecord
  has_many :hotels, dependent: :destroy
  has_many :restaurants, dependent: :destroy 
end