class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :title
      t.text :content
      t.text :reply
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
