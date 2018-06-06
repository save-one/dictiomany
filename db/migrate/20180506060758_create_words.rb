class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|#, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name
      t.string :kana
      t.string :category
      t.references :diction, foreign_key: true

      t.timestamps
    end
  end
end
