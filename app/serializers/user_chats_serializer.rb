class UserChatsSerializer < ActiveModel::Serializer
  attributes :id
  has_many :users
  # attributes :users, serializer: UserChatsUsersSerializer
end
