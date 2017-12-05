class UpdateChatsLanguagesDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :chats, :languages, ["en"]
  end
end
