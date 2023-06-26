class HotelSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :address, :description, :explore_location, :average_rating
end
