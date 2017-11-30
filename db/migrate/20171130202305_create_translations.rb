class CreateTranslations < ActiveRecord::Migration[5.1]
  def change
    create_table :translations do |t|
      t.integer :message_id
      t.string :language
      t.string :text

      t.timestamps
    end
  end
end
