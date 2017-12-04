class ChangeSenderNameToStringInMessage < ActiveRecord::Migration[5.1]
  def change
      change_column :messages, :sender_name, :string
  end
end
