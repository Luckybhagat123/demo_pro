class ReviewSerializer
  include JSONAPI::Serializer
  attributes :id, :rating, :desciption, :user, :hotel, :restaurant
end
