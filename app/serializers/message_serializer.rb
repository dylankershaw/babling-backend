class MessageSerializer < ActiveModel::Serializer
  attributes :id, :chat_id, :sender_name, :created_at, :updated_at
  has_many :translations
end
