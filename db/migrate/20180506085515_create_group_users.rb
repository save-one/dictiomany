class CreateGroupUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :group_users do |t|#, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
