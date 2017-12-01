class UpdateUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :name, :username
    add_column :users, :password, :string
  end
end
