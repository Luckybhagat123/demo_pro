class FollowSerializer
  include JSONAPI::Serializer
  attributes :id, :is_blocked

end
