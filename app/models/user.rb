class User < ApplicationRecord
    has_many :user_chats
    has_many :chats, through: :user_chats
end
