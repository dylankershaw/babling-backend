class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :chats, serializer: UserChatsSerializer
end
