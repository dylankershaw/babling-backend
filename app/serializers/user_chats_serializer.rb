class UserChatsSerializer < ActiveModel::Serializer
  attributes :id
  attributes :users, serializer: UserChatsUsersSerializer
end
