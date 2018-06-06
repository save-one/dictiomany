class CreateFavoriteDictions < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_dictions do |t|#, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.references :diction, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
