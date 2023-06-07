class HotelSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :address, :desciption, :explore_location_id
end
