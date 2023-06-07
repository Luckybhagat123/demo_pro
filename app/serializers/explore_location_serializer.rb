class ExploreLocationSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :city_name, :desciption
end
