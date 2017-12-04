# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{username: "Peter"}, {username: "James"}])

messages = Message.create([
    {chat_id: 2, sender_name: "Elbin"},
    {chat_id: 2, sender_name: "Dylan"}
])

# translations = Translation.create([
#     {message_id: }
# ])