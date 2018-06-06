class CreateDictions < ActiveRecord::Migration[5.1]
  def change
    create_table :dictions do |t|#, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :name
      t.string :category
      t.boolean :public_flg, default: false
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
