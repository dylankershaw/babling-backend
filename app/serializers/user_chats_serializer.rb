class UserChatsSerializer < ActiveModel::Serializer
  attributes :id
  attributes :users
  # attributes :users, serializer: UserChatsUsersSerializer
end
