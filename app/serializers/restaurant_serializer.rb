class RestaurantSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :address, :explore_location_id, :user_id
end
