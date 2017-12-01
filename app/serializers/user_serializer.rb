class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  # has_many :chats, serializer: UserChatsSerializer
  has_many :chats, embed: :ids, include: false
end
