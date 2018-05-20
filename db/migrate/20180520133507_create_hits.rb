class CreateHits < ActiveRecord::Migration[5.1]
  def change
    create_table :hits do |t|
      t.references :public, foreign_key: true
      t.references :meaning, foreign_key: true

      t.timestamps
    end
  end
end
