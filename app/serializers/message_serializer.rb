class MessageSerializer < ActiveModel::Serializer
  attributes :id, :chat_id, :sender_id, :created_at, :updated_at
  has_many :translations
end
