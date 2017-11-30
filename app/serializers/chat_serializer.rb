class ChatSerializer < ActiveModel::Serializer
  attributes :id, :languages
  has_many :messages
  has_many :users
end
