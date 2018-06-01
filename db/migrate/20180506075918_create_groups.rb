class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name

      t.timestamps
    end
  end
end
