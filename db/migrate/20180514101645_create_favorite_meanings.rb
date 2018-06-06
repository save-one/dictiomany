class CreateFavoriteMeanings < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_meanings do |t|#, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.references :meaning, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
