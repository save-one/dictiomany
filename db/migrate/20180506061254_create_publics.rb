class CreatePublics < ActiveRecord::Migration[5.1]
  def change
    create_table :publics, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
