class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.text :content
      t.references :meaning, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
