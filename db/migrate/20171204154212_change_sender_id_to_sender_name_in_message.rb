class ChangeSenderIdToSenderNameInMessage < ActiveRecord::Migration[5.1]
  def change
      rename_column :messages, :sender_id, :sender_name
  end
end
