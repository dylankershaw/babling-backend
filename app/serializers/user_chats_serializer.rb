class UserChatsSerializer < ActiveModel::Serializer
  attributes :id
  attributes :users, serializer: UserChatsUsersSerializer
  # attributes :users, serializer: UserChatsUsersSerializer
end
